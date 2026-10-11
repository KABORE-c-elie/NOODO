import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/category_lexicon.dart';
import 'package:noodo/features/transactions/domain/parser/french_text.dart';
import 'package:noodo/features/transactions/domain/parser/parse_result.dart';
import 'package:noodo/features/transactions/domain/parser/parser_token.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

const _saleVerbs = {
  'vendu',
  'vendue',
  'vendus',
  'vendues',
  'vendre',
  'vends',
  'vend',
  'encaisse',
  'encaissee',
  'encaisses',
  'encaissees',
  'encaisser',
  'recu',
  'recue',
  'recus',
  'recues',
  'recevoir',
};

const _expenseVerbs = {
  'paye',
  'payee',
  'payes',
  'payees',
  'payer',
  'paie',
  'achete',
  'achetee',
  'achetes',
  'achetees',
  'acheter',
  'depense',
  'depensee',
  'depenses',
  'depensees',
  'depenser',
  'donne',
  'donnee',
  'donnes',
  'donner',
};

const _currencies = {'f', 'fr', 'frs', 'franc', 'francs', 'fcfa', 'cfa'};

const _linkers = {'de', 'd', 'du', 'des'};

const _separators = {',', ';', '.', '!', '?', 'et', 'puis', 'ensuite', 'apres'};

const _punctuation = {',', ';', '.', '!', '?'};

const _perUnitWords = {'chacun', 'chacune', 'chaque', 'unite', 'piece'};

const _perUnitArticles = {'le', 'la', 'l', 'par'};

const _stopWords = {
  'a',
  'au',
  'aux',
  'pour',
  'le',
  'la',
  'les',
  'l',
  'et',
  'ou',
  'j',
  'jai',
  'ai',
  'je',
  'il',
  'elle',
  'on',
  'm',
  'me',
  'mon',
  'ma',
  'mes',
  'avec',
  'chez',
  'en',
  'sur',
  'par',
  'ce',
  'cette',
  'ces',
  'qu',
  'que',
  'n',
  'ne',
  'pas',
  'y',
  'son',
  'sa',
  'ses',
  'fait',
  'aujourd',
  'hui',
  'hier',
  'matin',
  'soir',
  'paiement',
  'argent',
  'somme',
  'prix',
  'total',
};

const _minimumLooseAmount = 5;
const _minimumReinterpretedAmount = 50;
const _maxProductWords = 3;

final class _Detail {
  const _Detail({
    this.quantity,
    this.unit,
    this.unknownUnitText,
    this.product,
    required this.end,
  });

  final double? quantity;
  final LocalUnit? unit;
  final String? unknownUnitText;
  final String? product;
  final int end;

  _Detail withoutQuantity() => _Detail(product: product, end: end);
}

final class TransactionParser {
  const TransactionParser({this.lexicon = CategoryLexicon.standard});

  final CategoryLexicon lexicon;

  ParseResult parse(String text, List<LocalUnit> units) =>
      _analyze(tokenize(text), units);

  List<ParseResult> parseAll(String text, List<LocalUnit> units) {
    final tokens = tokenize(text);
    final groups = _group(_split(tokens), units);
    if (groups.length <= 1) return [_analyze(tokens, units)];
    final results = <ParseResult>[];
    TransactionType? previousType;
    for (final group in groups) {
      final result = _analyze(group, units, inheritedType: previousType);
      results.add(result);
      previousType = result.type ?? previousType;
    }
    return results;
  }

  List<List<ParserToken>> _split(List<ParserToken> tokens) {
    final pieces = <List<ParserToken>>[[]];
    for (final token in tokens) {
      if (!token.isNumber && _separators.contains(token.folded)) {
        if (pieces.last.isNotEmpty) pieces.add([]);
      } else {
        pieces.last.add(token);
      }
    }
    return [
      for (final piece in pieces)
        if (piece.isNotEmpty) piece,
    ];
  }

  List<List<ParserToken>> _group(
    List<List<ParserToken>> pieces,
    List<LocalUnit> units,
  ) {
    bool hasAmount(List<ParserToken> piece) =>
        _analyze(piece, units).amountFcfa != null;

    final withSubject = <List<ParserToken>>[];
    for (final piece in pieces) {
      if (withSubject.isNotEmpty && !_hasVerb(piece) && !hasAmount(piece)) {
        withSubject.last = [...withSubject.last, ...piece];
      } else {
        withSubject.add(piece);
      }
    }

    final groups = <List<ParserToken>>[];
    for (final piece in withSubject) {
      if (groups.isNotEmpty && !hasAmount(groups.last) && !_hasVerb(piece)) {
        groups.last = [...groups.last, ...piece];
      } else {
        groups.add(piece);
      }
    }
    return groups;
  }

  bool _hasVerb(List<ParserToken> tokens) => tokens.any(
    (token) =>
        _saleVerbs.contains(token.folded) ||
        _expenseVerbs.contains(token.folded),
  );

  ParseResult _analyze(
    List<ParserToken> tokens,
    List<LocalUnit> units, {
    TransactionType? inheritedType,
  }) {
    int? explicitAmount;
    int? explicitIndex;
    _Detail? detail;
    final looseNumbers = <(int, double)>[];
    for (var i = 0; i < tokens.length; i++) {
      final token = tokens[i];
      if (!token.isNumber) continue;
      if (_isCurrency(tokens, i + 1)) {
        if (explicitAmount == null) {
          explicitAmount = _asAmount(token.number!);
          explicitIndex = i;
        }
        continue;
      }
      final match = _matchDetail(tokens, i, units);
      if (match != null) {
        detail ??= match;
        continue;
      }
      if (!token.isFraction && !token.isSpelledOne) {
        looseNumbers.add((i, token.number!));
      }
    }

    var stated = explicitAmount;
    var statedIndex = explicitIndex;
    final isAmountExplicit = stated != null;
    if (stated == null) {
      final loose = _largestLooseAmount(looseNumbers);
      stated = loose?.$2;
      statedIndex = loose?.$1;
    }
    if (stated == null && detail != null && _isBareAmount(detail)) {
      stated = detail.quantity!.toInt();
      detail = detail.withoutQuantity();
    }

    final quantity = detail?.quantity;
    final perUnit =
        stated != null &&
        statedIndex != null &&
        quantity != null &&
        _isPerUnit(tokens, statedIndex, detail!, isExplicit: isAmountExplicit);
    final amount = stated == null
        ? null
        : perUnit
        ? (stated * quantity).round()
        : stated;

    final product = detail?.product ?? _firstLexiconWord(tokens);
    final category = _classify(product, tokens);
    final type =
        _detectType(tokens) ??
        (_hasVerb(tokens) ? null : _inherit(inheritedType, category));

    return ParseResult(
      type: type,
      amountFcfa: amount,
      quantity: quantity,
      unit: detail?.unit,
      unknownUnitText: detail?.unknownUnitText,
      product: product,
      category: category,
      statedPriceFcfa: stated,
      priceBasis: perUnit ? PriceBasis.perUnit : PriceBasis.total,
      confidence: _confidence(
        type: type,
        amount: amount,
        isAmountExplicit: isAmountExplicit,
        category: category,
        unit: detail?.unit,
        unknownUnitText: detail?.unknownUnitText,
        product: product,
      ),
    );
  }

  TransactionType? _inherit(
    TransactionType? inherited,
    TransactionCategory category,
  ) =>
      inherited == TransactionType.sale &&
          category == TransactionCategory.transport
      ? null
      : inherited;

  bool _isPerUnit(
    List<ParserToken> tokens,
    int amountIndex,
    _Detail detail, {
    required bool isExplicit,
  }) {
    final linkerIndex = amountIndex - 1;
    if (_isLinker(tokens, linkerIndex) &&
        (linkerIndex == detail.end ||
            (isExplicit && linkerIndex > detail.end))) {
      return true;
    }
    var next = amountIndex + 1;
    while (_isCurrency(tokens, next)) {
      next++;
    }
    if (next >= tokens.length) return false;
    final word = tokens[next].folded;
    if (_perUnitWords.contains(word)) return true;
    if (!_perUnitArticles.contains(word) || next + 1 >= tokens.length) {
      return false;
    }
    final target = tokens[next + 1];
    final unitName = detail.unit?.name ?? detail.unknownUnitText;
    return _perUnitWords.contains(target.folded) ||
        (unitName != null &&
            (sameFrenchWord(target.raw, unitName) ||
                sameFrenchWord(unitName, target.raw)));
  }

  TransactionType? _detectType(List<ParserToken> tokens) {
    final isSale = tokens.any((token) => _saleVerbs.contains(token.folded));
    final isExpense = tokens.any(
      (token) => _expenseVerbs.contains(token.folded),
    );
    if (isSale == isExpense) return null;
    return isSale ? TransactionType.sale : TransactionType.expense;
  }

  bool _isCurrency(List<ParserToken> tokens, int index) =>
      index < tokens.length && _currencies.contains(tokens[index].folded);

  bool _isLinker(List<ParserToken> tokens, int index) =>
      index >= 0 &&
      index < tokens.length &&
      _linkers.contains(tokens[index].folded);

  bool _isNoun(List<ParserToken> tokens, int index) {
    if (index >= tokens.length) return false;
    final token = tokens[index];
    return !token.isNumber &&
        !_punctuation.contains(token.folded) &&
        !_stopWords.contains(token.folded) &&
        !_linkers.contains(token.folded) &&
        !_currencies.contains(token.folded) &&
        !_perUnitWords.contains(token.folded) &&
        !_saleVerbs.contains(token.folded) &&
        !_expenseVerbs.contains(token.folded);
  }

  int? _asAmount(double value) =>
      value > 0 && value == value.roundToDouble() ? value.toInt() : null;

  (int, int)? _largestLooseAmount(List<(int, double)> numbers) {
    (int, int)? largest;
    for (final (index, value) in numbers) {
      final amount = _asAmount(value);
      if (amount == null || amount < _minimumLooseAmount) continue;
      if (largest == null || amount > largest.$2) largest = (index, amount);
    }
    return largest;
  }

  bool _isBareAmount(_Detail detail) =>
      detail.unit == null &&
      detail.unknownUnitText == null &&
      (_asAmount(detail.quantity!) ?? 0) >= _minimumReinterpretedAmount;

  _Detail? _matchDetail(
    List<ParserToken> tokens,
    int index,
    List<LocalUnit> units,
  ) {
    final quantityToken = tokens[index];
    var next = index + 1;
    if (quantityToken.isFraction) {
      if (_isLinker(tokens, next)) next++;
      if (next < tokens.length && tokens[next].isSpelledOne) next++;
    }

    final unit = _matchUnit(tokens, next, units);
    if (unit != null) {
      final productStart = next + 1;
      return _Detail(
        quantity: quantityToken.number,
        unit: unit,
        product: _isLinker(tokens, productStart)
            ? _readProduct(tokens, productStart + 1)
            : null,
        end: productStart,
      );
    }

    if (!_isNoun(tokens, next)) return null;
    if (_isLinker(tokens, next + 1) && _isNoun(tokens, next + 2)) {
      return _Detail(
        quantity: quantityToken.number,
        unknownUnitText: tokens[next].raw,
        product: _readProduct(tokens, next + 2),
        end: next + 1,
      );
    }
    return _Detail(
      quantity: quantityToken.number,
      product: _readProduct(tokens, next),
      end: next + 1,
    );
  }

  LocalUnit? _matchUnit(
    List<ParserToken> tokens,
    int index,
    List<LocalUnit> units,
  ) {
    if (index >= tokens.length || tokens[index].isNumber) return null;
    for (final unit in units) {
      if (sameFrenchWord(tokens[index].raw, unit.name)) return unit;
    }
    return null;
  }

  String? _readProduct(List<ParserToken> tokens, int start) {
    final words = <String>[];
    var index = start;
    while (words.length < _maxProductWords && _isNoun(tokens, index)) {
      words.add(tokens[index].raw);
      index++;
    }
    return words.isEmpty ? null : words.join(' ');
  }

  String? _firstLexiconWord(List<ParserToken> tokens) {
    for (final token in tokens) {
      if (!token.isNumber && lexicon.match(token.raw) != null) return token.raw;
    }
    return null;
  }

  TransactionCategory _classify(String? product, List<ParserToken> tokens) {
    final fromProduct = lexicon.classify(product?.split(' ') ?? const []);
    if (fromProduct != TransactionCategory.other) return fromProduct;
    return lexicon.classify([
      for (var i = 0; i < tokens.length; i++)
        if (_isNoun(tokens, i)) tokens[i].raw,
    ]);
  }

  double _confidence({
    required TransactionType? type,
    required int? amount,
    required bool isAmountExplicit,
    required TransactionCategory category,
    required LocalUnit? unit,
    required String? unknownUnitText,
    required String? product,
  }) {
    var score = 0.0;
    if (type != null) score += 0.35;
    if (amount != null) score += isAmountExplicit ? 0.35 : 0.25;
    if (category != TransactionCategory.other) score += 0.15;
    if (unit != null || (product != null && unknownUnitText == null)) {
      score += 0.15;
    } else if (product != null || unknownUnitText != null) {
      score += 0.1;
    }
    if (type == null || amount == null) score *= 0.5;
    return (score.clamp(0, 1) * 100).round() / 100;
  }
}

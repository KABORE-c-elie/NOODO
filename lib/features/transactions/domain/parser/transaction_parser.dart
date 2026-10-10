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
  const _Detail({this.quantity, this.unit, this.unknownUnitText, this.product});

  final double? quantity;
  final LocalUnit? unit;
  final String? unknownUnitText;
  final String? product;
}

final class TransactionParser {
  const TransactionParser({this.lexicon = CategoryLexicon.standard});

  final CategoryLexicon lexicon;

  ParseResult parse(String text, List<LocalUnit> units) {
    final tokens = tokenize(text);
    final type = _detectType(tokens);

    int? explicitAmount;
    _Detail? detail;
    final looseNumbers = <double>[];
    for (var i = 0; i < tokens.length; i++) {
      final token = tokens[i];
      if (!token.isNumber) continue;
      if (_isCurrency(tokens, i + 1)) {
        explicitAmount ??= _asAmount(token.number!);
        continue;
      }
      final match = _matchDetail(tokens, i, units);
      if (match != null) {
        detail ??= match;
        continue;
      }
      if (!token.isFraction && !token.isSpelledOne) {
        looseNumbers.add(token.number!);
      }
    }

    var amount = explicitAmount;
    final isAmountExplicit = amount != null;
    amount ??= _largestLooseAmount(looseNumbers);
    if (amount == null && detail != null && _isBareAmount(detail)) {
      amount = detail.quantity!.toInt();
      detail = _Detail(product: detail.product);
    }

    final product = detail?.product ?? _firstLexiconWord(tokens);
    final category = _classify(product, tokens);

    return ParseResult(
      type: type,
      amountFcfa: amount,
      quantity: detail?.quantity,
      unit: detail?.unit,
      unknownUnitText: detail?.unknownUnitText,
      product: product,
      category: category,
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
      index < tokens.length && _linkers.contains(tokens[index].folded);

  bool _isNoun(List<ParserToken> tokens, int index) {
    if (index >= tokens.length) return false;
    final token = tokens[index];
    return !token.isNumber &&
        !_stopWords.contains(token.folded) &&
        !_linkers.contains(token.folded) &&
        !_currencies.contains(token.folded) &&
        !_saleVerbs.contains(token.folded) &&
        !_expenseVerbs.contains(token.folded);
  }

  int? _asAmount(double value) =>
      value > 0 && value == value.roundToDouble() ? value.toInt() : null;

  int? _largestLooseAmount(List<double> numbers) {
    final amounts = numbers
        .map(_asAmount)
        .whereType<int>()
        .where((value) => value >= _minimumLooseAmount);
    if (amounts.isEmpty) return null;
    return amounts.reduce((a, b) => a > b ? a : b);
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
      );
    }

    if (!_isNoun(tokens, next)) return null;
    if (_isLinker(tokens, next + 1) && _isNoun(tokens, next + 2)) {
      return _Detail(
        quantity: quantityToken.number,
        unknownUnitText: tokens[next].raw,
        product: _readProduct(tokens, next + 2),
      );
    }
    return _Detail(
      quantity: quantityToken.number,
      product: _readProduct(tokens, next),
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

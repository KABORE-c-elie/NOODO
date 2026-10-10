import 'package:noodo/features/transactions/domain/parser/french_text.dart';

final class ParserToken {
  ParserToken.word(this.raw)
    : folded = foldFrench(raw),
      number = null,
      isFraction = false,
      isSpelledOne = false;

  ParserToken.number(
    this.raw,
    double this.number, {
    this.isFraction = false,
    this.isSpelledOne = false,
  }) : folded = foldFrench(raw);

  final String raw;
  final String folded;
  final double? number;
  final bool isFraction;
  final bool isSpelledOne;

  bool get isNumber => number != null;
}

const _unitWords = {
  'un': 1,
  'une': 1,
  'deux': 2,
  'trois': 3,
  'quatre': 4,
  'cinq': 5,
  'six': 6,
  'sept': 7,
  'huit': 8,
  'neuf': 9,
  'dix': 10,
  'onze': 11,
  'douze': 12,
  'treize': 13,
  'quatorze': 14,
  'quinze': 15,
  'seize': 16,
  'vingt': 20,
  'vingts': 20,
  'trente': 30,
  'quarante': 40,
  'cinquante': 50,
  'soixante': 60,
};
const _hundredWords = {'cent', 'cents'};
const _thousandWord = 'mille';
const _fractionWords = {'demi', 'demie', 'moitie'};

final _groupedThousands = RegExp(r'(?<![\d.,])\d{1,3}(?:[ .  ]\d{3})+(?!\d)');
final _groupSeparator = RegExp(r'[ .  ]');
final _lexeme = RegExp(r'\d+(?:[.,]\d+)?|[\p{L}\p{M}]+', unicode: true);

List<ParserToken> tokenize(String text) {
  final normalized = text.toLowerCase().replaceAllMapped(
    _groupedThousands,
    (match) => match[0]!.replaceAll(_groupSeparator, ''),
  );
  final lexemes = _lexeme
      .allMatches(normalized)
      .map((match) => match[0]!)
      .toList();
  return _mergeFractions(_mergeNumbers(lexemes));
}

bool _isMultiplier(String folded) =>
    folded == _thousandWord || _hundredWords.contains(folded);

bool _isNumberWord(String folded) =>
    _unitWords.containsKey(folded) || _isMultiplier(folded);

List<ParserToken> _mergeNumbers(List<String> lexemes) {
  final tokens = <ParserToken>[];
  var i = 0;
  while (i < lexemes.length) {
    final lexeme = lexemes[i];
    final digits = double.tryParse(lexeme.replaceAll(',', '.'));
    if (digits == null && !_isNumberWord(foldFrench(lexeme))) {
      tokens.add(ParserToken.word(lexeme));
      i++;
      continue;
    }

    var total = 0.0;
    var current = digits ?? 0.0;
    var j = digits == null ? i : i + 1;
    while (j < lexemes.length) {
      final word = foldFrench(lexemes[j]);
      if (!_isNumberWord(word)) break;
      if (digits != null && j == i + 1 && !_isMultiplier(word)) break;
      if (word == _thousandWord) {
        total += (current == 0 ? 1 : current) * 1000;
        current = 0;
      } else if (_hundredWords.contains(word)) {
        current = (current == 0 ? 1 : current) * 100;
      } else {
        current += _unitWords[word]!;
      }
      j++;
    }

    final value = total + current;
    tokens.add(
      ParserToken.number(
        lexemes.sublist(i, j).join(' '),
        value,
        isSpelledOne: digits == null && j == i + 1 && value == 1,
      ),
    );
    i = j;
  }
  return tokens;
}

List<ParserToken> _mergeFractions(List<ParserToken> tokens) {
  final merged = <ParserToken>[];
  for (final token in tokens) {
    if (token.isNumber || !_fractionWords.contains(token.folded)) {
      merged.add(token);
      continue;
    }

    final previous = merged.isEmpty ? null : merged.last;
    final beforePrevious = merged.length < 2 ? null : merged[merged.length - 2];
    if (previous != null && previous.isSpelledOne) {
      merged
        ..removeLast()
        ..add(
          ParserToken.number(
            '${previous.raw} ${token.raw}',
            0.5,
            isFraction: true,
          ),
        );
    } else if (previous?.folded == 'et' && beforePrevious != null) {
      final base = beforePrevious.number;
      if (base != null) {
        merged
          ..removeRange(merged.length - 2, merged.length)
          ..add(
            ParserToken.number(
              '${beforePrevious.raw} et ${token.raw}',
              base + 0.5,
            ),
          );
      } else {
        merged.add(ParserToken.number(token.raw, 0.5, isFraction: true));
      }
    } else {
      merged.add(ParserToken.number(token.raw, 0.5, isFraction: true));
    }
  }
  return merged;
}

const _foldedChars = {
  'à': 'a',
  'â': 'a',
  'ä': 'a',
  'á': 'a',
  'ç': 'c',
  'é': 'e',
  'è': 'e',
  'ê': 'e',
  'ë': 'e',
  'î': 'i',
  'ï': 'i',
  'í': 'i',
  'ô': 'o',
  'ö': 'o',
  'ó': 'o',
  'ù': 'u',
  'û': 'u',
  'ü': 'u',
  'ú': 'u',
  'ÿ': 'y',
  'œ': 'oe',
  'æ': 'ae',
};

bool _isCombiningMark(int rune) => rune >= 0x0300 && rune <= 0x036F;

String foldFrench(String input) {
  final buffer = StringBuffer();
  for (final rune in input.toLowerCase().runes) {
    if (_isCombiningMark(rune)) continue;
    final char = String.fromCharCode(rune);
    buffer.write(_foldedChars[char] ?? char);
  }
  return buffer.toString();
}

Set<String> singularForms(String folded) => {
  folded,
  if (folded.length > 2 && (folded.endsWith('s') || folded.endsWith('x')))
    folded.substring(0, folded.length - 1),
};

bool sameFrenchWord(String word, String reference) =>
    singularForms(foldFrench(word)).contains(foldFrench(reference));

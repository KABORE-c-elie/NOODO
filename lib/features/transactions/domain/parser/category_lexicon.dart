import 'package:noodo/features/transactions/domain/parser/french_text.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

final class CategoryLexicon {
  const CategoryLexicon(this.keywords);

  final Map<TransactionCategory, Set<String>> keywords;

  static const standard = CategoryLexicon({
    TransactionCategory.vegetables: {
      'légume',
      'tomate',
      'oignon',
      'piment',
      'gombo',
      'aubergine',
      'chou',
      'carotte',
      'salade',
      'poivron',
      'haricot',
      'oseille',
      'épinard',
      'concombre',
      'courgette',
      'patate',
      'igname',
      'manioc',
    },
    TransactionCategory.cereals: {
      'céréale',
      'riz',
      'maïs',
      'mil',
      'sorgho',
      'fonio',
      'blé',
      'farine',
      'niébé',
    },
    TransactionCategory.transport: {
      'transport',
      'taxi',
      'moto',
      'tricycle',
      'bus',
      'essence',
      'carburant',
      'gasoil',
    },
    TransactionCategory.supplies: {
      'fourniture',
      'emballage',
      'plastique',
      'bassine',
      'seau',
      'savon',
      'balance',
      'cahier',
      'stylo',
      'glace',
    },
  });

  CategoryLexicon withKeywords(
    TransactionCategory category,
    Iterable<String> words,
  ) => CategoryLexicon({
    ...keywords,
    category: {...?keywords[category], ...words},
  });

  TransactionCategory? match(String word) {
    for (final entry in keywords.entries) {
      if (entry.value.any((keyword) => sameFrenchWord(word, keyword))) {
        return entry.key;
      }
    }
    return null;
  }

  TransactionCategory classify(Iterable<String> words) {
    for (final word in words) {
      final category = match(word);
      if (category != null) return category;
    }
    return TransactionCategory.other;
  }
}

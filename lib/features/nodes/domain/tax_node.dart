import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_node.freezed.dart';

@freezed
abstract class TaxNode with _$TaxNode {
  const TaxNode._();

  static const defaultId = 'tax';
  static const defaultRateBasisPoints = 500;

  const factory TaxNode({
    required String id,
    required int rateBasisPoints,
    required int savedBalanceFcfa,
    DateTime? nextDueDate,
  }) = _TaxNode;

  factory TaxNode.initial() => const TaxNode(
    id: defaultId,
    rateBasisPoints: defaultRateBasisPoints,
    savedBalanceFcfa: 0,
  );

  double get ratePercent => rateBasisPoints / 100;
}

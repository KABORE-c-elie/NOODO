import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_node.freezed.dart';

@freezed
abstract class TaxNode with _$TaxNode {
  const TaxNode._();

  const factory TaxNode({
    required String id,
    required int rateBasisPoints,
    required int savedBalanceFcfa,
  }) = _TaxNode;

  double get ratePercent => rateBasisPoints / 100;
}

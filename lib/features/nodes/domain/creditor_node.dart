import 'package:freezed_annotation/freezed_annotation.dart';

part 'creditor_node.freezed.dart';

@freezed
abstract class CreditorNode with _$CreditorNode {
  const factory CreditorNode({
    required String id,
    required String supplierName,
    String? phone,
    required int balanceDueFcfa,
    DateTime? dueDate,
  }) = _CreditorNode;
}

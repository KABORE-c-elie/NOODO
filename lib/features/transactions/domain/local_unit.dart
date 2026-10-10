import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_unit.freezed.dart';

@freezed
abstract class LocalUnit with _$LocalUnit {
  const factory LocalUnit({
    required String id,
    required String name,
    @Default(false) bool isCustom,
  }) = _LocalUnit;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<L, E> with _$Result {
  const factory Result.value(L value) = _Data;
  const factory Result.error(E value) = _Error;
  const factory Result.none() = _None;
}

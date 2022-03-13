import 'package:freezed_annotation/freezed_annotation.dart';

part 'statement.freezed.dart';

@freezed
class Statement with _$Statement {
  const factory Statement(
      {final String? id,
      required final DateTime date,
      required final String description,
      required final double credit,
      required final double debit,
      final double? balance}) = _Statement;
}

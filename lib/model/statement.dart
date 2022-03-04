import 'package:equatable/equatable.dart';

class Statement extends Equatable {
  final int? siNo;
  final DateTime date;
  final String description;
  final double credit;
  final double debit;
  final double? balance;

  Statement(
      {this.siNo,
      required this.date,
      required this.description,
      required this.credit,
      required this.debit,
      this.balance});

  @override
  List<Object?> get props => [siNo, date, description, credit, debit, balance];

  Statement copyWith(
      {int? siNo,
      DateTime? date,
      String? description,
      double? credit,
      double? debit,
      double? balance}) {
    return Statement(
      siNo: siNo ?? this.siNo,
      date: date ?? this.date,
      description: description ?? this.description,
      credit: credit ?? this.credit,
      debit: debit ?? this.debit,
      balance: balance ?? this.balance,
    );
  }
}

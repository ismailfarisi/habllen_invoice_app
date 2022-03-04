// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      id: json['id'] as String?,
      companyId: json['companyId'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'remarks': instance.remarks,
    };

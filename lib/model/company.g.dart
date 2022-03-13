// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      companyName: json['companyName'] as String,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      gst: json['gst'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'gst': instance.gst,
      'logo': instance.logo,
    };

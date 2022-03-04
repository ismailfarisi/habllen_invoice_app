part of 'company_profile_bloc.dart';

@freezed
class CompanyProfileState with _$CompanyProfileState {
  const factory CompanyProfileState({
    @Default(const InputString.pure()) InputString companyName,
    @Default(const InputString.pure()) InputString companyAddress1,
    @Default(const InputString.pure()) InputString companyAddress2,
    @Default(const InputGst.pure()) InputGst gst,
    @Default(const InputString.pure()) InputString companyPhone,
    @Default(const InputString.pure()) InputString companyEmail,
  }) = _CompanyProfileState;
}

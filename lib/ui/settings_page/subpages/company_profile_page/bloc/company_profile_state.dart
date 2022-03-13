part of 'company_profile_bloc.dart';

@freezed
class CompanyProfileState with _$CompanyProfileState {
  const factory CompanyProfileState({
    @Default(const InputString.pure()) InputString companyName,
    @Default(const InputString.pure()) InputString companyCity,
    @Default(const InputString.pure()) InputString companyState,
    @Default(const InputString.pure()) InputString companyCountry,
    @Default(const InputIdCode.pure()) InputIdCode companyPostalCode,
    @Default(const InputGst.pure()) InputGst gst,
    @Default(const InputString.pure()) InputString companyPhone,
    @Default(const InputString.pure()) InputString companyEmail,
    @Default(const InputString.pure()) InputString companyWebsite,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _CompanyProfileState;
}

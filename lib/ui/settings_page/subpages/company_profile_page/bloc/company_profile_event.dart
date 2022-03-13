part of 'company_profile_bloc.dart';

@freezed
class CompanyProfileEvent with _$CompanyProfileEvent {
  const factory CompanyProfileEvent.companyNameChanged(String name) =
      CompanyNameChanged;
  const factory CompanyProfileEvent.companyCityChanged(String city) =
      CompanyCityChanged;
  const factory CompanyProfileEvent.postCodeChanged(String postCode) =
      CompanyPostCodeChanged;
  const factory CompanyProfileEvent.companyStateChanged(String state) =
      CompanyStateChanged;
  const factory CompanyProfileEvent.companyCountryChanged(String country) =
      CompanyCountryChanged;
  const factory CompanyProfileEvent.companyGstChanged(String gst) =
      CompanyGstChanged;
  const factory CompanyProfileEvent.companyPhoneChanged(String phone) =
      CompanyPhoneChanged;
  const factory CompanyProfileEvent.companyEmailChanged(String email) =
      CompanyEmailChanged;
  const factory CompanyProfileEvent.saved() = Saved;
}

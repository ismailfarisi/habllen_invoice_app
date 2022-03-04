part of 'company_profile_bloc.dart';

@freezed
class CompanyProfileEvent with _$CompanyProfileEvent {
  const factory CompanyProfileEvent.companyNameChanged(String name) =
      CompanyNameChanged;
  const factory CompanyProfileEvent.companyAddress1Changed(String address) =
      CompanyAddress1Changed;
  const factory CompanyProfileEvent.companyAddress2Changed(String address) =
      CompanyAddress2Changed;
  const factory CompanyProfileEvent.companyPhoneChanged(String phone) =
      PhoneChanged;
  const factory CompanyProfileEvent.companyEmailChanged(String email) =
      EmailChanged;
  const factory CompanyProfileEvent.onSaved() = OnSaved;
}

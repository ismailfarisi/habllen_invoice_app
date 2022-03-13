import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/forms_validator/validator.dart';

part 'company_profile_event.dart';
part 'company_profile_state.dart';
part 'company_profile_bloc.freezed.dart';

class CompanyProfileBloc
    extends Bloc<CompanyProfileEvent, CompanyProfileState> {
  CompanyProfileBloc({required this.repository})
      : super(CompanyProfileState()) {
    on<CompanyNameChanged>(_onCompanyNameChanged);
    on<CompanyCityChanged>(_onCompanyCityChanged);
    on<CompanyStateChanged>(_onCompanyStateChanged);
    on<CompanyCountryChanged>(_onCompanyCountryChanged);
    on<CompanyPostCodeChanged>(_onCompanyPostCodeChanged);
    on<CompanyGstChanged>(_onCompanyGstChanged);
    on<CompanyEmailChanged>(_onCompanyEmailChanged);
    on<CompanyPhoneChanged>(_onCompanyPhoneChanged);
    on<Saved>(_onSaved);
  }
  final Repository repository;

  FutureOr<void> _onCompanyNameChanged(
      CompanyNameChanged event, Emitter<CompanyProfileState> emit) {
    final name = InputString.dirty(event.name);
    emit(state.copyWith(
        companyName: name,
        status:
            Formz.validate(_validateCompanyProfile(state, companyName: name))));
  }

  FutureOr<void> _onCompanyCityChanged(
      CompanyCityChanged event, Emitter<CompanyProfileState> emit) {
    final city = InputString.dirty(event.city);

    emit(state.copyWith(
        companyCity: city,
        status:
            Formz.validate(_validateCompanyProfile(state, companyCity: city))));
  }

  FutureOr<void> _onCompanyStateChanged(
      CompanyStateChanged event, Emitter<CompanyProfileState> emit) {
    final companyState = InputString.dirty(event.state);
    emit(state.copyWith(
        companyState: companyState,
        status: Formz.validate(
            _validateCompanyProfile(state, companyState: companyState))));
  }

  FutureOr<void> _onCompanyCountryChanged(
      CompanyCountryChanged event, Emitter<CompanyProfileState> emit) {
    final companyCountry = InputString.dirty(event.country);
    emit(state.copyWith(
        companyCountry: companyCountry,
        status: Formz.validate(
            _validateCompanyProfile(state, companyCountry: companyCountry))));
  }

  FutureOr<void> _onCompanyPostCodeChanged(
      CompanyPostCodeChanged event, Emitter<CompanyProfileState> emit) {
    final companyPostCode = InputIdCode.dirty(int.tryParse(event.postCode));
    emit(state.copyWith(
        companyPostalCode: companyPostCode,
        status: Formz.validate(
            _validateCompanyProfile(state, companyPostCode: companyPostCode))));
  }

  FutureOr<void> _onCompanyGstChanged(
      CompanyGstChanged event, Emitter<CompanyProfileState> emit) {
    final companyGst = InputGst.dirty(event.gst);
    emit(state.copyWith(
        gst: companyGst,
        status: Formz.validate(
            _validateCompanyProfile(state, companyGst: companyGst))));
  }

  FutureOr<void> _onCompanyEmailChanged(
      CompanyEmailChanged event, Emitter<CompanyProfileState> emit) {
    final companyEmail = InputString.dirty(event.email);
    emit(state.copyWith(
        companyEmail: companyEmail,
        status: Formz.validate(
            _validateCompanyProfile(state, companyEmail: companyEmail))));
  }

  FutureOr<void> _onCompanyPhoneChanged(
      CompanyPhoneChanged event, Emitter<CompanyProfileState> emit) {
    final companyPhone = InputString.dirty(event.phone);
    emit(state.copyWith(
        companyPhone: companyPhone,
        status: Formz.validate(
            _validateCompanyProfile(state, companyPhone: companyPhone))));
  }

  FutureOr<void> _onSaved(event, Emitter<CompanyProfileState> emit) {}
}

List<FormzInput> _validateCompanyProfile(CompanyProfileState state,
    {InputString? companyName,
    InputString? companyCity,
    InputString? companyState,
    InputString? companyCountry,
    InputIdCode? companyPostCode,
    InputGst? companyGst,
    InputString? companyEmail,
    InputString? companyPhone}) {
  final companyNameL = companyName ?? state.companyName;
  final companyCityL = companyCity ?? state.companyCity;
  final companyStateL = companyState ?? state.companyState;
  final companyCountryL = companyCountry ?? state.companyCountry;
  final companyPostCodeL = companyPostCode ?? state.companyPostalCode;
  final companyGstL = companyGst ?? state.gst;
  final companyEmailL = companyEmail ?? state.companyEmail;
  final companyPhoneL = companyPhone ?? state.companyPhone;
  return [
    companyNameL,
    if (!companyCityL.pure) companyCityL,
    if (!companyStateL.pure) companyStateL,
    if (!companyCountryL.pure) companyCountryL,
    if (!companyPostCodeL.pure) companyPostCodeL,
    if (!companyGstL.pure) companyGstL,
    if (!companyEmailL.pure) companyEmailL,
    if (!companyPhoneL.pure) companyPhoneL,
  ];
}

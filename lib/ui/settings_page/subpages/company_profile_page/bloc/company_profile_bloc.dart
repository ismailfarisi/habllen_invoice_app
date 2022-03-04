import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
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
    on<CompanyProfileEvent>((event, emit) {});
  }
  final Repository repository;
}

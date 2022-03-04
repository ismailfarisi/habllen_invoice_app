import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/customer_page/bloc/customer_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/validator/customer_validator.dart';

part 'customer_form_state.dart';
part 'customer_form_event.dart';

class CustomerFormBloc extends Bloc<CustomerFormEvent, CustomerFormState> {
  CustomerFormBloc(
      {required this.repository,
      required this.customerBloc,
      Customer? customer})
      : super(CustomerFormState(company: customer)) {
    on<CustomerFormEventInitialize>(_onCustomerFormEventInitialize);
    on<NameChanged>(_onNameChanged);
    on<AddressOneChanged>(_onAddressOneChanged);
    on<AddressTwoChanged>(_onAddressTwoChanged);
    on<GstChanged>(_onGstChanged);
    on<NameUnFocused>(_onNameUnFocused);
    on<AddressOneUnFocused>(_onAddressOneUnFocused);

    on<AddressTwoUnFocused>(_onAddressTwoUnFocused);

    on<GstUnFocused>(_onGstUnfocused);

    on<Submitted>(_onSubmitted);
    if (customer != null) {
      add(CustomerFormEventInitialize(customer: customer));
    }
  }
  final Repository repository;
  final CustomerBloc? customerBloc;

  FutureOr<void> _onSubmitted(
      Submitted event, Emitter<CustomerFormState> emit) async {
    final name = CompanyName.dirty(state.name.value);
    final addressOne = Address.dirty(state.addressOne.value);
    final addressTwo = Address.dirty(state.addressTwo.value);
    final gst = Gst.dirty(state.gst.value);

    if (state.status.isValidated) {
      emit(state.copyWith(
          status: FormzStatus.submissionInProgress,
          name: name,
          addressOne: addressOne,
          addressTwo: addressTwo,
          gst: gst));
      try {
        final Customer company = Customer(
            name: name.value,
            addressOne: addressOne.value,
            gst: gst.value,
            addressTwo: addressTwo.value);
        await repository.addCustomer(company);
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, company: company));
        if (customerBloc != null) customerBloc!.add(Started());
      } on Exception catch (e) {
        print(e);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
    emit(state.copyWith(status: FormzStatus.invalid));
  }

  FutureOr<void> _onGstUnfocused(
      GstUnFocused event, Emitter<CustomerFormState> emit) {
    final gst = Gst.dirty(state.gst.value);
    emit(state.copyWith(
        gst: gst,
        status: Formz.validate(
            [state.name, state.addressOne, state.addressTwo, gst])));
  }

  FutureOr<void> _onAddressTwoUnFocused(
      AddressTwoUnFocused event, Emitter<CustomerFormState> emit) {
    final addressTwo = Address.dirty(state.addressTwo.value);
    emit(state.copyWith(
        addressTwo: addressTwo,
        status: Formz.validate(
            [state.name, state.addressOne, addressTwo, state.gst])));
  }

  FutureOr<void> _onAddressOneUnFocused(
      AddressOneUnFocused event, Emitter<CustomerFormState> emit) {
    final addressOne = Address.dirty(state.addressOne.value);
    emit(state.copyWith(
        addressOne: addressOne,
        status: Formz.validate(
            [state.name, addressOne, state.addressTwo, state.gst])));
  }

  FutureOr<void> _onNameUnFocused(
      NameUnFocused event, Emitter<CustomerFormState> emit) {
    final name = CompanyName.dirty(state.name.value);
    emit(state.copyWith(
        name: name,
        status: Formz.validate(
            [name, state.addressOne, state.addressTwo, state.gst])));
  }

  FutureOr<void> _onGstChanged(
      GstChanged event, Emitter<CustomerFormState> emit) {
    final gst = Gst.dirty(event.gst);
    emit(state.copyWith(
        gst: gst.valid ? gst : Gst.pure(event.gst),
        status: Formz.validate(
            [state.name, state.addressOne, state.addressTwo, gst])));
  }

  FutureOr<void> _onAddressTwoChanged(
      AddressTwoChanged event, Emitter<CustomerFormState> emit) {
    final addressTwo = Address.dirty(event.addressTwo);
    emit(state.copyWith(
        addressTwo:
            addressTwo.valid ? addressTwo : Address.pure(event.addressTwo),
        status: Formz.validate(
            [state.name, state.addressOne, addressTwo, state.gst])));
  }

  FutureOr<void> _onAddressOneChanged(
      AddressOneChanged event, Emitter<CustomerFormState> emit) {
    final addressOne = Address.dirty(event.addressOne);
    emit(state.copyWith(
        addressOne:
            addressOne.valid ? addressOne : Address.pure(event.addressOne),
        status: Formz.validate(
            [state.name, addressOne, state.addressTwo, state.gst])));
  }

  FutureOr<void> _onNameChanged(
      NameChanged event, Emitter<CustomerFormState> emit) {
    final name = CompanyName.dirty(event.name);
    emit(state.copyWith(
        name: name.valid ? name : CompanyName.pure(event.name),
        status: Formz.validate(
            [name, state.addressOne, state.addressTwo, state.gst])));
  }

  FutureOr<void> _onCustomerFormEventInitialize(
      CustomerFormEventInitialize event, Emitter<CustomerFormState> emit) {
    emit(state.copyWith(
        name: CompanyName.pure(event.customer.name),
        addressOne: Address.pure(event.customer.addressOne),
        addressTwo: Address.pure(event.customer.addressTwo ?? ''),
        gst: Gst.pure(event.customer.gst),
        status: FormzStatus.pure));
  }
}

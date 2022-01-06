part of 'customer_form_bloc.dart';

class CustomerFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NameChanged extends CustomerFormEvent {
  final String name;

  NameChanged(this.name);
}

class AddressOneChanged extends CustomerFormEvent {
  final String addressOne;

  AddressOneChanged(this.addressOne);
}

class AddressTwoChanged extends CustomerFormEvent {
  final String addressTwo;

  AddressTwoChanged(this.addressTwo);
}

class GstChanged extends CustomerFormEvent {
  final String gst;

  GstChanged(this.gst);
}

class NameUnFocused extends CustomerFormEvent {}

class AddressOneUnFocused extends CustomerFormEvent {}

class AddressTwoUnFocused extends CustomerFormEvent {}

class GstUnFocused extends CustomerFormEvent {}

class Submitted extends CustomerFormEvent {}

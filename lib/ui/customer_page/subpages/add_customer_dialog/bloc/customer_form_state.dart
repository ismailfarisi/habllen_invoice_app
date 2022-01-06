part of 'customer_form_bloc.dart';

enum Status { initial, loading, success, failure }

class CustomerFormState extends Equatable {
  const CustomerFormState(
      {this.name = const CompanyName.pure(),
      this.addressOne = const Address.pure(),
      this.addressTwo = const Address.pure(),
      this.gst = const Gst.pure(),
      this.status = FormzStatus.pure});

  final FormzStatus status;
  final CompanyName name;
  final Address addressOne;
  final Address addressTwo;
  final Gst gst;

  @override
  List<Object?> get props => [status, name, addressOne, addressTwo, gst];

  CustomerFormState copyWith({
    FormzStatus? status,
    CompanyName? name,
    Address? addressOne,
    Address? addressTwo,
    Gst? gst,
  }) {
    return CustomerFormState(
        name: name ?? this.name,
        addressOne: addressOne ?? this.addressOne,
        addressTwo: addressTwo ?? this.addressTwo,
        gst: gst ?? this.gst,
        status: status ?? this.status);
  }
}

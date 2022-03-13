import 'package:flutter/material.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:habllen/ui/settings_page/subpages/company_profile_page/bloc/company_profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({Key? key}) : super(key: key);
  static const String routeName = 'company_profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              context
                  .read<CompanyProfileBloc>()
                  .add(CompanyProfileEvent.saved());
            },
          ),
        ],
      ),
      body: BlocBuilder<CompanyProfileBloc, CompanyProfileState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                VerticalBigSpace(),
                _FieldDivider(text: "Basic Info"),
                CustomTextField(
                  initialValue: state.companyName.value,
                  onChanged: (value) {
                    print(value);
                    context
                        .read<CompanyProfileBloc>()
                        .add(CompanyProfileEvent.companyNameChanged(value));
                  },
                  helperText: 'Company Name',
                ),
                CustomTextField(
                  initialValue: state.companyCity.value,
                  onChanged: (value) => context.read<CompanyProfileBloc>().add(
                        CompanyProfileEvent.companyNameChanged(value),
                      ),
                  helperText: 'City',
                ),
                CustomTextField(
                  initialValue: state.companyPostalCode.value == null
                      ? null
                      : state.companyPostalCode.value.toString(),
                  onChanged: (value) => context
                      .read<CompanyProfileBloc>()
                      .add(CompanyProfileEvent.postCodeChanged(value)),
                  helperText: 'Postal Code',
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  initialValue: state.companyState.value,
                  onChanged: (value) => context
                      .read<CompanyProfileBloc>()
                      .add(CompanyProfileEvent.companyStateChanged(value)),
                  helperText: 'State',
                ),
                CustomTextField(
                  initialValue: state.companyCountry.value,
                  onChanged: (value) => context
                      .read<CompanyProfileBloc>()
                      .add(CompanyProfileEvent.companyCountryChanged(value)),
                  helperText: 'Country',
                ),
                _FieldDivider(text: "Tax Details"),
                CustomTextField(
                  initialValue: state.gst.value,
                  onChanged: (gst) => context
                      .read<CompanyProfileBloc>()
                      .add(CompanyProfileEvent.companyGstChanged(gst)),
                  helperText: 'Gst No.',
                ),
                _FieldDivider(text: "Contact Details"),
                CustomTextField(
                  initialValue: state.companyEmail.value,
                  onChanged: (value) => context
                      .read<CompanyProfileBloc>()
                      .add(CompanyProfileEvent.companyPhoneChanged(value)),
                  helperText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  initialValue: state.companyPhone.value,
                  onChanged: (value) => context
                      .read<CompanyProfileBloc>()
                      .add(CompanyProfileEvent.companyPhoneChanged(value)),
                  helperText: 'Phone',
                  keyboardType: TextInputType.number,
                ),
              ]))
            ],
          );
        },
      ),
    );
  }
}

class _FieldDivider extends StatelessWidget {
  const _FieldDivider({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 40,
      child: Align(
        alignment: Alignment.centerLeft,
        child: HorizonalPadding(
          child: Text(
            text,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );
  }
}

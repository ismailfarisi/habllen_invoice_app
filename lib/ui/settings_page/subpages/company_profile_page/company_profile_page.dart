import 'package:flutter/material.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({Key? key}) : super(key: key);
  static const String routeName = 'company_profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Profile'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            VerticalBigSpace(),
            CustomTextField(
              helperText: 'Company Name',
            ),
            CustomTextField(
              helperText: 'Company Address 1',
            ),
            CustomTextField(
              helperText: 'Company Address 2',
            ),
            CustomTextField(
              helperText: 'Phone Number',
            ),
            CustomTextField(
              helperText: 'Email',
            ),
          ]))
        ],
      ),
    );
  }
}

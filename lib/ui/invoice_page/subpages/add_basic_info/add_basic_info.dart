import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/shared/widgets/date_field_widget.dart';
import 'package:habllen/ui/invoice_page/subpages/add_basic_info/bloc/basic_info_bloc.dart';
import 'package:intl/intl.dart';

typedef void OnDateChanged(DateTime date);
typedef void OnDueDatePeriodChanged(int period);

class AddBasicInfoPage extends StatelessWidget {
  const AddBasicInfoPage({Key? key}) : super(key: key);

  static const String routeName = "add_basic_info_full_dialog";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Info'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.read<BasicInfoBloc>().add(
                    BasicInfoEvent.submitted(),
                  );
              context.pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          VerticalBigSpace(),
          CustomDateField(
            onDateSelected: (date) {
              if (date != null)
                context.read<BasicInfoBloc>().add(
                      BasicInfoEvent.dateChanged(date),
                    );
            },
            currentDate: (context) => context.read<BasicInfoBloc>().state.date,
          ),
          CustomBasicInfoField(fieldName: "Due Date Period"),
        ],
      ),
    );
  }
}

class DateField extends StatelessWidget {
  const DateField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizonalPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date'),
          DateTimeField(
            dateFormat: DateFormat("dd/MM/yyyy"),
            onDateSelected: (date) {
              context
                  .read<BasicInfoBloc>()
                  .add(BasicInfoEvent.dateChanged(date));
            },
            initialDate: context.watch<BasicInfoBloc>().state.date,
            mode: DateTimeFieldPickerMode.date,
            selectedDate: context.watch<BasicInfoBloc>().state.date,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                constraints: BoxConstraints.tightForFinite(height: 40)),
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}

typedef void OnTap();
typedef void OnChanged(String? value);

class CustomBasicInfoField extends StatelessWidget {
  const CustomBasicInfoField(
      {Key? key,
      required this.fieldName,
      this.initialValue,
      this.errorText,
      this.onChanged,
      this.onTap})
      : super(key: key);
  final String fieldName;
  final String? initialValue;
  final String? errorText;
  final OnChanged? onChanged;
  final OnTap? onTap;

  @override
  Widget build(BuildContext context) {
    return HorizonalPadding(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size.fromHeight(80)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fieldName),
            TextFormField(
              onChanged: onChanged,
              initialValue: initialValue,
              onTap: onTap,
              decoration: InputDecoration(
                  errorText: errorText,
                  border: InputBorder.none,
                  constraints: BoxConstraints.tightForFinite(height: 40)),
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habllen/shared/utils/date_util.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';

typedef void OnDateSelected(DateTime? date);
typedef DateTime CurrentDate(BuildContext context);

class CustomDateField extends StatefulWidget {
  const CustomDateField(
      {Key? key, required this.onDateSelected, this.currentDate})
      : super(key: key);

  final OnDateSelected onDateSelected;
  final CurrentDate? currentDate;

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  late DateTime date;

  @override
  void initState() {
    date = widget.currentDate == null
        ? DateTime.now()
        : widget.currentDate!(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HorizonalPadding(
      child: InkWell(
        onTap: () {
          onTap(currentDate: date, context: context);
        },
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).dividerColor, width: 2.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(date.toDateString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTap(
      {required BuildContext context, required DateTime currentDate}) async {
    final today = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: today.subtract(const Duration(days: 50)),
      lastDate: DateTime.now().add(const Duration(days: 10)),
    );
    setState(() {
      widget.onDateSelected(selectedDate);
      date = selectedDate ?? today;
    });
  }
}

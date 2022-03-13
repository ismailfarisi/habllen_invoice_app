import 'package:flutter/material.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';

typedef OnChangedCallback(String data);
typedef OnTap();

class CustomAddField extends StatefulWidget {
  final String fieldName;
  final OnChangedCallback? onChanged;
  final String? validator;
  final OnTap? onTap;
  final String? value;

  const CustomAddField(
      {Key? key,
      this.value,
      required this.fieldName,
      this.onChanged,
      this.validator,
      this.onTap})
      : super(key: key);

  @override
  State<CustomAddField> createState() => _CustomAddFieldState();
}

class _CustomAddFieldState extends State<CustomAddField> {
  late final TextEditingController _controller = TextEditingController();

  String? value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) value = widget.value;
    _controller..addListener(textListener);
  }

  void textListener() {
    if (widget.onChanged != null) widget.onChanged!(_controller.value.text);
  }

  @override
  void dispose() {
    _controller.removeListener(textListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomAddField oldWidget) {
    if (oldWidget.value != widget.value) {
      value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 2,
          ),
        ),
      ),
      child: HorizonalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8),
            Text(widget.fieldName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () async {
                if (widget.onTap != null) {
                  widget.onTap!();
                } else {
                  final string = await showDialogAndChangeText(context, value);
                  if (string != null) {
                    setState(() {
                      value = string;
                    });
                  }
                }
              },
              child: (value == null)
                  ? Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: theme.primaryColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("add",
                            style: theme.textTheme.subtitle1
                                ?.copyWith(color: theme.primaryColor)),
                      ],
                    )
                  : Row(
                      children: [
                        Text(value!),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  Future<String?> showDialogAndChangeText(
      BuildContext context, String? values) async {
    return showDialog<String?>(
        context: context,
        builder: (context) {
          _controller.text = values ?? "";
          String? error;
          return Dialog(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: StatefulBuilder(builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.fieldName}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextField(
                          key: Key("dialog_text_field"),
                          autofocus: true,
                          controller: _controller,
                          decoration: InputDecoration(
                              errorText: error, border: UnderlineInputBorder()),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                child: Text("Save"),
                                onPressed: () {
                                  final validated = widget.validator == null;
                                  if (validated) {
                                    Navigator.of(context).pop(_controller.text);
                                  }
                                  state(() {
                                    error = widget.validator;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                )),
          );
        });
  }
}

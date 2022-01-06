import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

typedef _AutocompleteOptionToString<T extends Object> = String Function(
    T option);

typedef _AutocompleteOnSelected<T extends Object> = void Function(T option);

typedef _Validator = String? Function(String?);

enum OptionState { loading, loaded }

class CustomAutoComplete<T extends Object> extends StatelessWidget {
  CustomAutoComplete(
      {Key? key,
      this.displayStringForOption = RawAutocomplete.defaultStringForOption,
      this.onSelected,
      required this.options,
      this.validator,
      required this.labelText,
      this.focusNode,
      this.controller,
      this.textInputAction,
      this.errorText,
      this.optionState = OptionState.loaded})
      : super(key: key);

  final _AutocompleteOptionToString<T> displayStringForOption;
  final _AutocompleteOnSelected<T>? onSelected;
  final List<T> options;
  final _Validator? validator;
  final String labelText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? errorText;
  final OptionState optionState;

  @override
  Widget build(BuildContext context) {
    late FocusNode _focusNode = focusNode ?? FocusNode();
    late TextEditingController _textEditingController =
        controller ?? TextEditingController();
    return RawAutocomplete<T>(
        textEditingController: _textEditingController,
        focusNode: focusNode ?? _focusNode,
        fieldViewBuilder: (context, controller, focusNode, fn) {
          return TextFormField(
              textInputAction: textInputAction,
              validator: validator,
              onEditingComplete: fn,
              controller: controller,
              focusNode: _focusNode,
              decoration:
                  InputDecoration(labelText: labelText, errorText: errorText));
        },
        optionsViewBuilder: (context, onSelected, options) {
          double lwidth = _focusNode.parent!.size.width;

          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200, maxWidth: lwidth),
                child: (optionState == OptionState.loading)
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final T option = options.elementAt(index);
                          return InkWell(
                            onTap: () {
                              onSelected(option);
                            },
                            child: Builder(builder: (BuildContext context) {
                              final bool highlight =
                                  AutocompleteHighlightedOption.of(context) ==
                                      index;
                              if (highlight) {
                                SchedulerBinding.instance!
                                    .addPostFrameCallback((Duration timeStamp) {
                                  Scrollable.ensureVisible(context,
                                      alignment: 0.5);
                                });
                              }
                              return Container(
                                color: highlight
                                    ? Theme.of(context).primaryColorLight
                                    : null,
                                padding: const EdgeInsets.all(16.0),
                                child: Text(displayStringForOption(option)),
                              );
                            }),
                          );
                        },
                      ),
              ),
            ),
          );
        },
        optionsBuilder: (textEditingVale) {
          return options.where((element) => displayStringForOption(element)
              .toString()
              .toUpperCase()
              .contains(textEditingVale.text.toUpperCase()));
        },
        displayStringForOption: displayStringForOption,
        onSelected: onSelected);
  }
}

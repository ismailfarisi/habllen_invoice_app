import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

typedef _AutocompleteOptionToString<T extends Object> = String Function(
    T option);

typedef _AutocompleteOnSelected<T extends Object> = void Function(T option);

typedef _Validator = String? Function(String?);

enum OptionState { loading, loaded }

class CustomAutoComplete<T extends Object> extends RawAutocomplete<T> {
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
      : super(
            key: key,
            textEditingController: controller,
            focusNode: focusNode ?? focusNode,
            fieldViewBuilder: (context, controller, focusNode, fn) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                child: TextFormField(
                    textInputAction: textInputAction,
                    validator: validator,
                    onEditingComplete: fn,
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                        labelText: labelText, errorText: errorText)),
              );
            },
            optionsViewBuilder: (context, onSelected, options) {
              double lwidth = focusNode?.parent!.size.width ?? double.infinity;

              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 200, maxWidth: lwidth),
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
                                      AutocompleteHighlightedOption.of(
                                              context) ==
                                          index;
                                  if (highlight) {
                                    SchedulerBinding.instance!
                                        .addPostFrameCallback(
                                            (Duration timeStamp) {
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
}

class RawAutocomplete<T extends Object> extends StatefulWidget {
  const RawAutocomplete({
    Key? key,
    required this.optionsViewBuilder,
    required this.optionsBuilder,
    this.displayStringForOption = defaultStringForOption,
    this.fieldViewBuilder,
    this.focusNode,
    this.onSelected,
    this.textEditingController,
    this.initialValue,
  })  : assert(
          fieldViewBuilder != null ||
              (key != null &&
                  focusNode != null &&
                  textEditingController != null),
          'Pass in a fieldViewBuilder, or otherwise create a separate field and pass in the FocusNode, TextEditingController, and a key. Use the key with RawAutocomplete.onFieldSubmitted.',
        ),
        assert((focusNode == null) == (textEditingController == null)),
        assert(
          !(textEditingController != null && initialValue != null),
          'textEditingController and initialValue cannot be simultaneously defined.',
        ),
        super(key: key);

  final AutocompleteFieldViewBuilder? fieldViewBuilder;

  final FocusNode? focusNode;

  final AutocompleteOptionsViewBuilder<T> optionsViewBuilder;

  final AutocompleteOptionToString<T> displayStringForOption;

  final AutocompleteOnSelected<T>? onSelected;

  final AutocompleteOptionsBuilder<T> optionsBuilder;

  final TextEditingController? textEditingController;

  final TextEditingValue? initialValue;

  static void onFieldSubmitted<T extends Object>(GlobalKey key) {
    final _RawAutocompleteState<T> rawAutocomplete =
        key.currentState! as _RawAutocompleteState<T>;
    rawAutocomplete._onFieldSubmitted();
  }

  static String defaultStringForOption(dynamic option) {
    return option.toString();
  }

  @override
  State<RawAutocomplete<T>> createState() => _RawAutocompleteState<T>();
}

class _RawAutocompleteState<T extends Object>
    extends State<RawAutocomplete<T>> {
  final GlobalKey _fieldKey = GlobalKey();
  final LayerLink _optionsLayerLink = LayerLink();
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late final Map<Type, Action<Intent>> _actionMap;
  late final _AutocompleteCallbackAction<AutocompletePreviousOptionIntent>
      _previousOptionAction;
  late final _AutocompleteCallbackAction<AutocompleteNextOptionIntent>
      _nextOptionAction;
  Iterable<T> _options = Iterable<T>.empty();
  T? _selection;
  final ValueNotifier<int> _highlightedOptionIndex = ValueNotifier<int>(0);

  static const Map<ShortcutActivator, Intent> _shortcuts =
      <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowUp):
        AutocompletePreviousOptionIntent(),
    SingleActivator(LogicalKeyboardKey.arrowDown):
        AutocompleteNextOptionIntent(),
  };

  // The OverlayEntry containing the options.
  OverlayEntry? _floatingOptions;

  // True iff the state indicates that the options should be visible.
  bool get _shouldShowOptions {
    return _focusNode.hasFocus && _selection == null && _options.isNotEmpty;
  }

  // Called when _textEditingController changes.
  void _onChangedField() {
    final Iterable<T> options = widget.optionsBuilder(
      _textEditingController.value,
    );
    _options = options;
    _updateHighlight(_highlightedOptionIndex.value);
    if (_selection != null &&
        _textEditingController.text !=
            widget.displayStringForOption(_selection!)) {
      _selection = null;
    }
    _updateOverlay();
  }

  // Called when the field's FocusNode changes.
  void _onChangedFocus() {
    _updateOverlay();
  }

  // Called from fieldViewBuilder when the user submits the field.
  void _onFieldSubmitted() {
    if (_options.isEmpty) {
      return;
    }
    _select(_options.elementAt(_highlightedOptionIndex.value));
  }

  // Select the given option and update the widget.
  void _select(T nextSelection) {
    if (nextSelection == _selection) {
      return;
    }
    _selection = nextSelection;
    final String selectionString = widget.displayStringForOption(nextSelection);
    _textEditingController.value = TextEditingValue(
      selection: TextSelection.collapsed(offset: selectionString.length),
      text: selectionString,
    );
    widget.onSelected?.call(_selection!);
  }

  void _updateHighlight(int newIndex) {
    _highlightedOptionIndex.value =
        _options.isEmpty ? 0 : newIndex % _options.length;
  }

  void _highlightPreviousOption(AutocompletePreviousOptionIntent intent) {
    _updateHighlight(_highlightedOptionIndex.value - 1);
  }

  void _highlightNextOption(AutocompleteNextOptionIntent intent) {
    _updateHighlight(_highlightedOptionIndex.value + 1);
  }

  void _setActionsEnabled(bool enabled) {
    // The enabled state determines whether the action will consume the
    // key shortcut or let it continue on to the underlying text field.
    // They should only be enabled when the options are showing so shortcuts
    // can be used to navigate them.
    _previousOptionAction.enabled = enabled;
    _nextOptionAction.enabled = enabled;
  }

  // Hide or show the options overlay, if needed.
  void _updateOverlay() {
    _setActionsEnabled(_shouldShowOptions);
    if (_shouldShowOptions) {
      _floatingOptions?.remove();
      _floatingOptions = OverlayEntry(
        builder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _optionsLayerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            child: AutocompleteHighlightedOption(
                highlightIndexNotifier: _highlightedOptionIndex,
                child: Builder(builder: (BuildContext context) {
                  return widget.optionsViewBuilder(context, _select, _options);
                })),
          );
        },
      );
      Overlay.of(context, rootOverlay: true)!.insert(_floatingOptions!);
    } else if (_floatingOptions != null) {
      _floatingOptions!.remove();
      _floatingOptions = null;
    }
  }

  // Handle a potential change in textEditingController by properly disposing of
  // the old one and setting up the new one, if needed.
  void _updateTextEditingController(
      TextEditingController? old, TextEditingController? current) {
    if ((old == null && current == null) || old == current) {
      return;
    }
    if (old == null) {
      _textEditingController.removeListener(_onChangedField);
      _textEditingController.dispose();
      _textEditingController = current!;
    } else if (current == null) {
      _textEditingController.removeListener(_onChangedField);
      _textEditingController = TextEditingController();
    } else {
      _textEditingController.removeListener(_onChangedField);
      _textEditingController = current;
    }
    _textEditingController.addListener(_onChangedField);
  }

  // Handle a potential change in focusNode by properly disposing of the old one
  // and setting up the new one, if needed.
  void _updateFocusNode(FocusNode? old, FocusNode? current) {
    if ((old == null && current == null) || old == current) {
      return;
    }
    if (old == null) {
      _focusNode.removeListener(_onChangedFocus);
      _focusNode.dispose();
      _focusNode = current!;
    } else if (current == null) {
      _focusNode.removeListener(_onChangedFocus);
      _focusNode = FocusNode();
    } else {
      _focusNode.removeListener(_onChangedFocus);
      _focusNode = current;
    }
    _focusNode.addListener(_onChangedFocus);
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.textEditingController ??
        TextEditingController.fromValue(widget.initialValue);
    _textEditingController.addListener(_onChangedField);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onChangedFocus);
    _previousOptionAction =
        _AutocompleteCallbackAction<AutocompletePreviousOptionIntent>(
            onInvoke: _highlightPreviousOption);
    _nextOptionAction =
        _AutocompleteCallbackAction<AutocompleteNextOptionIntent>(
            onInvoke: _highlightNextOption);
    _actionMap = <Type, Action<Intent>>{
      AutocompletePreviousOptionIntent: _previousOptionAction,
      AutocompleteNextOptionIntent: _nextOptionAction,
    };
    SchedulerBinding.instance!.addPostFrameCallback((Duration _) {
      _updateOverlay();
    });
  }

  @override
  void didUpdateWidget(RawAutocomplete<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateTextEditingController(
      oldWidget.textEditingController,
      widget.textEditingController,
    );
    _updateFocusNode(oldWidget.focusNode, widget.focusNode);
    SchedulerBinding.instance!.addPostFrameCallback((Duration _) {
      _updateOverlay();
    });
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_onChangedField);
    if (widget.textEditingController == null) {
      _textEditingController.dispose();
    }
    _focusNode.removeListener(_onChangedFocus);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _floatingOptions?.remove();
    _floatingOptions = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _fieldKey,
      child: Shortcuts(
        shortcuts: _shortcuts,
        child: Actions(
          actions: _actionMap,
          child: CompositedTransformTarget(
            link: _optionsLayerLink,
            child: widget.fieldViewBuilder == null
                ? const SizedBox.shrink()
                : widget.fieldViewBuilder!(
                    context,
                    _textEditingController,
                    _focusNode,
                    _onFieldSubmitted,
                  ),
          ),
        ),
      ),
    );
  }
}

class _AutocompleteCallbackAction<T extends Intent> extends CallbackAction<T> {
  _AutocompleteCallbackAction({
    required OnInvokeCallback<T> onInvoke,
    this.enabled = true,
  }) : super(onInvoke: onInvoke);

  bool enabled;

  @override
  bool isEnabled(covariant T intent) => enabled;

  @override
  bool consumesKey(covariant T intent) => enabled;
}

/// An [Intent] to highlight the previous option in the autocomplete list.
///
/// {@macro flutter.widgets.TextEditingIntents.seeAlso}
class AutocompletePreviousOptionIntent extends Intent {
  /// Creates an instance of AutocompletePreviousOptionIntent.
  const AutocompletePreviousOptionIntent();
}

/// An [Intent] to highlight the next option in the autocomplete list.
///
/// {@macro flutter.widgets.TextEditingIntents.seeAlso}
class AutocompleteNextOptionIntent extends Intent {
  /// Creates an instance of AutocompleteNextOptionIntent.
  const AutocompleteNextOptionIntent();
}

/// An inherited widget used to indicate which autocomplete option should be
/// highlighted for keyboard navigation.
///
/// The `RawAutoComplete` widget will wrap the options view generated by the
/// `optionsViewBuilder` with this widget to provide the highlighted option's
/// index to the builder.
///
/// In the builder callback the index of the highlighted option can be obtained
/// by using the static [of] method:
///
/// ```dart
/// final highlightedIndex = AutocompleteHighlightedOption.of(context);
/// ```
///
/// which can then be used to tell which option should be given a visual
/// indication that will be the option selected with the keyboard.
class AutocompleteHighlightedOption
    extends InheritedNotifier<ValueNotifier<int>> {
  /// Create an instance of AutocompleteHighlightedOption inherited widget.
  const AutocompleteHighlightedOption({
    Key? key,
    required ValueNotifier<int> highlightIndexNotifier,
    required Widget child,
  }) : super(key: key, notifier: highlightIndexNotifier, child: child);

  /// Returns the index of the highlighted option from the closest
  /// [AutocompleteHighlightedOption] ancestor.
  ///
  /// If there is no ancestor, it returns 0.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final highlightedIndex = AutocompleteHighlightedOption.of(context);
  /// ```
  static int of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<AutocompleteHighlightedOption>()
            ?.notifier
            ?.value ??
        0;
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_app/component.dart';

class CustomTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final String hintText;
  final String obscuringCharacter;
  final double? height;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final bool autocorrect;
  final bool autofocus;
  final Widget? label;
  final String? labelText;
  final bool showPrefixLoadingIcon;
  final bool showSuffixLoadingIcon;
  final Widget? loadingIcon;
  final Color? loadingIconColor;
  final double? loadingIconsSize;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Color? fillColor;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final BorderRadius? borderRadius;
  final TextAlign textAlign;
  final Color? cursorColor;
  final Function(String? value)? validator;
  final void Function(String? value)? onComplete;
  final Future<void>? Function(String value)? onChangedProcessing;
  final Function(String value)? onChanged;
  final Duration onChangeDebouncer;
  final void Function()? onTap;
  final void Function(PointerDownEvent pointerDownEvent)? onTapOutside;
  final TextCapitalization textCapitalization;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final String? initialValue;
  final bool fullTextSelection;
  final TextStyle? labelStyle;
  final TextStyle? notSelectedLabelStyle;
  final Function(bool isFocused)? onFocusChange;
  const CustomTextFormField({
    Key? key,
    this.height = 48,
    this.autofillHints,
    this.contentPadding,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.hintText = "",
    this.textEditingController,
    this.onComplete,
    this.onChangedProcessing,
    this.borderRadius,
    this.onTap,
    this.enabled = true,
    this.style,
    this.errorStyle,
    this.hintStyle,
    this.obscureText = false,
    this.cursorColor,
    this.readOnly = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.obscuringCharacter = "•",
    this.textAlign = TextAlign.start,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.label,
    this.labelText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.prefixIcon,
    this.prefix,
    this.fillColor,
    this.initialValue,
    this.suffixIcon,
    this.suffix,
    this.showPrefixLoadingIcon = false,
    this.showSuffixLoadingIcon = false,
    this.loadingIcon,
    this.loadingIconColor,
    this.loadingIconsSize = 16,
    this.onTapOutside,
    this.onChangeDebouncer = const Duration(milliseconds: 500),
    this.onChanged,
    this.focusNode,
    this.fullTextSelection = true,
    this.labelStyle,
    this.notSelectedLabelStyle,
    this.onFocusChange,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController textEditingController;
  late String hintText;
  late BorderRadius borderRadius;
  bool error = false;
  bool isIdle = true;
  bool firstTimeTap = false;
  List<String> _searchProductList = [];
  Timer? _debounce;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.textEditingController ?? TextEditingController();
    hintText = widget.hintText;
    borderRadius = widget.borderRadius ?? BorderRadius.circular(8);
    if (widget.initialValue != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        textEditingController.text = widget.initialValue!;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    _debounce?.cancel();
  }

  Widget? showLoadingIcon(bool value) {
    if (value && !isIdle) {
      return widget.loadingIcon ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: widget.loadingIconsSize ?? double.infinity,
                  maxWidth: widget.loadingIconsSize ?? double.infinity,
                ),
                child: FittedBox(child: CircularProgressIndicator(color: widget.loadingIconColor ?? Theme.of(context).primaryColor)),
              ),
            ],
          );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Focus(
        onFocusChange: (value) {
          if (mounted) setState(() => isFocused = value);
          if (widget.onFocusChange != null) widget.onFocusChange!(value);
        },
        child: TextFormField(
          controller: textEditingController,
          focusNode: widget.focusNode,
          textCapitalization: widget.textCapitalization,
          keyboardType: widget.keyboardType,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          textAlign: widget.textAlign,
          autofocus: widget.autofocus,
          autocorrect: widget.autocorrect,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          cursorColor: widget.cursorColor ?? Theme.of(context).primaryColor,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          autofillHints: widget.autofillHints,
          style: widget.style ?? TextStyle(color: Theme.of(context).primaryColor),
          onEditingComplete: () {
            if (widget.onComplete != null) widget.onComplete!(textEditingController.text);
          },
          onTapOutside: (PointerDownEvent pointerDownEvent) {
            if (widget.onTapOutside != null) widget.onTapOutside!(pointerDownEvent);
            firstTimeTap = false;
          },
          onChanged: (value) async {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }

            if (widget.onChangedProcessing != null) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(widget.onChangeDebouncer, () async {
                _searchProductList.add(value);
                while (_searchProductList.isNotEmpty && value.isNotEmpty) {
                  if (isIdle) {
                    String searchingProduct = _searchProductList.last;
                    _searchProductList = [];
                    if (mounted) setState(() => isIdle = false);
                    await widget.onChangedProcessing!(searchingProduct);
                    if (mounted) setState(() => isIdle = true);
                  }
                }
              });
            }

            if (error) {
              hintText = widget.hintText;
              error = false;
            }
            if (mounted) setState(() {});
          },
          onTap: () {
            if (widget.fullTextSelection && !firstTimeTap) {
              textEditingController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: textEditingController.value.text.length,
              );
              firstTimeTap = true;
            }
            if (widget.onTap != null) widget.onTap!();
            if (error) {
              hintText = widget.hintText;
              error = false;
            }
            if (mounted) setState(() {});
          },
          validator: (value) {
            if (widget.validator == null || widget.validator!(value) == null) return null;
            error = true;
            textEditingController.clear();
            hintText = widget.validator!(value);
            if (mounted) setState(() {});
            return "";
          },
          decoration: InputDecoration(
            label: widget.label,
            labelText: widget.labelText,
            labelStyle: isFocused ? widget.labelStyle ?? TextStyle(color: Theme.of(context).primaryColor) : widget.notSelectedLabelStyle ?? TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.5)),
            floatingLabelBehavior: error ? FloatingLabelBehavior.always : widget.floatingLabelBehavior,
            hintText: hintText,
            prefix: widget.prefix,
            suffix: widget.suffix,
            prefixIcon: showLoadingIcon(widget.showPrefixLoadingIcon) ?? widget.prefixIcon,
            suffixIcon: showLoadingIcon(widget.showSuffixLoadingIcon) ?? widget.suffixIcon,
            filled: widget.fillColor == null ? false : true,
            fillColor: widget.fillColor,
            hintStyle: widget.hintStyle ?? TextStyle(color: error ? Theme.of(context).colorScheme.error : defaultGray),
            errorStyle: widget.errorStyle ?? const TextStyle(height: 0),
            contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            enabledBorder: widget.enabledBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
                ),
            focusedBorder: widget.focusedBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColorDark),
                ),
            errorBorder: widget.errorBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.error),
                ),
            focusedErrorBorder: widget.focusedErrorBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColorDark),
                ),
            disabledBorder: widget.disabledBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColorLight),
                ),
          ),
        ),
      ),
    );
  }
}

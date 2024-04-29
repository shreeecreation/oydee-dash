import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class CustomTextField<T extends Object> extends FormField<T> {
  CustomTextField(
      {this.hintText,
      this.onChanged,
      this.errorText,
      this.suffixIcon,
      this.inputAction = TextInputAction.unspecified,
      this.inputType = TextInputType.text,
      this.borderSide = const BorderSide(),
      this.controller,
      this.labelText,
      this.readOnly = false,
      this.onTap,
      this.isPasswordField = false,
      this.suffix,
      this.prefix,
      this.prefixIcon,
      this.borderRadius,
      this.textCapitalization,
      this.fieldContentPadding,
      this.initialValues,
      this.validators,
      this.maxLines = 1,
      this.inputFormatters = const [],
      this.hintStyle,
      this.fillColor,
      this.autoFocus})
      : super(builder: (state) {
          return _CustomTextField<T>().builder(state);
        });

  final String? hintText;
  final void Function(String)? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final BorderSide? borderSide;
  final TextEditingController? controller;
  final String? labelText;
  final bool readOnly;
  final VoidCallback? onTap;

  final bool isPasswordField;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final TextCapitalization? textCapitalization;
  final EdgeInsets? fieldContentPadding;
  final String? initialValues;
  final String? Function(String? value)? validators;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? autoFocus;
  final int? maxLines;
  final List<TextInputFormatter> inputFormatters;

  BorderRadius get radius => borderRadius ?? BorderRadius.circular(8);

  BorderSide get buildBorderSide =>
      borderSide ??
      BorderSide(
        color: hasError ? AppColors.statusRed : AppColors.primary,
        width: 1,
      );

  // has error
  bool get hasError => errorText != null && errorText!.isNotEmpty;

  @override
  FormFieldBuilder<T> get builder => (field) {
        return TextFormField(
          autofocus: autoFocus ?? false,
          initialValue: initialValues,
          inputFormatters: inputFormatters,
          obscureText: isPasswordField,
          style: AppStyles.text14PxMedium.black,
          controller: controller,
          keyboardType: inputType,
          onTap: onTap,
          textInputAction: inputAction,
          onChanged: onChanged,
          maxLines: maxLines,
          validator: validators,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          readOnly: readOnly,
          decoration: InputDecoration(
            fillColor: fillColor != null ? fillColor : null,
            contentPadding: fieldContentPadding ?? const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: radius,
              borderSide: buildBorderSide,
            ),
            focusColor: AppColors.primary,
            errorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: buildBorderSide,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: buildBorderSide,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: buildBorderSide.copyWith(
                color: AppColors.textLightDark,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: buildBorderSide,
            ),
            errorText: errorText != null && errorText!.isNotEmpty ? errorText : null,
            hintText: hintText,
            suffixIcon: hasError && !isPasswordField && suffixIcon == null ? const Icon(Icons.error_outline) : suffixIcon,
            suffix: suffix,
            prefix: prefix,
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle: AppStyles.text14PxMedium.copyWith(
              color: AppColors.textLightDark,
            ),
            hintStyle: hintStyle == null
                ? AppStyles.text16Px.copyWith(
                    color: AppColors.textLightDark.withOpacity(.8),
                  )
                : hintStyle,
          ),
        );
      };
}

class _CustomTextField<T extends Object> extends CustomTextField<T> {}

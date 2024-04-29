import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class CustomTextField<T extends Object> extends FormField<T> {
  CustomTextField(
      {super.key,
      this.hintText,
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
      this.fillColor = AppColors.white,
      this.autoFocus,
      this.textFieldLabel})
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
  final String? textFieldLabel;

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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (textFieldLabel != null)
              Text(
                textFieldLabel ?? "",
                style: AppTextStyles.text18Px.textGrey,
              ),
            if (textFieldLabel != null) 10.verticalSpace,
            TextFormField(
              autofocus: autoFocus ?? false,
              initialValue: initialValues,
              inputFormatters: inputFormatters,
              obscureText: isPasswordField,
              style: AppTextStyles.text18PxMedium.black,
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
                filled: true,
                fillColor: fillColor,
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
                    color: AppColors.textLightDark.withOpacity(.15),
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
                prefixIcon: prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: prefixIcon,
                      )
                    : null,
                labelText: labelText,
                labelStyle: AppTextStyles.text14PxMedium.copyWith(
                  color: AppColors.textLightDark,
                ),
                hintStyle: hintStyle ??
                    AppTextStyles.text16Px.copyWith(
                      color: AppColors.textLightDark.withOpacity(.25),
                    ),
              ),
            ),
          ],
        );
      };
}

class _CustomTextField<T extends Object> extends CustomTextField<T> {}

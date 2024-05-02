import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.disabledColor = AppColors.primary,
    this.splashColor = AppColors.textGrey,
    this.labelStyle,
    this.textColor = AppColors.white,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 60,
    this.borderRadius = 10,
  }) : children = [
          loading
              ? _ButtonLoading(
                  loadingColor: textColor,
                )
              : Text(
                  label,
                  style: labelStyle?.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor) ??
                      AppTextStyles.text14PxMedium.copyWith(
                        color: isDisabled ? textColor.withOpacity(0.6) : textColor,
                      ),
                )
        ];

  CustomButton.icon({
    super.key,
    required this.label,
    required this.onPressed,
    required Widget icon,
    this.backgroundColor = AppColors.primary,
    this.disabledColor = AppColors.textGrey,
    this.splashColor = AppColors.textGrey,
    this.labelStyle,
    this.textColor = AppColors.white,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    double gap = 8,
    bool rightIcon = false,
    this.borderRadius = 10,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else ...[
            if (!rightIcon) ...[
              icon,
              gap.horizontalSpace,
            ],
            Text(
              label,
              style: labelStyle?.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor) ??
                  AppTextStyles.text14PxMedium.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor),
            ),
            if (rightIcon) ...[
              gap.horizontalSpace,
              icon,
            ],
          ]
        ];

  CustomButton.iconText({
    super.key,
    required this.label,
    required this.onPressed,
    required Widget icon,
    this.backgroundColor = AppColors.transparent,
    this.disabledColor = AppColors.transparent,
    this.splashColor = AppColors.textGrey,
    this.labelStyle,
    this.textColor = AppColors.primary,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    double gap = 8,
    bool rightIcon = false,
    this.borderRadius = 10,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else ...[
            if (!rightIcon) ...[
              5.horizontalSpace,
              icon,
              gap.horizontalSpace,
            ],
            Text(
              label,
              style: labelStyle?.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor) ??
                  AppTextStyles.text14PxMedium.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor),
            ),
            if (rightIcon) ...[
              gap.horizontalSpace,
              icon,
            ],
          ]
        ];

  CustomButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.transparent,
    this.disabledColor = AppColors.transparent,
    this.splashColor = AppColors.textGrey,
    this.labelStyle,
    this.textColor = AppColors.primary,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    this.borderRadius = 10,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else
            Text(
              label,
              style: labelStyle?.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor) ??
                  AppTextStyles.text14PxMedium.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor),
            )
        ];

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color disabledColor;
  final Color splashColor;
  final Color textColor;
  final TextStyle? labelStyle;
  final bool loading;
  final bool isDisabled;
  final bool fullWidth;
  final double height;
  final List<Widget> children;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDisabled ? disabledColor : backgroundColor,
      borderRadius: 24.rounded,
      clipBehavior: Clip.antiAlias,
      type: MaterialType.button,
      child: InkWell(
        onTap: (isDisabled || loading) ? null : onPressed,
        splashColor: splashColor.withOpacity(0.4),
        child: AnimatedContainer(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          height: height.h,
          child: Row(
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

class _ButtonLoading extends StatelessWidget {
  const _ButtonLoading({
    this.loadingColor = AppColors.white,
  });

  final Color loadingColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.r,
      height: 22.r,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: loadingColor,
        strokeWidth: 1.8,
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.borderColor = AppColors.primary,
      this.disabledColor = AppColors.textGrey,
      this.splashColor = AppColors.textGrey,
      this.labelStyle,
      this.textColor = AppColors.primary,
      this.loading = false,
      this.isDisabled = true,
      this.fullWidth = false,
      this.height = 44,
      this.horizontalPadding = 16.0,
      this.verticalPadding = 10.0})
      : children = [
          Text(
            label,
            style: labelStyle?.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor) ??
                AppTextStyles.text14PxMedium.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor),
          )
        ];

  CustomOutlinedButton.icon({
    super.key,
    required this.label,
    required this.onPressed,
    required Widget icon,
    bool rightIcon = false,
    this.borderColor = AppColors.primary,
    this.disabledColor = AppColors.textGrey,
    this.splashColor = AppColors.textGrey,
    this.labelStyle,
    this.textColor = AppColors.primary,
    this.loading = false,
    this.isDisabled = true,
    this.fullWidth = false,
    this.height = 44,
    double gap = 8,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 10.0,
  }) : children = [
          if (loading)
            _ButtonLoading(
              loadingColor: textColor,
            )
          else ...[
            if (!rightIcon) ...[
              icon,
              gap.horizontalSpace,
            ],
            Text(
              label,
              style: labelStyle?.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor) ??
                  AppTextStyles.text14PxMedium.copyWith(color: isDisabled ? textColor.withOpacity(0.6) : textColor),
            ),
            if (rightIcon) ...[
              gap.horizontalSpace,
              icon,
            ],
          ]
        ];

  final String label;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color disabledColor;
  final Color splashColor;
  final Color textColor;
  final TextStyle? labelStyle;
  final bool loading;
  final bool isDisabled;
  final bool fullWidth;
  final double height;
  final List<Widget> children;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: 24.rounded,
        side: BorderSide(
          color: isDisabled ? disabledColor : borderColor,
          width: 0.5.r,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      type: MaterialType.button,
      child: InkWell(
        onTap: (isDisabled || loading) ? null : onPressed,
        splashColor: splashColor.withOpacity(0.4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          height: height.h,
          child: Row(
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

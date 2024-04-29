import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oydeeedashboard/src/core/components/custom_text_field.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Welcome ! OYDEE',
                  style: AppTextStyles.text30PxSemiBold,
                ),
                50.verticalSpace,
                SizedBox(
                  width: 300,
                  child: CustomTextField(
                    textFieldLabel: "Username",
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  width: 300,
                  child: CustomTextField(
                    textFieldLabel: "Password",
                  ),
                ),
                40.verticalSpace,
                CustomButton(
                  label: "Login",
                  onPressed: () {},
                  fullWidth: true,
                  isDisabled: false,
                ).px(20.0),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

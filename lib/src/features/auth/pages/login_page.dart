import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oydeeedashboard/src/core/core.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome! OYDEE',
                      style: AppTextStyles.text30PxSemiBold,
                    ),
                    50.verticalSpace,
                    CustomTextField(
                      textFieldLabel: "Username",
                      validators: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    CustomTextField(
                      isPasswordField: true,
                      textFieldLabel: "Password",
                      validators: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Please enter a valid password';
                        }

                        return null;
                      },
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: AppTextStyles.text13Px.statusRed,
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    CustomButton(
                      label: "Login",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Do something
                        }
                      },
                      fullWidth: true,
                      isDisabled: false,
                    ).px(20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

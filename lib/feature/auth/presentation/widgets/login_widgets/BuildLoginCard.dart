import 'dart:ui';

import 'package:apppp/MainShellScreen%20.dart';
import 'package:apppp/core/constant/app_color.dart';
import 'package:apppp/feature/auth/presentation/pages/forget_password_page.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildDivider.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildLoginButton.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildSocialButtons.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/buildPasswordField.dart';
import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildTextFieldRegister.dart';
import 'package:flutter/material.dart';

class BuildLoginCard extends StatelessWidget {
  TextEditingController emailController;
  TextEditingController passwordController;
  BuildLoginCard({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColor.kCardBg.withOpacity(0.85),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.07),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Title
                const Text(
                  'تسجيل الدخول',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 28),

                // Email / Phone Field
                // BuildInputTextField(
                //   controller: emailController,
                //   hint: 'رقم الهاتف أو البريد الإلكتروني',
                //   icon: Icons.person_outline_rounded,
                //   keyboardType: TextInputType.emailAddress,
                // ),
                BuildTextFieldRegister(
                  lable: "البريد الإلكتروني",
                  controller: emailController,
                  hint: "رقم الهاتف أو البريد الإلكتروني",
                  icon: Icons.person_outline_rounded,
                ),

                // Password Field
                BuildPasswordField(
                  passwordController: passwordController,
                  lable: "كلمة المرور",
                ),
                const SizedBox(height: 14),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'نسيت كلمة المرور؟',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColor.kOrange,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Login Button
                BuildLoginButton(
                  text: "دخول",
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => MainShellScreen()));
                  },
                ),

                const SizedBox(height: 24),

                // Divider
                BuildDivider(text: "أو عبر"),

                const SizedBox(height: 20),

                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildSocialButtons(onTap: () {}, isApple: true),
                    const SizedBox(width: 16),
                    BuildSocialButtons(onTap: () {}, isGoogle: true),
                  ],
                ),
                const SizedBox(height: 20),

                // Guest Continue
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => MainShellScreen()));
                    },
                    child: const Text(
                      '← المتابعة كضيف',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColor.kTextMuted,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'dart:ui';
import 'package:apppp/MainShellScreen%20.dart';
import 'package:apppp/feature/auth/presentation/pages/login_page.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildBottomLink.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildDivider.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildLoginButton.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildSocialButtons.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/buildPasswordField.dart';
import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildHeaderRegister.dart';
import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildTextFieldRegister.dart';
import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildTopAppBar.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/buildBackground.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;


  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
        );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BuildBackground(),
          //////////////////////
          SafeArea(
            child: Column(
              children: [
                BuildTopAppBar(context: context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: FadeTransition(
                      opacity: _fadeAnim,
                      child: SlideTransition(
                        position: _slideAnim,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 24),
                            BuildHeaderRegister(),
                            const SizedBox(height: 36),
                            BuildTextFieldRegister(
                              lable: "الاسم الكامل",
                              controller: _nameController,
                              hint: ' أدخل اسمك الكامل',
                              icon: Icons.person_outline,
                              keyboardType: TextInputType.name,
                            ),
                            BuildTextFieldRegister(
                              lable: 'البريد الإلكتروني',
                              controller: _emailController,
                              hint: ' example@mail.com',
                              icon: Icons.mail_outline_rounded,
                              keyboardType: TextInputType.emailAddress,
                              isLtr: true,
                            ),
                            BuildTextFieldRegister(
                              lable: 'رقم الهاتف',
                              controller: _phoneController,
                              hint: '+20 1x xxxx xxxx',
                              icon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                              isLtr: true,
                            ),

                            BuildPasswordField(
                              lable: "كلمة المرور",
                              passwordController: _passwordController,
                            ),
                            const SizedBox(height: 32),
                            // _buildRegisterButton(),
                            BuildLoginButton(
                              text: "إنشاء حساب",
                              onPressed: () {    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => MainShellScreen()));},
                            ),
                            const SizedBox(height: 28),
                            BuildDivider(text: "أو التسجيل بواسطة"),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BuildSocialButtons(onTap: () {}, isApple: true),
                                const SizedBox(width: 16),
                                BuildSocialButtons(
                                  onTap: () {
                                    log("sign Up with Gooooogle");
                                  },
                                  isGoogle: true,
                                ),
                              ],
                            ),

                            const SizedBox(height: 32),
                            BuildBottomLink(
                              text: "لديك حساب بالفعل؟",
                              textWithColor: "تسجيل الدخول",
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => LoginScreen(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

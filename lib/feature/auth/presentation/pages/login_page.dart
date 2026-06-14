import 'dart:ui';

import 'package:apppp/feature/auth/presentation/pages/register_page.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildBottomLink.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildHeader.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildLoginCard.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/buildBackground.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
        );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Dark background with subtle food texture feel
          BuildBackground(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // Logo & Tagline
                  FadeTransition(opacity: _fadeAnim, child: BuildHeader()),

                  const SizedBox(height: 40),

                  // Login Card
                  SlideTransition(
                    position: _slideAnim,
                    child: FadeTransition(
                      opacity: _fadeAnim,
                      child: BuildLoginCard(
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Bottom link
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: BuildBottomLink(
                      text: "ليس لديك حساب؟",
                      textWithColor: "أنشئ حساباً جديداً",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RegisterScreen()),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math' as math;
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildBottomLink.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildLoginButton.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/buildBackground.dart';
import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildTextFieldRegister.dart';
import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildTopAppBar.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  final _emailController = TextEditingController();

  late AnimationController _animController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _pulseAnim;
  late Animation<double> _glowAnim;

  static const Color kOrange = Color(0xFFFF6A00);
  static const Color kInputBg = Color(0xFF2C2C2C);

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

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _glowAnim = Tween<double>(begin: 0.4, end: 0.9).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _pulseController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // _buildBackground(),
          BuildBackground(),
          SafeArea(
            child: Column(
              children: [
                // _buildTopBar(),
                BuildTopAppBar(context: context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: FadeTransition(
                      opacity: _fadeAnim,
                      child: SlideTransition(
                        position: _slideAnim,
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            _buildShieldIcon(),
                            const SizedBox(height: 44),
                            _buildTitle(),
                            const SizedBox(height: 44),
                            // _buildEmailLabel(),
                            BuildTextFieldRegister(
                              lable: "البريد الإلكتروني",
                              controller: _emailController,
                              hint: "example@gmail.com",
                              icon: Icons.email_outlined,
                            ),
                            // const SizedBox(height: 10),
                            // _buildEmailField(),
                            const SizedBox(height: 24),
                            BuildLoginButton(
                              text: "إرسال الرابط",
                              onPressed: () {},
                              isIcon: true,
                            ),
                            const SizedBox(height: 60),
                            BuildBottomLink(
                              text: "هل تذكرت كلمة المرور؟",
                              textWithColor: "تسجيل الدخول",
                            ),
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

 

  
  Widget _buildShieldIcon() {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnim.value,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kOrange.withOpacity(0.35), width: 1.5),
              gradient: RadialGradient(
                colors: [
                  kOrange.withOpacity(0.08 * _glowAnim.value),
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: kOrange.withOpacity(0.15 * _glowAnim.value),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: _ShieldKeyPainter(glowOpacity: _glowAnim.value),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        const Text(
          'نسيت كلمة المرور؟',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.60),
            fontWeight: FontWeight.w300,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  
  

 
    }

/// Custom painter for the shield + key icon
class _ShieldKeyPainter extends CustomPainter {
  final double glowOpacity;
  const _ShieldKeyPainter({required this.glowOpacity});

  static const Color kOrange = Color(0xFFFF6A00);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Shield path
    final shieldPaint = Paint()
      ..color = const Color(0xFF3A2200)
      ..style = PaintingStyle.fill;

    final shieldStrokePaint = Paint()
      ..color = kOrange.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final shieldPath = Path();
    final sw = size.width * 0.68;
    final sh = size.height * 0.80;
    final sx = cx - sw / 2;
    final sy = cy - sh / 2 - 4;

    shieldPath.moveTo(cx, sy);
    shieldPath.lineTo(sx + sw, sy + sh * 0.18);
    shieldPath.lineTo(sx + sw, sy + sh * 0.56);
    shieldPath.quadraticBezierTo(sx + sw, sy + sh * 0.84, cx, sy + sh);
    shieldPath.quadraticBezierTo(sx, sy + sh * 0.84, sx, sy + sh * 0.56);
    shieldPath.lineTo(sx, sy + sh * 0.18);
    shieldPath.close();

    // Shadow/glow
    canvas.drawPath(
      shieldPath,
      Paint()
        ..color = kOrange.withOpacity(0.12 * glowOpacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 12),
    );

    canvas.drawPath(shieldPath, shieldPaint);
    canvas.drawPath(shieldPath, shieldStrokePaint);

    // Key icon in center of shield
    _drawKey(canvas, size, cx, cy + 2);

    // Circular arrow around the key
    _drawCircularArrow(canvas, cx, cy + 2, size.width * 0.28);
  }

  void _drawKey(Canvas canvas, Size size, double cx, double cy) {
    final keyPaint = Paint()
      ..color = kOrange
      ..style = PaintingStyle.fill;

    // Key head (circle)
    final headRadius = size.width * 0.09;
    final headCenter = Offset(cx, cy - size.height * 0.06);

    canvas.drawCircle(headCenter, headRadius, keyPaint);
    canvas.drawCircle(
      headCenter,
      headRadius * 0.55,
      Paint()..color = const Color(0xFF3A2200),
    );

    // Key shaft
    final shaftPaint = Paint()
      ..color = kOrange
      ..strokeWidth = size.width * 0.055
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(cx, cy - size.height * 0.005),
      Offset(cx, cy + size.height * 0.16),
      shaftPaint,
    );

    // Key teeth
    canvas.drawLine(
      Offset(cx + size.width * 0.04, cy + size.height * 0.09),
      Offset(cx + size.width * 0.04, cy + size.height * 0.12),
      shaftPaint,
    );
    canvas.drawLine(
      Offset(cx + size.width * 0.04, cy + size.height * 0.12),
      Offset(cx + size.width * 0.075, cy + size.height * 0.12),
      shaftPaint,
    );
  }

  void _drawCircularArrow(Canvas canvas, double cx, double cy, double radius) {
    final arcPaint = Paint()
      ..color = kOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.8
      ..strokeCap = StrokeCap.round;

    // Draw arc (about 300 degrees)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      math.pi * 0.3,
      math.pi * 1.7,
      false,
      arcPaint,
    );

    // Arrowhead at end of arc
    final arrowAngle = math.pi * 0.3 + math.pi * 1.7;
    final ax = cx + radius * math.cos(arrowAngle);
    final ay = cy + radius * math.sin(arrowAngle);

    final arrowPath = Path();
    const arrowSize = 7.0;
    arrowPath.moveTo(ax, ay);
    arrowPath.lineTo(
      ax + arrowSize * math.cos(arrowAngle + math.pi * 0.6),
      ay + arrowSize * math.sin(arrowAngle + math.pi * 0.6),
    );
    arrowPath.moveTo(ax, ay);
    arrowPath.lineTo(
      ax + arrowSize * math.cos(arrowAngle - math.pi * 0.6),
      ay + arrowSize * math.sin(arrowAngle - math.pi * 0.6),
    );

    canvas.drawPath(
      arrowPath,
      Paint()
        ..color = kOrange
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.8
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ShieldKeyPainter old) =>
      old.glowOpacity != glowOpacity;
}

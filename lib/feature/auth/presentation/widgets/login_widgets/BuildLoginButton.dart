import 'package:flutter/material.dart';

class BuildLoginButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isIcon;
  const BuildLoginButton({
    required this.text,
    required this.onPressed,
    this.isIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon
                  ? Icon(Icons.send_rounded, color: Colors.white, size: 18)
                  : Container(),
              SizedBox(width: 8),
              Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Rounded gradient badge with a shield, used instead of the remote logo.
class RPassLogo extends StatelessWidget {
  const RPassLogo({super.key, this.size = 96});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF14B8A6), AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(size * 0.3),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.35),
            blurRadius: size * 0.3,
            offset: Offset(0, size * 0.1),
          ),
        ],
      ),
      child: Icon(Icons.verified_user_rounded,
          color: Colors.white, size: size * 0.55),
    );
  }
}

class RPassWordmark extends StatelessWidget {
  const RPassWordmark({super.key, this.fontSize = 32});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
          color: AppColors.ink,
        ),
        children: const [
          TextSpan(text: 'R-'),
          TextSpan(text: 'PASS', style: TextStyle(color: AppColors.primary)),
        ],
      ),
    );
  }
}

class RPassBrand extends StatelessWidget {
  const RPassBrand({super.key, this.logoSize = 96, this.fontSize = 32});

  final double logoSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RPassLogo(size: logoSize),
        const SizedBox(height: 16),
        RPassWordmark(fontSize: fontSize),
      ],
    );
  }
}

Widget rpassImageFallback(BuildContext context, Object error, StackTrace? stack) {
  return Container(
    color: AppColors.primarySoft,
    alignment: Alignment.center,
    child: const Icon(Icons.person_rounded, color: AppColors.primary, size: 32),
  );
}

import '/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App logo from bundled assets.
class RPassLogo extends StatelessWidget {
  const RPassLogo({super.key, this.size = 96});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.22),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withOpacity(0.25),
            blurRadius: size * 0.25,
            offset: Offset(0, size * 0.08),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.22),
        child: Image.asset('assets/images/R-PASS_logo.png', fit: BoxFit.cover),
      ),
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
        const SizedBox(height: 6),
        Text(
          'RONAT - Partner Authentication & Security System',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: AppColors.muted,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Единая база для автопрокатов',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: AppColors.muted,
          ),
        ),
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

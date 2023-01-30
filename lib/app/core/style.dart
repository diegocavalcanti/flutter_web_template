import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color textPrimary = Color(0xFF212529);
const Color textSecondary = Color(0xFF3A3A3A);

// Simple
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 26,
        color: textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
        fontSize: 20, color: textPrimary, fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle:
        const TextStyle(fontSize: 14, color: textSecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 14, color: textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle:
        const TextStyle(fontSize: 14, color: textPrimary, letterSpacing: 1));

ButtonStyle? menuButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: const Color(0xFFFFFFFF),
    textStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
            fontSize: 14, color: textPrimary, letterSpacing: 1)),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

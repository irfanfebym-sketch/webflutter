import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kmyLoginTextStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.060,
  color: const Color.fromARGB(255, 228, 5, 33),
  fontWeight: FontWeight.bold,
);

TextStyle kmyTitleTextStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.030,
  color: const Color.fromARGB(255, 0, 0, 0),
);

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: const Color.fromARGB(255, 40, 84, 196), height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: const Color.fromARGB(255, 0, 0, 0));

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(255, 228, 5, 33),
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Color.fromARGB(255, 0, 0, 0));
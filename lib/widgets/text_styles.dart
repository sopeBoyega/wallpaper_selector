import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final h1 = TextStyle(
    fontFamily: 'Clash Display',
    fontSize: 60,
    fontWeight: FontWeight.w600,
  );

  static final h2 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600, 
  );

  static final body = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final normalText  = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 125,125, 125)
  );

  static final caption = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500, 
  );
}

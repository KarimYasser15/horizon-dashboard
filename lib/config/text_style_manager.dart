import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleManager {
  static TextStyle interRegular = GoogleFonts.inter(
    color: ColorsManager.grey,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static TextStyle interMedium = GoogleFonts.inter(
    color: ColorsManager.black,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
  static TextStyle interSemiBold = GoogleFonts.inter(
    color: ColorsManager.black,
    fontWeight: FontWeight.w600,
    fontSize: 13,
  );
  static TextStyle interBold = GoogleFonts.inter(
    color: ColorsManager.black,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
}

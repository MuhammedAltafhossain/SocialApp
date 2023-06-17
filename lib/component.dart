import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String appVersion = "1.0.0";
const String appTitle = "Social App";
const String subTitle = "Let's spread happiness";

//! Size
const designSize = Size(375, 812);

// Box Size
const double defaultPadding = 16;
const double defaultMaxWidth = 400;
const double defaultNavBarHeight = 16 * 3.5;
const double defaultBoxHeight = 16 * 3;
const double defaultCarouselHeight = 16 * 11;

//! Color
const defaultWhite = Color(0xFFFFFFFF);
const defaultBlack = Color(0xFF1A1B23);
const defaultGray = Color(0xFF919191);
const defaultErrorColor = Color(0xFFF45050);

//* Gradient
const defaultGradientColor1 = Color(0xFF4DD969);
const defaultGradientColor2 = Color(0xFF28CD56);
const gradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
  defaultGradientColor1,
  defaultGradientColor2
]);

const MaterialColor primarySwatch = MaterialColor(
  0xFF4DD969,
  <int, Color>{
    50: Color(0xFFE6F7E6),
    100: Color(0xFFC1E9C2),
    200: Color(0xFF96DB97),
    300: Color(0xFF6BCD6C),
    400: Color(0xFF49C949),
    500: Color(0xFF4DD969),
    600: Color(0xFF44D261),
    700: Color(0xFF3BD759),
    800: Color(0xFF32CF51),
    900: Color(0xFF24C540),
  },
);

//! Font
//* Text
final largeText = GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 40, color: defaultBlack);
final mediumText = GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: defaultGray);
//* Title
final smallTitle = GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12, color: defaultBlack);
final mediumTitle = GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: defaultBlack);
final largeTitle = GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 40, color: defaultBlack);
//* SubTitle
final mediumSubTitle = GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: defaultGray);
final largeSubTitle = GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18, color: defaultBlack);
//* Other
final followerCount = GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 25, color: defaultBlack);

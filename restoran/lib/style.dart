import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kTextColor2 = Color(0xFF535353);
const kTextLighColor2 = Color(0xFFACACAC);
const kBackgroundColor = Color(0xFFF9F8FD);

const kDefaultPaddin = 20.0;

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.overlock(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.overlock(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.overlock(
    fontSize: 46, fontWeight: FontWeight.w400,),
  headline4: GoogleFonts.overlock(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.overlock(
    fontSize: 23, fontWeight: FontWeight.w400,),
  headline6: GoogleFonts.overlock(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.libreFranklin(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.libreFranklin(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
import 'package:flutter/material.dart';

abstract final class AppConstants {
  AppConstants._();

  static const cardImageUrl =
      'https://media.cntraveler.com/photos/58b463fe07cfb872af460fd6/16:9/w_2580%2Cc_limit/poolside-03-Burj-Al-Arab-Terrace-Infinity-Pool-cr-courtesy.jpg';
  static const lifeExpCardImageUrl =
      'https://media.istockphoto.com/id/2167016228/photo/msc-poesia-cruise-ship.jpg?s=612x612&w=0&k=20&c=0HNAsfJUJ1ivtPTZAqdoJwG9cJyazCivwcgx_itCqqg=';
  static const flashDealHotelImageUrl =
      'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600';

  static const gradientBegin = Alignment(-0.97, 0.26);
  static const gradientEnd = Alignment(0.97, -0.26);
  static const gradientStops = [0.0, 0.82];

  static const horizontalPadding = 16.0;
  static const appBarHeight = 70.0;
  static const contentTopOffset = 120.0;
  static const bottomNavHeight = 70.0;
  static const bottomSpacing = 100.0;

  static const radiusSmall = 6.0;
  static const radiusMedium = 10.0;
  static const radiusLarge = 12.0;
  static const radiusCard = 16.0;
  static const radiusCardTop = 24.0;

  static const iconSmall = 14.0;
  static const iconMedium = 22.0;
  static const iconLarge = 26.0;
}

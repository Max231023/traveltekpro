import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppStyles {
  AppStyles._();

  static const sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const sectionTitleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const sectionTitleWhite = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );

  static const bodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const bodySubtext = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  static const searchFieldLabel = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );

  static const searchFieldValue = TextStyle(
    fontSize: 15,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );

  static const searchButton = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const cardTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const cardTitleBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const cardSubtitle = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  static const cardPrice = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.vibrantBlue,
  );

  static const loyaltyTag = TextStyle(
    fontSize: 10,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle navLabel(bool selected) => TextStyle(
        fontSize: 11,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        color: selected ? AppColors.gradientEndAppBar : Colors.grey.shade600,
      );

  static const splashLogo = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textMuted,
  );
}

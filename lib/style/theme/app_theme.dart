import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/style/app_colors.dart';
import 'package:rick_and_morty_app/style/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        titleTextStyle: AppTextStyles.titleTextStyle.copyWith(color: AppColors.black),
        elevation: 0,
        centerTitle: false,
      ),
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottombarBgColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.black,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.black,
      ),
      cardColor: AppColors.cardColor,
      textTheme: TextTheme(
        bodyMedium: AppTextStyles.primaryTextStyle.copyWith(
          color: AppColors.black,
        ),
        displayMedium: AppTextStyles.cardTitleStyle.copyWith(color: AppColors.black),
        displaySmall: AppTextStyles.greyTextStyle.copyWith(
          color: Colors.grey[700],
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.titleTextStyle.copyWith(color: AppColors.white),
        elevation: 0,
        centerTitle: false,
      ),
      scaffoldBackgroundColor: AppColors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottombarBgColorDark,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.white,
      ),
      cardColor: AppColors.cardColorDark,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
      ),
      textTheme: TextTheme(
        bodyMedium: AppTextStyles.primaryTextStyle.copyWith(
          color: AppColors.white,
        ),
        displayMedium: AppTextStyles.cardTitleStyle.copyWith(color: AppColors.white),
        displaySmall: AppTextStyles.greyTextStyle.copyWith(
          color: Colors.grey[300],
        ),
      ),
    );
  }
}

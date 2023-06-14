import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/style/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.primaryColor,
    );
  }
}

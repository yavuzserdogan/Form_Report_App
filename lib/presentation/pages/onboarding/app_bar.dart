import 'package:flutter/material.dart';
import 'package:form_report_app/core/theme/app_colors.dart';
import 'package:form_report_app/core/strings/app_strings.dart';
import 'package:form_report_app/core/theme/app_spacing.dart';
import 'package:form_report_app/core/theme/app_radius.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingAppBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });
  @override
  Size get preferredSize => const Size.fromHeight(94.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 72.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSpacing.lg),
        ),
      ),
      title: Text(
        AppStrings.onboardingTitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.md),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: AppRadius.mediumRadius,
              ),
              child: Text(
                'Adım $currentStep / $totalSteps',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(22.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
          child: Container(
            height: 8,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: AppRadius.mediumRadius,
            ),
            child: AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              widthFactor: currentStep / totalSteps,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppRadius.mediumRadius,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF60A5FA), Color(0xFF1D4ED8)],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

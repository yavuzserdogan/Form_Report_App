import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/strings/app_strings.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              AppStrings.onboardingContinue,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 72.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.0)),
        ),

        title: Text(
          AppStrings.onboardingTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Adım 1 / 3',
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
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 12.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(height: 8, color: Colors.grey.shade200),
                  FractionallySizedBox(
                    widthFactor: 1 / 3,
                    child: Container(
                      height: 8,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF60A5FA), Color(0xFF1D4ED8)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(top: 150.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.largeRadius,
                  side: BorderSide(color: AppColors.border),
                ),
                child: Padding(
                  padding: AppSpacing.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.onboardingIdentityInfo,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        AppStrings.onboardingIdentityInfoDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: AppStrings.onboardingIdentityNameSurname,
                          hintText: AppStrings.onboardingIdentityHint,
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

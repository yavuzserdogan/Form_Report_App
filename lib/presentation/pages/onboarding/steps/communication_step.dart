import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_padding.dart';

class CommunicationStep extends StatelessWidget {
  const CommunicationStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPadding.screenPadding,
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
                padding: AppPadding.cardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.onboardingContactInfo,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      AppStrings.onboardingContactInfoDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24.0),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: AppStrings.onboardingContactEmail,
                        hintText: AppStrings.onboardingContactEmailHint,
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

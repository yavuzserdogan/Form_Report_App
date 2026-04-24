import 'package:flutter/material.dart';
import 'package:form_report_app/core/theme/app_colors.dart';
import 'package:form_report_app/core/strings/app_strings.dart';
import 'package:form_report_app/core/theme/app_radius.dart';
import 'package:form_report_app/core/theme/app_padding.dart';

class SignatureStep extends StatelessWidget {
  const SignatureStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPadding,
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(top: 100.0),
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
                    AppStrings.onboardingDigitalSignature,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    AppStrings.onboardingDigitalSignatureDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: AppRadius.mediumRadius,
                      border: Border.all(color: AppColors.border),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            AppStrings.onboardingSignatureClearButton,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            AppStrings.onboardingSignatureUploadButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

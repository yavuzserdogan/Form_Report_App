import 'package:flutter/material.dart';
import 'package:form_report_app/core/strings/app_strings.dart';
import 'package:form_report_app/core/theme/app_spacing.dart';
import 'package:form_report_app/presentation/pages/onboarding/steps/identity_step.dart';
import 'package:form_report_app/presentation/pages/onboarding/steps/communication_step.dart';
import 'package:form_report_app/presentation/pages/onboarding/steps/signature_step.dart';
import 'package:form_report_app/presentation/pages/onboarding/app_bar.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentStep = 1;
  final int _totalSteps = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(
        currentStep: _currentStep,
        totalSteps: _totalSteps,
      ),

      body: SafeArea(
        child: PageView(
          controller: _pageController,
          allowImplicitScrolling: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            IdentityStep(),
            CommunicationStep(),
            SignatureStep(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
        child: Row(
          children: [
            if (_currentStep > 1) ...[
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() => _currentStep--);
                  },
                  child: const Text(AppStrings.back),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
            ],
            Expanded(
              flex: _currentStep > 1 ? 2 : 3,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentStep < 3) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() => _currentStep++);
                  } else {}
                },
                child: Text(
                  _currentStep == 3 ? AppStrings.complete : AppStrings.next,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

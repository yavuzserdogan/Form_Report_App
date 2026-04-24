import "package:flutter/material.dart";
import 'package:form_report_app/core/theme/app_theme.dart';
import 'package:form_report_app/presentation/pages/home/home_page.dart';
import 'package:form_report_app/presentation/pages/main_layout.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,

      debugShowCheckedModeBanner: false,
      home: const MainLayout(),
    );
  }
}

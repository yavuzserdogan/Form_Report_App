import 'package:flutter/material.dart';
import 'app_spacing.dart';

class AppPadding {
  AppPadding._();

  static const EdgeInsets screenPadding = EdgeInsets.only(
    right: AppSpacing.md,
    left: AppSpacing.md,
    bottom: AppSpacing.lg,
  );
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.lg,
  );
}

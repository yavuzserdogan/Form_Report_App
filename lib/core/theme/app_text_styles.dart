import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  
  // Büyük ekran başlıkları, onboarding hero
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  // AppBar başlığı, sayfa üst başlıkları
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  // modal/dialog başlığı, section hero
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
  );

  // --------------------------------------------------
  // TITLES — AppBar, kart ve section başlıkları
  // --------------------------------------------------

  // kart başlığı
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Liste öğesi başlığı, alt section başlığı
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    color: AppColors.textPrimary,
  );

  // küçük grup başlığı, subtitle
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    color: AppColors.textPrimary,
  );

  // --------------------------------------------------
  // BODY — Ana içerik, paragraf, açıklama, liste öğesi
  // --------------------------------------------------

  // Uzun paragraf, detay sayfası
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  // Standart içerik, liste öğesi açıklaması
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  // Küçük yardımcı metin, tarih, metadata
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.4,
    color: AppColors.textHint,
  );

  // --------------------------------------------------
  // LABELS — Buton, chip, badge, tab, form label
  // --------------------------------------------------

  //ElevatedButton, TextButton, OutlinedButton etiketi
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
    color: AppColors.textOnPrimary,
  );

  // Chip, badge, tab label, adım göstergesi
  static const TextStyle labelMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.textPrimary,
  );

  // caption, timestamp, very small badge
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );
}

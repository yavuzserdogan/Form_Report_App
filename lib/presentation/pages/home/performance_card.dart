import 'package:flutter/material.dart';
import 'package:form_report_app/core/theme/app_colors.dart';

class PerformanceCard extends StatelessWidget {
  final String value;
  final String unit;
  final String description;
  final IconData icon;

  const PerformanceCard({
    super.key,
    required this.value,
    required this.unit,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    unit,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Icon(
                icon,
                color: AppColors.primary,
                size: 30,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:form_report_app/core/theme/app_colors.dart';
import 'package:form_report_app/presentation/pages/home/stat_card.dart';
import 'package:form_report_app/presentation/pages/home/performance_card.dart';
import 'package:form_report_app/presentation/pages/home/service_card.dart';
import 'package:form_report_app/core/theme/app_padding.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 32.0),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white70,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "18 Mart Çarşamba",
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white30, width: 2),
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Y",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Hoş Geldin, Yavuz!",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: const [
                      Expanded(
                        child: StatCard(
                          icon: Icons.description_outlined,
                          count: "156",
                          label: "RAPOR",
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: StatCard(
                          icon: Icons.storage_rounded,
                          count: "42",
                          label: "MAKİNE",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bu Ayki Performans",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      PerformanceCard(
                        value: "45",
                        unit: "saat",
                        description: "Sahada Harcanan Toplam Mesai",
                        icon: Icons.access_time,
                      ),
                      const SizedBox(width: 16),
                      PerformanceCard(
                        value: "569",
                        unit: "adet",
                        description: "Değiştirilen Yedek Parça",
                        icon: Icons.build,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Sık Verilen Hizmetler",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ServiceCard(
                    companyName: "ABC Enerji",
                    serviceType: "Periyodik Bakım",
                    serviceNumber: "23",
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

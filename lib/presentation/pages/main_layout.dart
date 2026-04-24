import 'package:flutter/material.dart';
import 'package:form_report_app/presentation/pages/home/home_page.dart';
import 'package:form_report_app/presentation/pages/pdf_archive/pdf_archive_page.dart';
import 'package:form_report_app/presentation/pages/service_record/service_record_page.dart';
import 'package:form_report_app/presentation/pages/analysis/analysis_page.dart';
import 'package:form_report_app/presentation/pages/report_form/report_form_page.dart';
import 'package:form_report_app/core/theme/app_colors.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    AnalysisPage(),
    PdfArchivePage(),
    ServiceRecordPage(),
    ReportFormPage(),
  ];

  void _onTabTapped(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReportFormPage()),
          );
        },

        backgroundColor: AppColors.primary,
        elevation: 1,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2.0,         
          ),
        ),
        //shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        // elevation: 8,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, 'Ana Sayfa', 0),
            _buildNavItem(Icons.bar_chart_rounded, 'Analiz', 1),
            const SizedBox(width: 55),
            _buildNavItem(Icons.description_outlined, 'Arşiv', 2),
            _buildNavItem(Icons.storage_rounded, 'Kayıtlar', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    final color = isActive ? const Color(0xFF3D5AFE) : Colors.grey;

    return InkWell(
      onTap: () => _onTabTapped(index),
      borderRadius: BorderRadius.circular(12),
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 19),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

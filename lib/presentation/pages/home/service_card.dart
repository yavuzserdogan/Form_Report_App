import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String companyName;
  final String serviceType;
  final String serviceNumber;

  const ServiceCard({
    super.key,
    required this.companyName,
    required this.serviceType,
    required this.serviceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
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
                Text(
                companyName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(),
              ),
                Text(
                serviceType,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(),
              ),
              Text(
                serviceNumber,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

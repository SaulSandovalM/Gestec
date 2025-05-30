import 'package:gestec/core/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:gestec/screens/dashboard/widget/main_dashboard.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainContainer(
      child: Column(
        children: [
          MainDashboard(headerHeight: 60),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

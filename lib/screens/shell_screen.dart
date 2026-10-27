import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'dashboard_screen.dart';
import 'incidents_screen.dart';
import 'profile_screen.dart';


class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    if (_index == 1) {
      _index = 0; // If search was selected, go to Dashboard
    } else if (_index > 1) {
      _index--; // Adjust index for subsequent tabs
    }
  }



  void _goTo(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboardScreen(),

      const IncidentsScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: IndexedStack(index: _index, children: pages),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _goTo,
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primarySoft,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: AppColors.primary),
            label: 'Главная',
          ),

          NavigationDestination(
            icon: Icon(Icons.warning_amber_rounded),
            selectedIcon:
                Icon(Icons.warning_amber_rounded, color: AppColors.primary),
            label: 'Инциденты',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon:
                Icon(Icons.person_rounded, color: AppColors.primary),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

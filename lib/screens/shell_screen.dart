import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'add_risk_screen.dart';
import 'dashboard_screen.dart';
import 'incidents_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _index = 0;

  void _goTo(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardScreen(onOpenSearch: () => _goTo(1)),
      const SearchScreen(),
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
      floatingActionButton: (_index == 0 || _index == 2)
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddRiskScreen()),
              ),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Добавить'),
            )
          : null,
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
            icon: Icon(Icons.search_rounded),
            selectedIcon: Icon(Icons.search_rounded, color: AppColors.primary),
            label: 'Поиск',
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

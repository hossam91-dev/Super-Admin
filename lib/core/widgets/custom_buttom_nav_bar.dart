import 'package:firm_super_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  //static const _activeColor = Color(0xFF4361EE);
  static const _inactiveColor = Color(0xFF9E9E9E);

  static const _items = [
    (icon: Icons.home_rounded),
    (icon: Icons.business_center),
    (icon: Icons.account_balance_wallet_outlined),
    (icon: Icons.monitor_heart_outlined),
    (icon: Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isActive = index == selectedIndex;

            return GestureDetector(
              onTap: () => onItemTapped(index),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 56,
                height: 72,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    width: isActive ? 44 : 36,
                    height: isActive ? 44 : 36,
                    decoration: isActive
                        ? BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          )
                        : null,
                    child: Icon(
                      item.icon,
                      size: 22,
                      color: isActive ? Colors.white : _inactiveColor,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool isActive;
  final void Function() onTap;
  const MenuTile({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? Colors.black.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: Colors.blue,
                ),
                const SizedBox(width: 6),
                Text(title, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
      ),
    );
  }
}
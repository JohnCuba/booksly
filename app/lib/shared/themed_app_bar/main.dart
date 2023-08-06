import 'package:booksly/config/theme.dart';
import 'package:flutter/material.dart';

class ThemedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  const ThemedAppBar({super.key, this.title, this.actions});
  
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      automaticallyImplyLeading: false,
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      elevation: Theme.of(context).appBarTheme.elevation,
      toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      titleSpacing: Theme.of(context).appBarTheme.titleSpacing,
      actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppTheme.lightTheme.appBarTheme.toolbarHeight ?? 50);
}
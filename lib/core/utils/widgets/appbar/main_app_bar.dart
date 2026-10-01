import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
    this.actions,
    this.actionsPadding,
    this.leading,
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final EdgeInsetsGeometry? actionsPadding;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // elevation: 2,
      // shadowColor: Colors.red,
      // leadingWidth: 100,
      actionsPadding: actionsPadding,
      actions: actions,
      leading: leading,

      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          // backgroundColor: Colors.amber
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

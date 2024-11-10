import 'package:firebase_auth1/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? tilte;
  final Widget? action;
  final Color? backgroundcolor;
  final bool hideBack;

  const BasicAppBar(
      {super.key,
      this.tilte,
      this.action,
      this.backgroundcolor,
      this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundcolor ?? Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: tilte ?? const Text(''),
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: AppColors.secondbackground, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.white,
                ),
              )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:carry_or_drag/constants/app_color.dart';
import 'package:carry_or_drag/constants/strings.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final bool? hasAppBar;
  final String? title;
  final List<Widget>? actionWidgets;
  final Widget bodyWidget;
  const BasePage(
      {super.key,
      this.hasAppBar = true,
      this.title,
      this.actionWidgets,
      required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar!
          ? AppBar(
              backgroundColor: appColor.primaryColor,
              centerTitle: true,
              title: Text(
                title ?? appStrings.appName,
                style: TextStyle(color: appColor.textWhite),
              ),
              actions: actionWidgets,
            )
          : null,
      body: bodyWidget,
    );
  }
}

import 'package:carry_or_drag/constants/base_page.dart';
import 'package:carry_or_drag/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return BasePage(
        bodyWidget: Column(
      children: [
        RadioListTile<ThemeMode>(
          title: const Text("Light Mode"),
          value: ThemeMode.light,
          groupValue: themeChanger.themeMode,
          onChanged: (val) => themeChanger.setTheme(val),
        ),
        RadioListTile<ThemeMode>(
          title: const Text("Dark Mode"),
          value: ThemeMode.dark,
          groupValue: themeChanger.themeMode,
          onChanged: (val) => themeChanger.setTheme(val),
        ),
        RadioListTile<ThemeMode>(
          title: const Text("System Mode"),
          value: ThemeMode.system,
          groupValue: themeChanger.themeMode,
          onChanged: (val) => themeChanger.setTheme(val),
        ),
      ],
    ));
  }
}

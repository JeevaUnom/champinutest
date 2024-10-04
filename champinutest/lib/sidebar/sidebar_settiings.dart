import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const SettingsPage({super.key, required this.themeNotifier});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeMode? _selectedThemeMode;

  @override
  void initState() {
    super.initState();
    _selectedThemeMode = widget.themeNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Light Theme'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _selectedThemeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _selectedThemeMode = value;
                  widget.themeNotifier.value = ThemeMode.light;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Dark Theme'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _selectedThemeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _selectedThemeMode = value;
                  widget.themeNotifier.value = ThemeMode.dark;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('System Default'),
            leading: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _selectedThemeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _selectedThemeMode = value;
                  widget.themeNotifier.value = ThemeMode.system;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class ChangeThemeView extends StatelessWidget {
  const ChangeThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCrt = context.read<ThemeController>();

    return Scaffold(
      appBar: AppBar(title: Text("Change theme")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<ThemeController, bool>(
              selector: (p0, p1) => p1.themeMode == ThemeMode.system,
              builder: (context, isSystemTheme, child) {
                return SwitchListTile(
                  value: isSystemTheme,
                  onChanged: (isSystemTheme) {
                    if (isSystemTheme) {
                      themeCrt.changeTheme(ThemeMode.system);
                    } else {
                      themeCrt.changeTheme(ThemeMode.light);
                    }
                  },
                  title: Text("Depends on system"),
                );
              },
            ),
            Selector<ThemeController, bool>(
              selector: (p0, p1) => p1.themeMode == ThemeMode.light,
              builder: (context, isLight, child) {
                return SwitchListTile(
                  title: Text("Select my choise"),
                  value: isLight,
                  onChanged: (isLight) {
                    if (isLight) {
                      themeCrt.changeTheme(ThemeMode.light);
                    } else {
                      themeCrt.changeTheme(ThemeMode.dark);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

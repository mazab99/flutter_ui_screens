import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/3_theme_with_provider/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
 //void main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await ThemeModel().loadTheme();
  //
  //   runApp(
  //     ChangeNotifierProvider(
  //       create: (context) => ThemeController(),
  //       child: const MyApp(),
  //     ),
  //   );
  // }
   // theme in material app >>  theme: Provider.of<ThemeController>(context).currentTheme,
  static const String _themeKey = 'theme';

  ThemeData _currentTheme = appThemeData;
  ThemeData get currentTheme => _currentTheme;

  ThemeController() {
    loadTheme();
  }

  Future<void> toggleTheme() async {
    _currentTheme =
        _currentTheme == appThemeData ? darkAppThemeData : appThemeData;
    print('New theme: $_currentTheme');
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _themeKey, _currentTheme == appThemeData ? 'light' : 'dark');
    print('Theme saved: ${_currentTheme == appThemeData ? 'light' : 'dark'}');
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString(_themeKey) ?? 'light';
    _currentTheme = themeName == 'light' ? appThemeData : darkAppThemeData;
    notifyListeners();
  }
}

import 'package:associatemember/consts/theme_data.dart';
import 'package:associatemember/provider/auth_provider.dart';
import 'package:associatemember/provider/dark_theme_provider.dart';
import 'package:associatemember/screen/city_select_screen.dart';
import 'package:associatemember/screen/home_screen.dart';
import 'package:associatemember/screen/login_screen.dart';
import 'package:associatemember/screen/register_screen.dart';
import 'package:associatemember/screen/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    themeChangeProvider.SetDarkTheme =
        await themeChangeProvider.themePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isDark = true;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => LoginScreen(),
            "/register": (context) => RegisterScreen(),
            "/select-city": (context) => CitySelectScreen(),
            "/upload": (context) => UploadScreen(),
            "/home": (context) => HomeScreen()
          },
        ));
  }
}

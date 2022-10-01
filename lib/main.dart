import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_redesign/util/theme_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'theme/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key ? key
  }): super(key: key);

  @override
  State < MyApp > createState() => _MyAppState();
}

class _MyAppState extends State < MyApp > {

  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (_) {
              return themeChangeProvider;
            },
            child: Consumer < ThemeProvider > (
              builder: (BuildContext context, value, Widget ? child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                  home: const Home(),
                );
              },
            ),
          );
        }
    );
  }
}

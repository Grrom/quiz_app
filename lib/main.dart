import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_card/modules/home/components/home_screen.dart';
import 'package:stamp_card/shared/constants/custom_colors.dart';
import 'package:stamp_card/shared/constants/string_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConstants.appName,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: CustomColors.textWhite,
          ),
          backgroundColor: CustomColors.mainBlue,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.backgroundSurface,
          ),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: CustomColors.mainBlue,
          onPrimary: CustomColors.textBlack,
          secondary: CustomColors.textSecondary,
          onSecondary: CustomColors.textWhite,
          error: CustomColors.expressiveRed,
          onError: CustomColors.expressiveRed,
          surface: CustomColors.backgroundSurface,
          onSurface: CustomColors.textPrimary,
        ),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

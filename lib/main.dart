import 'package:bloc_template/app_theme.dart';
import 'package:bloc_template/config/routes/routes.dart';
import 'package:bloc_template/config/routes/routes_name.dart';
import 'package:bloc_template/localization/app_locale.dart';
import 'package:bloc_template/localization/languages.dart';
import 'package:bloc_template/repository/auth/login_http_api_repository.dart';
import 'package:bloc_template/repository/auth/login_mock_api_repository.dart';
import 'package:bloc_template/repository/auth/login_repository.dart';
import 'package:bloc_template/repository/movies/movies_http_api_repository.dart';
import 'package:bloc_template/repository/movies/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
FlutterLocalization localization = FlutterLocalization.instance;
ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

void main() {
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _loadTheme()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode.value = prefs.getBool("darkTheme")! ? ThemeMode.dark : ThemeMode.light;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTheme();
    localization.init(
        mapLocales: [
          const MapLocale(Languages.english, AppLocale.en),
          const MapLocale(Languages.hindi, AppLocale.hi),
        ],
        initLanguageCode: Languages.english,
    );
    localization.onTranslatedLanguage = (p0) {
      setState(() {});
    };
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeMode,
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            supportedLocales: localization.supportedLocales,
            locale: localization.currentLocale,
            localizationsDelegates: localization.localizationsDelegates,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: theme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.generateRoutes,
            initialRoute: RoutesName.splashScreen,
          );
        },
    );
  }
}

void servicesLocator(){
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesHttpApiRepository());
}
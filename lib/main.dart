import 'package:exampur_mobile/SplashScreen/splash_screen.dart';
import 'package:exampur_mobile/theme/themes.dart';






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_downloader/flutter_downloader.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await FlutterDownloader.initialize(debug: true);



  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({
  //   Key? key,
  // }) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
 // final AppRouter _appRouter = AppRouter();
 @override



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // List<Locale> _locals = [];
    // AppConstants.languages.forEach((language) {
    //   _locals.add(Locale(language.languageCode!, language.countryCode));
    // });

    return MaterialApp(
      title: 'Exampur',
      theme: CustomTheme.lightTheme,
      //darkTheme: CustomTheme.darkTheme,

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,


     // onGenerateRoute: _appRouter.onGenerateRoute,

      home: SplashScreen(),
    );
    }
  }

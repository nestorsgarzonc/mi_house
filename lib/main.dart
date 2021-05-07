import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mi_house/core/routes/routes.dart';
import 'package:mi_house/core/theme/light_theme.dart';
import 'package:mi_house/screens/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('my_house');
  Intl.defaultLocale = 'es_CO';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomLightTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LoginScreen.route,
      routes: routes,
    );
  }
}


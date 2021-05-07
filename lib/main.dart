import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mi_house/core/routes/routes.dart';
import 'package:mi_house/core/theme/light_theme.dart';
import 'package:mi_house/core/util/app_state.dart';
import 'package:mi_house/dependency_injection.dart';
import 'package:mi_house/features/auth/auth_provider.dart';
import 'package:mi_house/screens/auth/index_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  await Hive.initFlutter();
  await Hive.openBox('my_house');
  Intl.defaultLocale = 'es_CO';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final di = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (ctx) => AuthProvider(httpHandler: di(), token: sl()),
        ),
      ],
      child: MaterialApp(
        theme: CustomLightTheme.getTheme(),
        navigatorKey: appContext.context,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: IndexScreen.route,
        routes: routes,
      ),
    );
  }
}

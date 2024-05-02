import 'package:carry_or_drag/firebase_options.dart';
import 'package:carry_or_drag/provider/modify_item_no.dart';
import 'package:carry_or_drag/provider/theme_changer_provider.dart';
import 'package:carry_or_drag/views/pages/payment_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => CountChanger()),
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          themeMode: themeChanger.themeMode,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: const PaymentPage(),
          // home: const AuthPage(),
        );
      }),
    );
  }
}

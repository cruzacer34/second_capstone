import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/providers/filter_provider.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/route_generator.dart';
import 'package:second_capstone/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const SecondCapstone());
}

class SecondCapstone extends StatelessWidget {
  const SecondCapstone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersProvider()),
        ChangeNotifierProvider(create: (context) => JobApplicationsProvider()),
        ChangeNotifierProvider(create: (context) => JobPostingProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
      ],
      child: const CupertinoApp(
        theme: CupertinoThemeData(
          primaryColor: Color(0xFF4CA6A8),
          scaffoldBackgroundColor: Color(0xFFFCFCFC),
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/providers/users.dart';
import 'package:second_capstone/route_generator.dart';
import 'package:second_capstone/screens/splash_screen.dart';

void main() {
  runApp(const SecondCapstone());
}

class SecondCapstone extends StatelessWidget {
  const SecondCapstone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersManager()),
      ],
      child: const CupertinoApp(
          theme: CupertinoThemeData(
            primaryColor: Color(0xFF4CA6A8),
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          home: SplashScreen(),
        ),
    );
  }
}

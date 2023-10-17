import 'package:dorah/presentations/screens/auth/authentication_screen.dart';
import 'package:dorah/presentations/screens/auth/verification_screen.dart';
import 'package:dorah/presentations/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Do nothing
  // Daily commit

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dorah',
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SplashScreen.routeName:
            return MaterialPageRoute(builder: (_) => const SplashScreen());

          // Auth
          case AuthenticationScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const AuthenticationScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });
          case VerificationScreen.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            final loginMethod = args['loginMethod'];
            final loginInput = args['loginInput'];
            final verificationId = args['verificationId'];
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => VerificationScreen(
                      loginMethod: loginMethod,
                      loginInput: loginInput,
                      verificationId: verificationId,
                      // TODO: userId: '',
                      userId: '',
                    ),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child);
                });

          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
    );
  }
}

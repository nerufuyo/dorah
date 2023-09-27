import 'package:dorah/presentations/screens/auth/authentication_screen.dart';
import 'package:dorah/presentations/screens/auth/verification_screen.dart';
import 'package:dorah/presentations/screens/main/account_screen.dart';
import 'package:dorah/presentations/screens/main/home_screen.dart';
import 'package:dorah/presentations/screens/main/main_screen.dart';
import 'package:dorah/presentations/screens/main/message_screen.dart';
import 'package:dorah/presentations/screens/main/reward_screen.dart';
import 'package:dorah/presentations/screens/main/ticket.screen.dart';
import 'package:dorah/presentations/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dorah',
      initialRoute: MainScreen.routeName,
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
          case MainScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const MainScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });
          case HomeScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomeScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });
          case RewardScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const RewardScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });
          case MessageScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const MessageScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });
          case TicketScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const TicketScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });
          case AccountScreen.routeName:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const AccountScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                });

          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
    );
  }
}

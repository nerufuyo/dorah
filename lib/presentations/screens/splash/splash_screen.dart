// ignore_for_file: depend_on_referenced_packages

import 'package:dorah/firebase_options.dart';
import 'package:dorah/presentations/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void firebaseFetch() async {
    await Firebase.initializeApp(
      name: 'dorah',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void navigationToNextScreen() => Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, MainScreen.routeName),
      );

  @override
  void initState() {
    super.initState();
    firebaseFetch();
    navigationToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary60,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('lib/assets/images/logo.svg'),
            customVerticalSpace(height: 8),
            SvgPicture.asset('lib/assets/images/tagline.svg'),
          ],
        ),
      ),
    );
  }
}

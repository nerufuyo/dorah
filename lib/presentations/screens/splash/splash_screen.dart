import 'package:dorah/presentations/screens/auth/authentication_screen.dart';
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
  void navigationToNextScreen() => Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, AuthenticationScreen.routeName),
      );

  @override
  void initState() {
    super.initState();
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
            customSpace(width: 0, height: 8),
            SvgPicture.asset('lib/assets/images/tagline.svg'),
          ],
        ),
      ),
    );
  }
}

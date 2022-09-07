import 'package:app/constants.dart';
import 'package:app/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: SvgPicture.asset(
          'Assets/logo.svg',
        ),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 1500),
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 150,
        duration: 2000,
        nextScreen: const HomePage(),
        backgroundColor: ThemeWhiteColor,
        //disableNavigation: true,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idonland/ui/onboarding/landing_screen.dart';
import 'package:idonland/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  // static const routeName = '/splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          milliseconds: 1700,
        ), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, _, __) {
            return const LandingScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.dark, //<-- For iOS SEE HERE (dark icons)
      ),
      child: Scaffold(
        backgroundColor: kBlack,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.1,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: Image.asset(
                        'assets/images/splash_logo.png',
                        width: size.width * 0.4,
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoActivityIndicator(
                  color: kWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

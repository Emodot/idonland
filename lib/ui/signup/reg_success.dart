import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/signup/newuser_signin_screen.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';

class RegSucess extends StatefulWidget {
  const RegSucess({super.key});

  @override
  State<RegSucess> createState() => _RegSucessState();
}

class _RegSucessState extends State<RegSucess> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 4), () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NewuserSigninScreen(),
        ),
      );
      // print("changedpage");
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
        backgroundColor: kBgColor,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: kBgColor,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/landingBg.png",
                ),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.08,
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/icons/logo-icon.svg",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                    ),
                    children: [
                      TextSpan(
                        text: "Your Registration\n",
                        style: TextStyle(
                          fontSize: getBiggerRegText(context),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "was successful",
                        style: TextStyle(
                          fontSize: getBiggerRegText(context),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: CupertinoActivityIndicator(
                    color: kWhite,
                  ),
                ),
                // const Spacer(),
                // ActionButton(
                //   size: size,
                //   btnName: 'Next',
                //   color: kSecColor,
                //   btnAction: () {Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(
                //         builder: (context) => const NewuserSigninScreen(),
                //       ),
                //     );},
                // ),
                // SizedBox(
                //   height: size.height * 0.05,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

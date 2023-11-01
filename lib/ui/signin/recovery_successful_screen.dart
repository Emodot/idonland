import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/signup/newuser_signin_screen.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';

class RecoverySuccessfulScreen extends StatelessWidget {
  const RecoverySuccessfulScreen({super.key});

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Center(
                    child: SvgPicture.asset("assets/icons/logo-icon.svg"),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                    ),
                    children: [
                      TextSpan(
                        text: "Your Password recovery\n",
                        style: TextStyle(
                          fontSize: getBiggerRegText(context),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "was Successful",
                        style: TextStyle(
                          height: 1.7,
                          fontSize: getBiggerRegText(context),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Text(
                  "follow the next steps in your email",
                  style: TextStyle(
                    fontSize: getBigRegText(context),
                    color: kWhite,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: ActionButton(
                    size: size,
                    textWidget: Text(
                      'Next',
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: getRegText(context),
                      ),
                    ),
                    color: kPrimaryColor,
                    btnAction: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const NewuserSigninScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

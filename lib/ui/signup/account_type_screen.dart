import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/signup/newuser_signin_screen.dart';
import 'package:idonland/ui/signup/signup_screen.dart';
import 'package:idonland/utils/show_custom_snackbar.dart';
import 'package:idonland/utils/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({super.key});

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  int? selectedRadioTile;
  String accountType = '';
  late Timer timer;
  bool btnLoading = false;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
      // print(selectedRadioTile);
      switch (val) {
        case 1:
          accountType = 'Business';
          break;
        case 2:
          accountType = 'Individual';
          break;
        case 3:
          accountType = 'Enterprise';
          break;
      }
      // print(accountType);
    });
  }

  void _saveAccountType(val) async {
    print(val);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accountType", val);
    // print(accountType);
    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ),
      );
    }
    // setState(() {
    //   btnLoading = true;
    //   timer = Timer(const Duration(seconds: 2), () {
    //     btnLoading = false;

    //   });
    // });
    // if (accountType == '') {
    //   showCustomSnackbar("Select an Account Type");
    // } else {

    // }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset(
              //   "assets/images/noActionMenu.png",
              //   width: 35,
              // ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Redefine your business",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: getBiggerRegText(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Do you do business alone or you work with a team",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: getRegText(context),
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AccountType(
                size: size,
                clickAction: () {
                  _saveAccountType('individual');
                },
                title: 'Individual Account',
                image: 'assets/images/individualAccount.png',
                subTitle:
                    'Sign up for a personalized experience with idonland.',
              ),
              AccountType(
                size: size,
                clickAction: () {
                  _saveAccountType('biz');
                },
                title: 'Business Account',
                image: 'assets/images/businessAccount.png',
                subTitle:
                    'Streamline, collaborate and drive growth with idonland.',
              ),
              AccountType(
                size: size,
                clickAction: () {
                  _saveAccountType('business');
                },
                title: 'Enterprise Account',
                image: 'assets/images/enterpriceAccount.png',
                subTitle: 'Gain control, Management, and Advanced analytics.',
              ),
              // Container(
              //   height: size.height * 0.1,
              //   margin: EdgeInsets.only(bottom: size.height * 0.02),
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: kWhite,
              //     borderRadius: BorderRadius.circular(15),
              //     // border: Border.all(
              //     //   color: const Color(0xFF6172A0),
              //     //   width: 0.2
              //     // ),
              //   ),
              //   child: RadioListTile(
              //     value: 1,
              //     groupValue: selectedRadioTile,
              //     title: Text(
              //       "Business Account",
              //       style: TextStyle(
              //         fontSize: getBigRegText(context),
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     subtitle: Text(
              //       "Create an account that serves your business",
              //       style: TextStyle(
              //         fontSize: getSmallRegText(context),
              //       ),
              //     ),
              //     onChanged: (val) {
              //       setSelectedRadioTile(val!);
              //     },
              //     activeColor: newPrimaryColor,
              //     // selected: ,
              //   ),
              // ),
              // Container(
              //   height: size.height * 0.1,
              //   margin: EdgeInsets.only(bottom: size.height * 0.02),
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: kWhite,
              //     borderRadius: BorderRadius.circular(15),
              //     // border: Border.all(
              //     //   color: const Color(0xFF6172A0),
              //     //   width: 0.2
              //     // ),
              //   ),
              //   child: RadioListTile(
              //     value: 2,
              //     groupValue: selectedRadioTile,
              //     title: Text(
              //       "Individual Account",
              //       style: TextStyle(
              //         fontSize: getBigRegText(context),
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     subtitle: Text(
              //       "Create an account that serves your business",
              //       style: TextStyle(
              //         fontSize: getSmallRegText(context),
              //       ),
              //     ),
              //     onChanged: (val) {
              //       setSelectedRadioTile(val!);
              //     },
              //     activeColor: newPrimaryColor,
              //     // selected: ,
              //   ),
              // ),
              // Container(
              //   height: size.height * 0.1,
              //   margin: EdgeInsets.only(bottom: size.height * 0.02),
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: kWhite,
              //     borderRadius: BorderRadius.circular(15),
              //     // border: Border.all(
              //     //   color: const Color(0xFF6172A0),
              //     //   width: 0.2
              //     // ),
              //   ),
              //   child: RadioListTile(
              //     value: 3,
              //     groupValue: selectedRadioTile,
              //     title: Text(
              //       "Enterprise Account",
              //       style: TextStyle(
              //         fontSize: getBigRegText(context),
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     subtitle: Text(
              //       "Create an account that serves your business",
              //       style: TextStyle(
              //         fontSize: getSmallRegText(context),
              //       ),
              //     ),
              //     onChanged: (val) {
              //       setSelectedRadioTile(val!);
              //     },
              //     activeColor: newPrimaryColor,
              //     // selected: ,
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.05,
              // ),
              // GoogleAndSideBtn(
              //   size: size,
              //   // btnName: "Next",
              //   btnAction: _saveAccountType,
              //   color: newPrimaryColor,
              //   textWidget: btnLoading
              //       ? const SizedBox(
              //           height: 20,
              //           width: 20,
              //           child: CircularProgressIndicator(
              //             color: kWhite,
              //             strokeWidth: 3,
              //           ),
              //         )
              //       : Text(
              //           'Next',
              //           style: TextStyle(
              //               color: kWhite,
              //               fontWeight: FontWeight.w700,
              //               fontSize: getRegText(context)),
              //         ),
              // ),
              const Spacer(),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Jost',
                      ),
                      children: [
                        TextSpan(
                          text: "Already have an Account?\n",
                          style: TextStyle(
                            fontSize: getRegText(context),
                            color: kTextColor,
                          ),
                        ),
                        TextSpan(
                          text: "Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NewuserSigninScreen(),
                                ),
                              );
                            },
                          style: TextStyle(
                            height: 1.5,
                            fontSize: getBigRegText(context),
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor,
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountType extends StatelessWidget {
  const AccountType({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.clickAction,
  });

  final Size size;
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback clickAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickAction,
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.037,
          bottom: size.height * 0.03,
        ),
        // height: size.height * 0.11,
        margin: EdgeInsets.only(
          bottom: size.height * 0.02,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFEEF5FA), width: 1.5),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              child: Image.asset(
                image,
                width: size.width * 0.15,
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title \n',
                    style: TextStyle(
                      height: 0.3,
                      color: kTextColor,
                      fontSize: getBigRegText(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subTitle,
                    // softWrap: false,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.2,
                      color: kTextColor,
                      fontSize: getSmallRegText(context),
                    ),
                  ),
                ],
              ),
            ),
            // Text.rich(
            //   TextSpan(
            //     style: const TextStyle(
            //       fontFamily: 'Jost',
            //       // overflow: TextOverflow.clip
            //     ),
            //     children: [
            //       TextSpan(
            //         text: '$title \n',
            //         style: TextStyle(
            //           color: kSecColorV2,
            //           fontSize: getBigRegText(context),
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       TextSpan(
            //         text: subTitle,
            //         style: TextStyle(
            //           color: kSecColorV2,
            //           fontSize: getSmallRegText(context),
            //         ),
            //       ),
            //     ],
            //   ),
            //   softWrap: false,
            //   // maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // )
          ],
        ),
      ),
    );
  }
}

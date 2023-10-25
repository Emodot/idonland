import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:idonland/ui/signup/newuser_signin_screen.dart';
import 'package:idonland/utils/constant.dart';
// import 'package:idonland/ui/signin/signin_screen.dart';
// import 'package:idonland/ui/signup/account_type_screen.dart';
import 'package:idonland/utils/styles.dart';
// import 'package:idonland/widgets/google_and_side_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_action/slide_action.dart';

String userEmail = '';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    loadDeviceId();
  }

  void loadDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    String? deviceModel;
    String? deviceName;
    String? deviceType;
    String? deviceEntry;

    if (kIsWeb) {
      final webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceId =
          '${webBrowserInfo.vendor ?? '-'} + ${webBrowserInfo.userAgent ?? '-'} + ${webBrowserInfo.hardwareConcurrency.toString()}';
    } else if (Platform.isAndroid) {
      const androidId = AndroidId();
      deviceId = await androidId.getId();
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.model;
      deviceName = iosInfo.name;
      deviceType = iosInfo.name;
      deviceEntry = iosInfo.systemName;
      deviceId = iosInfo.identifierForVendor;
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfo.linuxInfo;
      deviceId = linuxInfo.machineId;
    } else if (Platform.isWindows) {
      final windowsInfo = await deviceInfo.windowsInfo;
      deviceId = windowsInfo.deviceId;
    } else if (Platform.isMacOS) {
      final macOsInfo = await deviceInfo.macOsInfo;
      deviceId = macOsInfo.systemGUID;
    }
    // print('Model - $deviceModel, Name - $deviceName, Type - $deviceType, Entry - $deviceEntry');
    prefs.setString("deviceId", deviceId!);
    prefs.setString("deviceModel", deviceModel ?? '');
    prefs.setString("deviceName", deviceName ?? '');
    prefs.setString("deviceType", deviceType ?? '');
    prefs.setString("deviceEntry", deviceEntry ?? '');
    // setState(() {
    //   userEmail = prefs.getString("userEmail") ?? '';
    //   print(userEmail);
    // });

    // print(prefs.containsKey("deviceId"));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.dark, //<-- For iOS SEE HERE (dark icons)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/landingBgV2.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Amazing \nBusiness Experiences.",
                        style: TextStyle(
                          fontSize: getLargeRegText(context),
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "with everything you need to scale...",
                        style: TextStyle(
                          fontSize: getBigRegText(context),
                          color: kWhite,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SlideActionBtn(),
                  // Center(
                  //   child: RichText(
                  //     text: TextSpan(
                  //       style: const TextStyle(
                  //         fontFamily: 'Jost',
                  //       ),
                  //       children: [
                  //         const TextSpan(
                  //           text: "Don’t have an account? ",
                  //         ),
                  //         TextSpan(
                  //           text: "Sign up",
                  //           recognizer: TapGestureRecognizer()
                  //             ..onTap = () {
                  //               Navigator.of(context).push(
                  //                 MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       const AccountTypeScreen(),
                  //                 ),
                  //               );
                  //             },
                  //           style: getRegBoldTextWhite(context),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideActionBtn extends StatelessWidget {
  const SlideActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFF00178D),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black26,
            //     blurRadius: 8,
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 30,
              ),
              Center(
                child: Text(
                  // Show loading if async operation is being performed
                  state.isPerformingAction
                      ? "please wait..."
                      : "slide to start",
                  style: const TextStyle(
                    color: kWhite,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: !state.isPerformingAction
                    ? SvgPicture.asset(
                        'assets/icons/chevron-double-right.svg',
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        );
      },
      thumbBuilder: (context, state) {
        return Container(
          // margin: const EdgeInsets.all(4),
          child: Center(
            // Show loading indicator if async operation is being performed
            child: state.isPerformingAction
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : SvgPicture.asset(
                    'assets/icons/slider-btn.svg',
                  ),
          ),
        );
      },
      action: () async {
        // Async operation
        await Future.delayed(
            const Duration(seconds: 2),
            () => {
                  print('working'),
                }
            // Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => const SigninScreen(),
            //         ),
            //       ),
            );
      },
    );
  }
}

class RootscardName extends StatelessWidget {
  const RootscardName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: const TextStyle(color: kWhite),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          ),
          hintText: "enter rootscard name",
          hintStyle: TextStyle(
            fontSize: 16,
            color: kWhite.withOpacity(0.9),
          ),
          filled: true,
          fillColor: const Color(0xFF0D90FB),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF63B2FE),
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF0D90FB),
                width: 2,
              )),
        ),
      ),
    );
  }
}

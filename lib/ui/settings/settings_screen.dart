import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.03,
                ),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: getLargerText(context),
                    fontWeight: FontWeight.w500,
                    color: kWhite,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.08,
                        ),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: getBiggerText(context),
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.08,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFF1D1A18),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Profile',
                                        style: TextStyle(
                                          fontSize: getBigRegText(context),
                                          color: kWhite,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/icons/send.svg')
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Privacy and Security',
                                        style: TextStyle(
                                          fontSize: getBigRegText(context),
                                          color: kWhite,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/icons/send.svg')
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Support and Help',
                                        style: TextStyle(
                                          fontSize: getBigRegText(context),
                                          color: kWhite,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/icons/send.svg')
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Dark mode (Theme)',
                                        style: TextStyle(
                                          fontSize: getBigRegText(context),
                                          color: kWhite,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/icons/send.svg')
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Switch to creating',
                                        style: TextStyle(
                                          fontSize: getBigRegText(context),
                                          color: kWhite,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/icons/send.svg')
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Log out',
                                        style: TextStyle(
                                          fontSize: getBigRegText(context),
                                          color: kWhite,
                                        ),
                                      ),
                                      SvgPicture.asset('assets/icons/send.svg')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.08,
                        ),
                        child: Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: getBiggerText(context),
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1D1A18),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: size.height * 0.07,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Push Notifications',
                                      style: TextStyle(
                                        fontSize: getBigRegText(context),
                                        color: kWhite,
                                      ),
                                    ),
                                    SvgPicture.asset('assets/icons/send.svg')
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: size.height * 0.07,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email Notifications',
                                      style: TextStyle(
                                        fontSize: getBigRegText(context),
                                        color: kWhite,
                                      ),
                                    ),
                                    SvgPicture.asset('assets/icons/send.svg')
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: size.height * 0.07,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Event Reminders',
                                      style: TextStyle(
                                        fontSize: getBigRegText(context),
                                        color: kWhite,
                                      ),
                                    ),
                                    SvgPicture.asset('assets/icons/send.svg')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

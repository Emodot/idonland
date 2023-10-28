import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkModeTheme = true;
  bool pushNotification = true;
  bool emailNotification = false;

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
                  top: size.height * 0.02,
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
                                      'Dark mode (Theme)',
                                      style: TextStyle(
                                        fontSize: getBigRegText(context),
                                        color: kWhite,
                                      ),
                                    ),
                                    CustomSwitch(
                                      data: darkModeTheme,
                                      onTap: (value) {
                                        setState(() {
                                          darkModeTheme = value;
                                        });
                                      },
                                    ),
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
                            SizedBox(
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
                                  CustomSwitch(
                                    data: pushNotification,
                                    onTap: (value) {
                                      setState(() {
                                        pushNotification = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
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
                                  CustomSwitch(
                                    data: emailNotification,
                                    onTap: (value) {
                                      setState(() {
                                        emailNotification = value;
                                      });
                                    },
                                  ),
                                ],
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

class CustomSwitch extends StatefulWidget {
  final void Function(bool) onTap;
  const CustomSwitch({
    super.key,
    required this.data,
    required this.onTap,
  });

  final bool data;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 35.0,
      height: 17.0,
      toggleSize: 10.0,
      value: widget.data,
      borderRadius: 30.0,
      padding: 3.0,
      activeColor: kPrimaryColor,
      inactiveColor: const Color(0xFF494949),
      activeToggleColor: const Color(0xFF1D1A18),
      inactiveToggleColor: const Color(0xFF1D1A18),
      onToggle: (val) {
        widget.onTap(val);
      },
    );
  }
}

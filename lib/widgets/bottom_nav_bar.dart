import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/ui/settings/settings_screen.dart';
import 'package:idonland/ui/workplace/workplace_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:idonland/data/provider/user_provider.dart';
import 'package:idonland/utils/constant.dart';
// import 'package:idonland/ui/settings/settings_screen.dart';
import 'package:idonland/utils/styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    this.onChanged,
    required this.currentIndex,
  });

  final ValueChanged<int>? onChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    // final providerUser = Provider.of<UserProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      color: kBlack,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      elevation: 10,
      height: Platform.isAndroid ? size.height * 0.1 : size.height * 0.12,
      child: Padding(
        padding: EdgeInsets.only(
          // top: size.height * 0.01,
          // bottom: size.height * 0.015,
          left: size.width * 0.02,
          right: size.width * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                onChanged?.call(0);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/home-2.svg",
                    colorFilter: currentIndex == 0
                        ? const ColorFilter.mode(
                            kWhite,
                            BlendMode.srcIn,
                          )
                        : ColorFilter.mode(
                            kWhite.withOpacity(0.3),
                            BlendMode.srcIn,
                          ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: currentIndex == 0
                            ? kWhite
                            : kWhite.withOpacity(0.3),
                        fontSize: getSmallRegText(context)),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                onChanged?.call(1);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/trend-up.svg",
                    colorFilter: currentIndex == 1
                        ? const ColorFilter.mode(
                            kWhite,
                            BlendMode.srcIn,
                          )
                        : ColorFilter.mode(
                            kWhite.withOpacity(0.3),
                            BlendMode.srcIn,
                          ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Workplace",
                    style: TextStyle(
                        color: currentIndex == 1
                            ? kWhite
                            : kWhite.withOpacity(0.3),
                        fontSize: getSmallRegText(context)),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/Home.svg",
                  colorFilter:
                      const ColorFilter.mode(kTransparent, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "My Space",
                  style: TextStyle(
                      color: kWhite.withOpacity(0.3),
                      fontSize: getSmallRegText(context)),
                )
              ],
            ),
            InkWell(
              onTap: () {
                onChanged?.call(2);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/video-time.svg",
                    colorFilter: currentIndex == 2
                        ? const ColorFilter.mode(
                            kWhite,
                            BlendMode.srcIn,
                          )
                        : ColorFilter.mode(
                            kWhite.withOpacity(0.3),
                            BlendMode.srcIn,
                          ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Events",
                    style: TextStyle(
                        color: currentIndex == 2
                            ? kWhite
                            : kWhite.withOpacity(0.3),
                        fontSize: getSmallRegText(context)),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                onChanged?.call(3);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/settings-icon.svg",
                    colorFilter: currentIndex == 3
                        ? const ColorFilter.mode(
                            kWhite,
                            BlendMode.srcIn,
                          )
                        : ColorFilter.mode(
                            kWhite.withOpacity(0.3),
                            BlendMode.srcIn,
                          ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: currentIndex == 3
                            ? kWhite
                            : kWhite.withOpacity(0.3),
                        fontSize: getSmallRegText(context)),
                  )
                ],
              ),
            ),
          ].map((e) => Expanded(child: e)).toList(),
        ),
      ),
    );
  }
}

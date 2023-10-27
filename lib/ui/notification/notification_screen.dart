import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';
// import 'package:idonland/widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(size: size, name: 'Notifications',),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              SingleNotification(size: size),
              SingleNotification(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleNotification extends StatelessWidget {
  const SingleNotification({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.012,
          ),
          color: const Color(0xFF4285F4),
          child: Text(
            'Sep 3, 2023',
            style: TextStyle(
                color: kWhite,
                fontSize: getRegText(context),
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
            // width: double.infinity,
            padding: EdgeInsets.only(
              left: size.width * 0.08,
              right: size.width * 0.03,
              top: size.height * 0.03,
              bottom: size.height * 0.03,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/notification-status-inner.svg',
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transactions',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: getBigRegText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'john doe just transacted #30000 worth of coke. Click here to view more details',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: getSmallRegText(context),
                          height: 1.5,
                        ),
                        // overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                // RichText(
                //   text: TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'Transactions \n',
                //         style: TextStyle(
                //           color: kWhite,
                //           fontSize: getBigRegText(context),
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       TextSpan(
                //         text:
                //             'john doe just transacted #30000 worth of coke. Click here to view more details',
                //         style: TextStyle(
                //           color: kWhite,
                //           fontSize: getSmallRegText(context),
                //           height: 1.5,
                //           overflow: TextOverflow.ellipsis,
                //           softWrap: false,
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            )),
      ],
    );
  }
}

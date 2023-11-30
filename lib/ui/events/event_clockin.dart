import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';
import 'package:slide_action/slide_action.dart';

class EventClockin extends StatefulWidget {
  const EventClockin({super.key});

  @override
  State<EventClockin> createState() => _EventClockinState();
}

class _EventClockinState extends State<EventClockin> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.07,
            right: size.width * 0.07,
            top: size.height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Events',
                  style: TextStyle(
                    fontSize: getLargerText(context),
                    fontWeight: FontWeight.w500,
                    color: kWhite,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'You don land inside',
                  style: TextStyle(
                    fontSize: getBigRegText(context),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF696D6E),
                  ),
                ),
                Text(
                  'AI intro and everything',
                  style: TextStyle(
                    fontSize: getBigRegText(context),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '10:15',
                        style: TextStyle(
                          fontSize: getLargerText(context),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      Text(
                        'Friday, Jul 09',
                        style: TextStyle(
                          fontSize: getRegText(context),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF696D6E),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                const SlideActionBtn(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(size.width * 1, size.height * 0.07),
                    backgroundColor: kTransparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Chat with Event Creator",
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Clock In Time',
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF696D6E),
                            ),
                          ),
                          Text(
                            '09:02:45',
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color(0xFF696D6E),
                        thickness: 0.5,
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Worked',
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF696D6E),
                            ),
                          ),
                          Text(
                            '01:13:45',
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color(0xFF696D6E),
                        thickness: 0.5,
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Breaks',
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF696D6E),
                            ),
                          ),
                          Text(
                            '00:00:00',
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
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

class SlideActionBtn extends StatelessWidget {
  const SlideActionBtn({
    Key? key,
    // required this.selected,
  }) : super(key: key);

  // final bool selected;

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kPrimaryColor.withOpacity(0.3)
              // border: Border.all(
              //   color: kPrimaryColor,
              //   width: 1,
              // ),
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
                      : "Slide to Clock Out",
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
                    width: 55,
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
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const MainLayout(),
                  //   ),
                  // ),
                });
      },
    );
  }
}

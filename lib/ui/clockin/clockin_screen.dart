import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';
import 'package:slide_action/slide_action.dart';

class ClockinScreen extends StatelessWidget {
  const ClockinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: getLargerText(context),
                      color: const Color(0xFFC2C4C9),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding: const EdgeInsets.all(0),
                    icon: SvgPicture.asset('assets/icons/back.svg'),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'Rootshive',
                style: TextStyle(
                  fontSize: getLargerText(context),
                  fontWeight: FontWeight.w200,
                  color: kWhite,
                ),
              ),
              Text(
                'Please wait while we sign you up to rootshive',
                style: TextStyle(
                  fontSize: getBigRegText(context),
                  fontWeight: FontWeight.w300,
                  color: kWhite,
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/routing-2.svg'),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'This action was successful',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: getBigRegText(context),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const SlideActionBtn(),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
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
                      : "slide to clockin",
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

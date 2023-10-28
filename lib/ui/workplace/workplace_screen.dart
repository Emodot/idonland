import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/utils/styles.dart';

import '../../utils/constant.dart';

class WorkplaceScreen extends StatelessWidget {
  const WorkplaceScreen({super.key});

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
                  'Workplace',
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

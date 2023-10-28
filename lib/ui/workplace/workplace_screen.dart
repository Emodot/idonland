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
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.4,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E2024),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        height: size.height * 0.2,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E2024),
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

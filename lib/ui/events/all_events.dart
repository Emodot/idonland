import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/ui/dashboard/search_screen.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Events',
                      style: TextStyle(
                        fontSize: getLargerText(context),
                        fontWeight: FontWeight.w500,
                        color: kWhite,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/search-icon.svg',
                          ),
                          padding: const EdgeInsets.all(0),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/filter-icon.svg',
                          ),
                          padding: const EdgeInsets.all(0),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding: const EdgeInsets.all(0),
                    icon: SvgPicture.asset('assets/icons/revert.svg'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'All Events',
                    style: TextStyle(
                      fontSize: getBiggerText(context),
                      fontWeight: FontWeight.w500,
                      color: kWhite,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const Expanded(
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

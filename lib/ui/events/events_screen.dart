import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:idonland/ui/dashboard/dashboard_screen.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';

List<Map<String, String>> clockedInEvents = [
  {
    'cardName': 'Event Name',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardName': 'Organization',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardName': 'Event Name',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
];
List<Map<String, String>> registeredEvents = [
  {
    'cardName': 'Event Name',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardName': 'Organization',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardName': 'Event Name',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
];
List<Map<String, String>> suggestedEvents = [
  {
    'cardName': 'Event Name',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardName': 'Organization',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardName': 'Event Name',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
];

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
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
                  'Events',
                  style: TextStyle(
                    fontSize: getLargerText(context),
                    fontWeight: FontWeight.w500,
                    color: kWhite,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clocked-In Events',
                        style: TextStyle(
                            color: kWhite, fontSize: getBigRegText(context)),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      DashboardTopBox(
                        size: size,
                        boxData: clockedInEvents,
                        nuban: '564323456',
                        // switchAccount: switchAccount,
                        loading: false,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Registered Events',
                        style: TextStyle(
                            color: kWhite, fontSize: getBigRegText(context)),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      DashboardTopBox(
                        size: size,
                        boxData: registeredEvents,
                        nuban: '564323456',
                        // switchAccount: switchAccount,
                        loading: false,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Suggested Events',
                        style: TextStyle(
                            color: kWhite, fontSize: getBigRegText(context)),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      DashboardTopBox(
                        size: size,
                        boxData: suggestedEvents,
                        nuban: '564323456',
                        // switchAccount: switchAccount,
                        loading: false,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: size.height * 0.05,
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

class DashboardTopBox extends StatefulWidget {
  // final void Function(String) selectCard;
  // final void Function selectCard
  const DashboardTopBox({
    super.key,
    required this.size,
    required this.boxData,
    required this.nuban,
    // required this.selectCard,
    required this.loading,
    required this.onTap,
  });

  final Size size;
  final List boxData;
  final String? nuban;
  final bool loading;
  final VoidCallback onTap;

  @override
  State<DashboardTopBox> createState() => _DashboardTopBoxState();
}

class _DashboardTopBoxState extends State<DashboardTopBox> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  bool _hideAmount = false;
  void toggleHideAmount() {
    setState(() {
      _hideAmount = !_hideAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final boxData = walletBalanceController.result;
    return Column(
      children: [
        CarouselSlider(
          items: widget.boxData.map((card_data) {
            return widget.loading
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: card_data['cardCategory'] == 'event'
                            ? const Color(0xFF333333)
                            : kPrimaryColor,
                        image: const DecorationImage(
                          alignment: Alignment.centerRight,
                          image: AssetImage(
                            "assets/images/dashboardHeroBg.png",
                          ),
                          opacity: 0.2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(28),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.size.width * 0.07,
                          vertical: widget.size.height * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: card_data['cardCategory'] == 'event'
                                        ? kPrimaryColor
                                        : const Color(0xFF333333),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 11,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      '${card_data['cardCategory']}',
                                      style: TextStyle(
                                        color: kWhite,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                        fontSize: getSmallerRegText(context),
                                      ),
                                    ),
                                  ),
                                ),
                                // const Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: widget.size.height * 0.04,
                            ),
                            Text(
                              "${card_data['cardName']}",
                              style: TextStyle(
                                color: kWhite,
                                fontSize: getRegText(context),
                              ),
                            ),
                            Text(
                              '${card_data['cardTitle']}',
                              style: TextStyle(
                                color: kWhite,
                                fontSize: getBiggerRegText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // SizedBox(
                            //   height: widget.size.height * 0.02,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
          }).toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              height: widget.size.height * 0.22,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.boxData.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: SliderIndicator(
                  isActive: index == _current,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

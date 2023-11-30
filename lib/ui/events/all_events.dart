import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idonland/ui/dashboard/search_screen.dart';
import 'package:idonland/ui/events/event_clockin.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';

List<Map<String, String>> allEvents = [
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'Rootshive',
    'cardCategory': 'office',
  },
  {
    'cardDate': 'Friday, December 1  |  11:00am',
    'cardTitle': 'AI intro and everything',
    'cardCategory': 'event',
  },
];

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
            // top: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  // top: size.height * 0.02,
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
                        SizedBox(
                          width: size.width * 0.02,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EventBox(
                        size: size,
                        boxData: allEvents,
                        loading: false,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EventClockin(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventBox extends StatefulWidget {
  const EventBox({
    super.key,
    required this.size,
    required this.boxData,
    required this.loading,
    required this.onTap,
  });
  final Size size;
  final List boxData;
  final bool loading;
  final VoidCallback onTap;

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.boxData.map((card_data) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: widget.size.height * 0.01),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF333333),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.size.width * 0.05,
                vertical: widget.size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: card_data['cardCategory'] == 'event'
                          ? kPrimaryColor
                          : const Color(0xFF000000),
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
                  SizedBox(
                    height: widget.size.height * 0.01,
                  ),
                  Text(
                    '${card_data['cardTitle']}',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: getBiggerText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${card_data['cardDate']}",
                    style: TextStyle(
                      color: kWhite,
                      fontSize: getRegText(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

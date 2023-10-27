import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
import 'package:idonland/main_layout.dart';
import 'package:idonland/ui/notification/notification_screen.dart';
// import 'package:idonland/utils/app_constants.dart';
import 'package:idonland/utils/constant.dart';
// import 'package:idonland/ui/dashboard/qr_scanner.dart';
// import 'package:idonland/ui/notification/notification_screen.dart';
// import 'package:idonland/utils/show_custom_snackbar.dart';
import 'package:idonland/utils/styles.dart';
// import 'package:idonland/widgets/quick_action_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_action/slide_action.dart';
// import 'package:skeletons/skeletons.dart';

late String deviceId;

String newBankCode = '';
String newBankName = 'Select Bank';

String selectedBankCode = '';
String selectedAccountNumber = '';
String selectedAmount = '';
var amountController = TextEditingController();
var spacenameController = TextEditingController();
dynamic transferPin;

List<Map<String, String>> boxData = [
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
dynamic selectedCard;
late bool cardSelected;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();
  // DashboardController dashboardController = Get.put(DashboardController());
  // WalletBalanceController walletBalanceController =
  //     Get.put(WalletBalanceController());
  // SavedBankController savedBankController = Get.put(SavedBankController());
  // CreateSpaceController createSpaceController =
  //     Get.put(CreateSpaceController());
  // SwitchAccountController switchAccountController =
  //     Get.put(SwitchAccountController());
  late TabController tabController;
  bool _createSpace = false;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
    cardSelected = true;
  }

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
        // key: _key,
        // drawer: SideMenu(size: size),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                bottom: size.height * 0.025,
                top: size.height * 0.09,
              ),
              color: kBgColor2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/userImage.png",
                          ),
                          // NetworkImage(
                          //   providerUser.user?.photo ?? '',
                          // ),
                          // radius: 25,
                          maxRadius: 25,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome, David 👋',
                                style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getBigText(context),
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              Text(
                                'Reports snapshot',
                                style: TextStyle(
                                  color: kWhite.withOpacity(0.4),
                                  fontSize: getSmallRegText(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/search-icon.svg',
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/bell.svg',
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                color: kBgColor,
                onRefresh: () async {
                  // print('Refresh');
                  // await getUserDetail();
                  // await getwalletBalance();
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.width * 0.02,
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: getLargeText(context),
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Your daily clockins',
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: getBigRegText(context),
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 1, color: kPrimaryColor),
                              color: kTransparent,
                            ),
                            child: TabBar(
                              controller: tabController,
                              indicator: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 1, color: kPrimaryColor)),
                              labelColor: kWhite,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getRegText(context),
                                fontFamily: 'Raleway',
                              ),
                              splashFactory: NoSplash.splashFactory,
                              tabs: const [
                                Tab(
                                  text: 'Work',
                                ),
                                Tab(
                                  text: 'All',
                                ),
                                Tab(
                                  text: 'Events',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DashboardTopBox(
                          size: size,
                          balanceData: boxData,
                          nuban: '564323456',
                          // switchAccount: switchAccount,
                          loading: false,
                          selectCard: (String) {
                            cardSelected = true;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: Column(
                            children: [
                              Text(
                                '10:15',
                                style: TextStyle(
                                  color: kWhite,
                                  fontFamily: 'Raleway',
                                  fontSize: getLargerText(context),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Sunday, 17 September 2023',
                                style: TextStyle(
                                  color: kWhite,
                                  fontFamily: 'Jost',
                                  fontSize: getRegText(context),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              SlideActionBtn(
                                selected: cardSelected,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.2,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     ...List.generate(
                        //       2,
                        //       (index) => Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 2),
                        //         child: SliderIndicator(
                        //           isActive: index == _current,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    // controller.isLoading
                    //     ? SkeletonTheme(
                    //         darkShimmerGradient: const LinearGradient(
                    //           colors: [
                    //             Color(0xFF222222),
                    //             Color(0xFF242424),
                    //             Color(0xFF2B2B2B),
                    //             Color(0xFF242424),
                    //             Color(0xFF222222),
                    //           ],
                    //           stops: [
                    //             0.0,
                    //             0.2,
                    //             0.5,
                    //             0.8,
                    //             1,
                    //           ],
                    //           begin: Alignment(-2.4, -0.2),
                    //           end: Alignment(2.4, 0.2),
                    //           tileMode: TileMode.clamp,
                    //         ),
                    //         child: Column(
                    //           children: [
                    //             SkeletonParagraph(
                    //               style: SkeletonParagraphStyle(
                    //                 lines: 4,
                    //                 spacing: 6,
                    //                 lineStyle: SkeletonLineStyle(
                    //                   height: size.height * 0.07,
                    //                   borderRadius: const BorderRadius.all(
                    //                     Radius.circular(5),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(
                    //                 horizontal: size.width * 0.07,
                    //               ),
                    //               child: SkeletonLine(
                    //                 style: SkeletonLineStyle(
                    //                   height: size.height * 0.12,
                    //                   borderRadius: const BorderRadius.all(
                    //                     Radius.circular(10),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               margin: EdgeInsets.symmetric(
                    //                 vertical: size.height * 0.05,
                    //               ),
                    //               child: SkeletonLine(
                    //                 style: SkeletonLineStyle(
                    //                   height: size.height * 0.23,
                    //                   borderRadius: const BorderRadius.all(
                    //                     Radius.circular(10),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               margin: EdgeInsets.only(
                    //                 bottom: size.height * 0.1,
                    //               ),
                    //               child: SkeletonParagraph(
                    //                 style: const SkeletonParagraphStyle(
                    //                   lines: 2,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     :
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      height: 4,
      width: isActive ? 30 : 20,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : const Color(0xFF333333),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}

class DashboardTopBox extends StatefulWidget {
  final void Function(String) selectCard;
  // final void Function selectCard
  const DashboardTopBox({
    super.key,
    required this.size,
    required this.balanceData,
    required this.nuban,
    required this.selectCard,
    required this.loading,
  });

  final Size size;
  final List balanceData;
  final String? nuban;
  final bool loading;

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
    // final balanceData = walletBalanceController.result;
    return Column(
      children: [
        CarouselSlider(
          items: widget.balanceData.map((card_data) {
            return widget.loading
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = card_data['cardTile'];
                        cardSelected = true;
                        print(cardSelected);
                      });
                    },
                    child: Container(
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
                          vertical: widget.size.width * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: widget.size.height * 0.03,
                                  ),
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
                                const Spacer(),
                                // IconButton(
                                //   onPressed: toggleHideAmount,
                                //   icon: SvgPicture.asset(
                                //     _hideAmount
                                //         ? "assets/icons/showAmount.svg"
                                //         : "assets/icons/hideAmount.svg",
                                //     width: 18,
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
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
                            SizedBox(
                              height: widget.size.height * 0.03,
                            ),
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
              widget.balanceData.length,
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

class SlideActionBtn extends StatelessWidget {
  const SlideActionBtn({
    Key? key,
    required this.selected,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    const ColorFilter greyFilter = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
    return SlideAction(
      trackBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: selected == true
                ? const Color(0xFF1E2024)
                : kPrimaryColor.withOpacity(0.3),
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
                      : "slide to start",
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
                    colorFilter: selected == true ? null : greyFilter,
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

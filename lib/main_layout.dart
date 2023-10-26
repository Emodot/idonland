// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/dashboard/dashboard_screen.dart';
import 'package:idonland/widgets/bottom_nav_bar.dart';
// import 'package:idonland/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// var formatter = NumberFormat('#,##,000');
// NumberFormat formatter = NumberFormat.decimalPatternDigits(
//     locale: 'en_us',
//     decimalDigits: 2,
// );

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: kWhite,
      key: scaffoldKey,
      // drawer: SideMenu(size: size),
      body: IndexedStack(
        index: _index,
        children: const [
          DashboardScreen(),
          // RootscardScreen(),
          // WalletScreen(),
          // SettingsScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const TransactionsScreen(),
          //   ),
          // );
        },
        backgroundColor: kWhite,
        // elevation: 2.0,
        child: SvgPicture.asset("assets/icons/floatingBtnAction.svg"),
      ),
      bottomNavigationBar: BottomNavBar(
        onChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
      ),
    );
  }
}

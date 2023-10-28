import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idonland/ui/clockin/clockin_screen.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/utils/styles.dart';

var refController = TextEditingController();

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              Text(
                'Search',
                style: TextStyle(
                  fontSize: getLargerText(context),
                  fontWeight: FontWeight.w500,
                  color: kWhite,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
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
                  const SeachInput(),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ClockinScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * 0.07,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1D1A18),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rootshive',
                              style: TextStyle(
                                  fontSize: getBigRegText(context),
                                  color: kWhite,
                                  fontWeight: FontWeight.w600),
                            ),
                            SvgPicture.asset('assets/icons/send.svg')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeachInput extends StatefulWidget {
  const SeachInput({
    super.key,
  });

  @override
  State<SeachInput> createState() => _SeachInputState();
}

class _SeachInputState extends State<SeachInput> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: refController,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: getRegText(context),
          color: kWhite,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          hintText: "enter event or organization name ",
          hintStyle: TextStyle(
            fontSize: getBigText(context),
            fontWeight: FontWeight.w200,
            color: kWhite,
          ),
          // prefixIcon: const Padding(
          //   padding: EdgeInsets.all(15.0),
          //   child: Icon(
          //     Icons.search,
          //     size: 20,
          //     color: Color(0xFFC3D3DD),
          //   ),
          // ),
          filled: true,
          fillColor: kTransparent,
          // suffixIcon: Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: SvgPicture.asset(
          //     "assets/icons/check.svg",
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

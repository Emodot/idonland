import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:idonland/controllers/forgot_password_controller.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/signin/recovery_successful_screen.dart';
import 'package:idonland/ui/signup/signup_screen.dart';
import 'package:idonland/utils/show_custom_snackbar.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';

var emailController = TextEditingController();

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  // ForgotPasswordController forgotPasswordController =
  //     Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // void recoverPassword() async {
    //   var forgotPasswordController = Get.find<ForgotPasswordController>();
    //   String email = emailController.text.trim();
    //   if (!GetUtils.isEmail(email)) {
    //     showCustomSnackbar("Enter a Valid Email Address", title: "Error");
    //   } else {
    //     forgotPasswordController.recoverPassword(email).then((data) => {
    //           if (data['status'] == '200')
    //             {
    //               showCustomSnackbar(
    //                 'Recovery link sent to email address',
    //                 isError: false,
    //                 title: 'Success',
    //               ),
    //               Navigator.of(context).pushReplacement(
    //                 MaterialPageRoute(
    //                   builder: (context) => const RecoverySuccessfulScreen(),
    //                 ),
    //               )
    //             }
    //         });
    //   }
    // }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: Center(
                    child: Text(
                      "Recover Password",
                      style: TextStyle(
                        fontSize: getBiggerRegText(context),
                        fontWeight: FontWeight.w700,
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Enter email to recover Password",
                    style: TextStyle(
                      fontSize: getBigRegText(context),
                      fontWeight: FontWeight.w600,
                      color: kWhite,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                const InputEmail(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: ActionButton(
                    size: size,
                    textWidget: Text(
                      'Next',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: getRegText(context)),
                    ),
                    color: kPrimaryColor,
                    btnAction: () {
                      // recoverPassword();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              const RecoverySuccessfulScreen(),
                        ),
                      );
                    },
                  ),
                ),
                // GoogleAndSideBtn(
                //   size: size,
                //   btnName: "Next",
                //   btnAction: () {
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(
                //         builder: (context) => const RecoverySuccessfulScreen(),
                //       ),
                //     );
                //   }, color: kSecColor,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputEmail extends StatefulWidget {
  const InputEmail({
    super.key,
  });

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
              fontSize: getRegText(context),
              // fontWeight: FontWeight.w600,
              color: kWhite,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: getRegText(context),
              // fontWeight: FontWeight.w600,
              color: kWhite,
            ),
            decoration: InputDecoration(
                hintText: "Enter here",
                hintStyle: TextStyle(
                    fontSize: getHintInputText(context),
                    color: kWhite.withOpacity(0.5)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset("assets/icons/message.svg"),
                ),
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: SvgPicture.asset(
                //     "assets/icons/check.svg",
                //   ),
                // ),
                enabledBorder: getInputBox(context),
                focusedBorder: getInputBox(context)),
          ),
        ],
      ),
    );
  }
}

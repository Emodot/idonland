import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:idonland/controllers/login_controller.dart';
// import 'package:idonland/data/models/login_body_model.dart';
import 'package:idonland/main_layout.dart';
import 'package:idonland/ui/signup/account_type_screen.dart';
import 'package:idonland/ui/signup/signup_screen.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/signin/device_authorization.dart';
import 'package:idonland/ui/signin/recover_password_screen.dart';
// import 'package:idonland/screens/signup/signup_screen.dart';
import 'package:idonland/utils/show_custom_snackbar.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class NewuserSigninScreen extends StatefulWidget {
  const NewuserSigninScreen({super.key});

  @override
  State<NewuserSigninScreen> createState() => _NewuserSigninScreenState();
}

class _NewuserSigninScreenState extends State<NewuserSigninScreen> {
  // LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // void login() async {
    //   Get.put(SharedPreferences);
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   var loginController = Get.find<LoginController>();
    //   String email = emailController.text.trim();
    //   String password = passwordController.text.trim();
    //   prefs.setString("email", email);
    //   // print('working -$email - $password');

    //   if (!GetUtils.isEmail(email)) {
    //     showCustomSnackbar("Enter a Valid Email Address", title: "Error");
    //   } else if (password.length < 8) {
    //     showCustomSnackbar("Password cannot be less than 8", title: "Error");
    //   } else {
    //     LoginBody loginBody = LoginBody(
    //       email: email,
    //       password: password,
    //     );
    //     loginController.login(loginBody).then(
    //           (data) => {
    //             // print(data),
    //             if (data['status'] == '201')
    //               {
    //                 showCustomSnackbar(
    //                   'OTP sent to email address',
    //                   isError: false,
    //                   title: 'Success',
    //                 ),
    //                 Navigator.of(context).pushReplacement(
    //                   MaterialPageRoute(
    //                     builder: (context) => const DeviceAuthorization(),
    //                   ),
    //                 )
    //               }
    //             else if (data['status'] == '200')
    //               {
    //                 Navigator.of(context).pushReplacement(
    //                   MaterialPageRoute(
    //                     builder: (context) => const MainLayout(),
    //                   ),
    //                 )
    //               }
    //           },
    //         );
    //   }
    // }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
      child: Scaffold(
          backgroundColor: kBgColor,
          // resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.1),
                      child: Center(
                          child:
                              SvgPicture.asset("assets/icons/logo-icon.svg")),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/back.svg",
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: size.height * 0.05,
                        child: Text(
                          "Switch Account",
                          style: TextStyle(
                            fontSize: getBigRegText(context),
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: const [
                        InputEmail(),
                        InputPassword(),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    ActionButton(
                      size: size,
                      textWidget: Text(
                        'Sign In',
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
                            builder: (context) => const DeviceAuthorization(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RecoverPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontSize: getBigRegText(context),
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                          ),
                          children: [
                            const TextSpan(
                              text: "Don’t have an account? ",
                              style: TextStyle(
                                color: kWhite,
                              ),
                            ),
                            TextSpan(
                              text: "Sign up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                              style: TextStyle(
                                fontSize: getRegText(context),
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _hidePassword = true;
  void toggleHidePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: TextStyle(
              fontSize: getRegText(context),
              // fontWeight: FontWeight.w600,
              color: kWhite,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextField(
            controller: passwordController,
            obscureText: _hidePassword,
            style: TextStyle(
              fontSize: getRegText(context),
              // fontWeight: FontWeight.w600,
              color: kWhite,
            ),
            decoration: InputDecoration(
                hintText: "At least 8 characters",
                hintStyle: TextStyle(
                    fontSize: getHintInputText(context),
                    color: kWhite.withOpacity(0.5)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    "assets/icons/key.svg",
                    // colorFilter: const ColorFilter.mode(
                    //   kSecColorV2,
                    //   BlendMode.srcIn,
                    // ),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    _hidePassword
                        ? "assets/icons/hidePassword.svg"
                        : "assets/icons/showPassword.svg",
                  ),
                  onPressed: toggleHidePassword,
                ),
                enabledBorder: getInputBox(context),
                focusedBorder: getInputBox(context)),
          ),
        ],
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  const InputEmail({
    super.key,
  });

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
            height: 7,
          ),
          TextField(
            // onChanged: (value) {
            //   if (!GetUtils.isEmail(value)) {
            //     print(value);
            //   }
            // },
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
                  child: SvgPicture.asset(
                    "assets/icons/message.svg",
                    width: 10,
                  ),
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

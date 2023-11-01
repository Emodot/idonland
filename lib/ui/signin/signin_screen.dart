import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:idonland/controllers/login_controller.dart';
// import 'package:idonland/data/models/login_body_model.dart';
import 'package:idonland/main_layout.dart';
import 'package:idonland/ui/signin/device_authorization.dart';
import 'package:idonland/ui/signup/account_type_screen.dart';
import 'package:idonland/ui/signup/signup_screen.dart';
import 'package:idonland/utils/constant.dart';
// import 'package:idonland/main_layout.dart';
import 'package:idonland/ui/signin/recover_password_screen.dart';
import 'package:idonland/ui/signup/newuser_signin_screen.dart';
// import 'package:idonland/screens/signup/signup_screen.dart';
import 'package:idonland/utils/show_custom_snackbar.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

String email = '';
String username = '';
String userImage = '';

var passwordController = TextEditingController();

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    // loadUserDetails();
  }

  void loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString("userEmail") ?? '';
      username = prefs.getString("userName") ?? '';
      userImage = prefs.getString("userImage") ?? '';
    });
    print('Gotten Data: $email - $username - $userImage');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // void login() {
    //   Get.put(SharedPreferences);
    //   var loginController = Get.find<LoginController>();
    //   String password = passwordController.text.trim();
    //   print('working - $password');

    //   if (password.length < 8) {
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
    //     ;
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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.1),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: getLargeRegText(context),
                          fontWeight: FontWeight.w500,
                          color: kWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          // NetworkImage(userImage),
                          const AssetImage(
                        "assets/images/signinAvartar.png",
                      ),
                      radius: size.width * 0.1,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: kWhite,
                          fontSize: getBiggerText(context),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Welcome Back, ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: username,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const InputPassword(
                        // password: passwordController,
                        ),
                    SizedBox(
                      height: size.height * 0.02,
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
                        // login();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainLayout(),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
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
                            fontSize: getRegText(context),
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "Sign up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                            style: TextStyle(
                              fontSize: getRegText(context),
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "not you? ",
                              style: TextStyle(
                                  color: kWhite, fontWeight: FontWeight.w300)),
                          TextSpan(
                            text: "Switch Account",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NewuserSigninScreen(),
                                  ),
                                );
                              },
                            style: TextStyle(
                                fontSize: getRegText(context),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                        ]),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    // Center(
                    //   child: SvgPicture.asset(
                    //     "assets/icons/fingerPrint.svg",
                    //     width: size.width * 0.14,
                    //   ),
                    // )
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
            height: 10,
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
                  padding: const EdgeInsets.all(18.0),
                  child: SvgPicture.asset("assets/icons/key.svg"),
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

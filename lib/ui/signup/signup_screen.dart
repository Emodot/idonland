import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:idonland/controllers/auth_controller.dart';
// import 'package:idonland/controllers/signup_controller.dart';
// import 'package:idonland/data/models/signup_body_model.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/ui/signup/newuser_signin_screen.dart';
import 'package:idonland/ui/signup/reg_success.dart';
import 'package:idonland/utils/show_custom_snackbar.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
late String accountType;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // SignupController signupController = Get.put(SignupController());

  @override
  void initState() {
    super.initState();
    // _loadAccountType();
  }

  // void _loadAccountType() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   accountType = prefs.getString("accountType") ?? '';
  //   // print(accountType);
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // bool _isSignupLoading = false;
    // Get.find<AuthController>();
    // void signUp() {
    //   Get.put(SharedPreferences);
    //   // var authController = Get.find<AuthController>();
    //   var signupController = Get.find<SignupController>();
    //   String username = nameController.text;
    //   String email = emailController.text.trim();
    //   String phone = phoneController.text.trim();
    //   String password = passwordController.text.trim();
    //   // print("working - $username - $email - $phone - $password");

    //   if (username.isEmpty) {
    //     showCustomSnackbar("Username is empty");
    //     // print("working - $username");
    //   } else if (phone.isEmpty) {
    //     showCustomSnackbar("Input your Phone Number", title: "Error");
    //   } else if (email.isEmpty) {
    //     showCustomSnackbar("Email is empty", title: "Error");
    //   } else if (!GetUtils.isEmail(email)) {
    //     showCustomSnackbar("Enter a Valid Email Address", title: "Error");
    //   } else if (password.isEmpty) {
    //     showCustomSnackbar("Password is empty", title: "Error");
    //   } else if (password.length < 8) {
    //     showCustomSnackbar("Password cannot be less than 8", title: "Error");
    //   } else {
    //     SignUpBody signUpBody = SignUpBody(
    //       fullName: username,
    //       email: email,
    //       phone: phone,
    //       password: password,
    //       account: accountType,
    //       referer: '',
    //     );
    //     signupController.signUp(signUpBody).then(
    //           (data) => {
    //             // print(data),
    //             if (data['status'] == '401')
    //               {
    //                 showCustomSnackbar(
    //                   data['data']['message'],
    //                   isError: true,
    //                 )
    //               }
    //             else if (data['status'] == '200')
    //               {
    //                 Navigator.of(context).pushReplacement(
    //                   MaterialPageRoute(
    //                     builder: (context) => const RegSucess(),
    //                   ),
    //                 )
    //               }
    //           },
    //         );
    //   }
    // }

    return Scaffold(
        backgroundColor: kBgColor,
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
            ),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Let’s create \nyour account...",
                        style: TextStyle(
                            color: kWhite,
                            fontSize: getLargeRegText(context),
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                    ),
                  ),
                  Column(
                    children: const [
                      InputUsername(
                          // username: nameController,
                          ),
                      InputEmail(
                          // email: emailController,
                          ),
                      InputPhoneNumber(
                          // phoneNumber: phoneController,
                          ),
                      InputPassword(
                          // password: passwordController,
                          ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ActionButton(
                    size: size,
                    textWidget: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: getRegText(context)),
                    ),
                    color: kPrimaryColor,
                    btnAction: () {
                      // signUp();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const RegSucess(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Jost',
                      ),
                      children: [
                        TextSpan(
                          text: "Already have an Account?\n",
                          style: TextStyle(
                            fontSize: getRegText(context),
                            color: kWhite,
                          ),
                        ),
                        TextSpan(
                          text: "Sign In",
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
                            height: 1.5,
                            fontSize: getBigRegText(context),
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ));
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
                  child: SvgPicture.asset(
                    "assets/icons/key.svg",
                    colorFilter: const ColorFilter.mode(
                      kPrimaryColor,
                      BlendMode.srcIn,
                    ),
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

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({
    super.key,
  });

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phone number",
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
            controller: phoneController,
            keyboardType: TextInputType.phone,
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
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    "assets/icons/call.svg",
                    colorFilter: const ColorFilter.mode(
                      kPrimaryColor,
                      BlendMode.srcIn,
                    ),
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
            height: 7,
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

class InputUsername extends StatefulWidget {
  const InputUsername({
    super.key,
    // required username,
  });

  @override
  State<InputUsername> createState() => _InputUsernameState();
}

class _InputUsernameState extends State<InputUsername> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
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
            controller: nameController,
            keyboardType: TextInputType.name,
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
                    "assets/icons/user_icon.svg",
                    width: 17,
                    colorFilter: const ColorFilter.mode(
                      kPrimaryColor,
                      BlendMode.srcIn,
                    ),
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

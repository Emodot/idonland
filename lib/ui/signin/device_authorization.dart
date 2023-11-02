import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:idonland/controllers/device_otp_controller.dart';
// import 'package:idonland/data/models/device_otp_body_model.dart';
import 'package:idonland/utils/constant.dart';
import 'package:idonland/main_layout.dart';
import 'package:idonland/utils/styles.dart';
import 'package:idonland/widgets/action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String otpCode;
// var emailController = TextEditingController();
late String deviceId;
late String deviceModel;
late String deviceName;
late String deviceType;
late String deviceEntry;
String email = '';

class DeviceAuthorization extends StatefulWidget {
  const DeviceAuthorization({super.key});

  @override
  State<DeviceAuthorization> createState() => _DeviceAuthorizationState();
}

class _DeviceAuthorizationState extends State<DeviceAuthorization> {
  // DeviceOtpController deviceOtpController = Get.put(DeviceOtpController());

  @override
  void initState() {
    super.initState();
    loadDeviceInfo();
  }

  void loadDeviceInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    deviceId = prefs.getString("deviceId") ?? '';
    deviceModel = prefs.getString("deviceModel") ?? '';
    deviceName = prefs.getString("deviceName") ?? '';
    deviceType = prefs.getString("deviceType") ?? '';
    deviceEntry = prefs.getString("deviceEntry") ?? '';
    setState(() {
      email = prefs.getString("email") ?? '';
    });
    print('Email - $email');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // void sendOtp() {
    //   var deviceOtpController = Get.find<DeviceOtpController>();
    //   DeviceOtpBody deviceOtpBody = DeviceOtpBody(
    //     deviceId: deviceId,
    //     entry: deviceEntry,
    //     deviceName: deviceName,
    //     deviceType: deviceType,
    //     deviceModel: deviceModel,
    //     code: otpCode,
    //   );
    //   deviceOtpController.sendOtp(deviceOtpBody).then((data) => {
    //         // print(data),
    //         if (data['status'] == '200')
    //           {
    //             Navigator.of(context).pushReplacement(
    //               MaterialPageRoute(
    //                 builder: (context) => const MainLayout(),
    //               ),
    //             )
    //           }
    //       });
    // }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child:
                      Center(child: SvgPicture.asset("assets/icons/USB.svg")),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Device Authorization",
                  style: TextStyle(
                    fontSize: getBiggerRegText(context),
                    fontWeight: FontWeight.w700,
                    color: kWhite,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "We noticed you are signing into your idonland account from a device or location we do not recognize.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getBigRegText(context),
                      color: kWhite,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "To confirm this is you, we sent an email with an authentication code to $email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getBigRegText(context),
                    color: kWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Authorization Code *",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getBigRegText(context),
                      color: kWhite,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                // Center(
                //   child: PinPut(
                //     fieldsCount: 4,
                //     onSubmit: (String pin) {},
                //   ),
                // ),
                Form(
                  // key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.05,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      enablePinAutofill: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "Please enter the authorization code.";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 60,
                        inactiveColor: const Color(0xFFE7F2F9),
                        //selected borderColor
                        selectedColor: kSecColor.withOpacity(0.8),
                        //selected backgroundColor
                        selectedFillColor: kBgColor,
                        activeColor: const Color(0xFFE7F2F9),
                        activeFillColor: Colors.white,
                        inactiveFillColor: kWhite,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      // controller: textEditingController,
                      keyboardType: TextInputType.number,
                      // boxShadows: const [
                      //   BoxShadow(
                      //     offset: Offset(0, 1),
                      //     color: Colors.black12,
                      //     blurRadius: 10,
                      //   )
                      // ],
                      onCompleted: (otp) {
                        // debugPrint("Completed $otp");
                        setState(() {
                          otpCode = otp;
                        });
                        // print(otpCode);
                        // sendOtp();
                      },
                      onChanged: (value) {
                        // debugPrint(value);
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ActionButton(
                  size: size,
                  color: kPrimaryColor,
                  textWidget: Text(
                    'Confirm',
                    style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: getRegText(context)),
                  ),
                  btnAction: () {
                    // sendOtp();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainLayout(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Can't find the authentication code? check the spam folder or sign in again to get a fresh code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getRegText(context),
                      color: kWhite,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

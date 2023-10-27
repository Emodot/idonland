// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:rootshive/utils/constant.dart';
// import 'package:rootshive/utils/styles.dart';
// import 'package:url_launcher/url_launcher.dart';

// class QrScanner extends StatefulWidget {
//   const QrScanner({Key? key}) : super(key: key);

//   @override
//   State<QrScanner> createState() => _QrScannerState();
// }

// class _QrScannerState extends State<QrScanner> {
//   MobileScannerController cameraController = MobileScannerController();
//   bool _screenOpened = false;

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light.copyWith(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness:
//             Brightness.light, //<-- For Android SEE HERE (dark icons)
//         statusBarBrightness:
//             Brightness.dark, //<-- For iOS SEE HERE (dark icons)
//       ),
//       child: Scaffold(
//         // appBar: AppBar(
//         //   automaticallyImplyLeading: false,
//         //   elevation: 0,
//         //   backgroundColor: Colors.transparent,
//         //   leading: IconButton(
//         //     icon: const Icon(Icons.cancel),
//         //     onPressed: () {
//         //       Navigator.pop(context);
//         //     },
//         //   ),
//         //   title: const Text("Qr Code Scanner"),
//         //   actions: [
//         //     IconButton(
//         //       color: Colors.white,
//         //       icon: ValueListenableBuilder(
//         //         valueListenable: cameraController.torchState,
//         //         builder: (context, state, child) {
//         //           switch (state as TorchState) {
//         //             case TorchState.off:
//         //               return const Icon(Icons.flash_off, color: Colors.grey);
//         //             case TorchState.on:
//         //               return const Icon(Icons.flash_on, color: Colors.yellow);
//         //           }
//         //         },
//         //       ),
//         //       iconSize: 32.0,
//         //       onPressed: () => cameraController.toggleTorch(),
//         //     ),
//         //   ],
//         // ),
//         body: Stack(
//           children: [
//             MobileScanner(
//               // allowDuplicates: true,
//               controller: cameraController,
//               onDetect: _foundBarcode,
//             ),
//             Positioned(
//               top: size.height * 0.07,
//               left: size.width * 0.02,
//               right: size.width * 0.02,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: SvgPicture.asset("assets/icons/close.svg"),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   IconButton(
//                     color: Colors.white,
//                     icon: ValueListenableBuilder(
//                       valueListenable: cameraController.torchState,
//                       builder: (context, state, child) {
//                         switch (state as TorchState) {
//                           case TorchState.off:
//                             return const Icon(Icons.flash_off,
//                                 color: Colors.grey);
//                           case TorchState.on:
//                             return const Icon(Icons.flash_on,
//                                 color: Colors.yellow);
//                         }
//                       },
//                     ),
//                     iconSize: 32.0,
//                     onPressed: () => cameraController.toggleTorch(),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: SvgPicture.asset(
//                 "assets/icons/scan_box.svg",
//                 width: size.width * 0.8,
//                 colorFilter: const ColorFilter.mode(
//                   kWhite,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: EdgeInsets.only(bottom: size.height * 0.06),
//                 child: Text(
//                   "Scan a QR Code",
//                   style: TextStyle(
//                       fontSize: getBigRegText(context),
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _foundBarcode(
//     BarcodeCapture capture,
//   ) {
//     /// open screen
//     if (!_screenOpened) {
//       final String code = capture.barcodes.first.rawValue ?? "---";
//       debugPrint('Barcode found! $code');
//       _screenOpened = true;
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 FoundCodeScreen(screenClosed: _screenWasClosed, value: code),
//           ));
//     }
//   }

//   void _screenWasClosed() {
//     _screenOpened = false;
//   }
// }

// class FoundCodeScreen extends StatefulWidget {
//   final String value;
//   final Function() screenClosed;
//   const FoundCodeScreen({
//     Key? key,
//     required this.value,
//     required this.screenClosed,
//   }) : super(key: key);

//   @override
//   State<FoundCodeScreen> createState() => _FoundCodeScreenState();
// }

// class _FoundCodeScreenState extends State<FoundCodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light.copyWith(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness:
//             Brightness.light, //<-- For Android SEE HERE (dark icons)
//         statusBarBrightness:
//             Brightness.dark, //<-- For iOS SEE HERE (dark icons)
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: newPrimaryColor,
//           title: const Text("Found Code"),
//           centerTitle: true,
//           leading: IconButton(
//             onPressed: () {
//               widget.screenClosed();
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back_outlined,
//             ),
//           ),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   "Scanned Code:",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   widget.value,
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 // RichText(
//                 //   text: TextSpan(
//                 //     style: const TextStyle(
//                 //       fontFamily: 'Raleway',
//                 //     ),
//                 //     children: [
//                 //       const TextSpan(
//                 //         text: "Click Here",
//                 //       ),
//                 //       TextSpan(
//                 //         text: widget.value,
//                 //         recognizer: TapGestureRecognizer()
//                 //           ..onTap = () async {
//                 //             var url =
//                 //                 "https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw?view_as=subscriber";
//                 //             if (await canLaunch(url)) {
//                 //               await launch(url);
//                 //             } else {
//                 //               throw 'Could not launch $url';
//                 //             }
//                 //           },
//                 //         style: const TextStyle(
//                 //           fontSize: 16,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // class FoundCodeScreen extends StatefulWidget {
// //   final String value;
// //   final Function() screenClosed;
// //   const FoundCodeScreen({
// //     Key? key,
// //     required this.value,
// //     required this.screenClosed,
// //   }) : super(key: key);

// //   @override
// //   State<FoundCodeScreen> createState() => _FoundCodeScreenState();
// // }

// // class _FoundCodeScreenState extends State<FoundCodeScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Found Code"),
// //         centerTitle: true,
// //         leading: IconButton(
// //           onPressed: () {
// //             widget.screenClosed();
// //             Navigator.pop(context);
// //           },
// //           icon: Icon(Icons.arrow_back_outlined,),
// //         ),
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: EdgeInsets.all(20),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Text("Scanned Code:", style: TextStyle(fontSize: 20,),),
// //               SizedBox(height: 20,),
// //               Text(widget.value, style: TextStyle(fontSize: 16,),),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

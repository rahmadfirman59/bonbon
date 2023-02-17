// // ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_brace_in_string_interps, avoid_print, prefer_interpolation_to_compose_strings

import 'package:bonbon_new/controllers/index_controller.dart';
import 'package:bonbon_new/controllers/scan_controller.dart';
import 'package:bonbon_new/theme.dart';
import 'package:bonbon_new/ui/component/primray_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  IndexController indexController = Get.put(IndexController());
  final qrKey = GlobalKey(debugLabel: 'Qr');

  Barcode? barcode;
  QRViewController? controller;
  final scanController = Get.put(ScanController());

  @override
  void reassemble() async {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Enter OTP Codes",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              fontFamily: BaseTheme.font_family_open),
        ),
      ),
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 0,
              borderLength: 5,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.5,
              cutOutBottomOffset: 120,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 78.h, horizontal: 70.w),
          //   child: Text(
          //     "Scan QR code on the table",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 16.sp,
          //         fontWeight: FontWeight.w700,
          //         fontFamily: BaseTheme.font_family_sf),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 164.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 29.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      width: 328.w,
                      height: 56.h,
                      child: TextField(
                        controller: scanController.tableCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter Code Manually",
                          hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: BaseTheme.color_grey_7,
                              fontFamily: BaseTheme.font_family_sf,
                              fontWeight: FontWeight.w400),
                        ),
                        onChanged: (tableCode) {
                          print(tableCode);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.h,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF00CC36),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(
                                15) //content padding inside button
                            ),
                        onPressed: () {
                          var code =
                              scanController.tableCodeController.text.trim();
                          debugPrint("code nya adalah ${code}");
                          scanController.tableCheck(code);
                        },
                        child: Text(
                          "Enter Codes",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: BaseTheme.font_family_sf,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.7,
        cutOutBottomOffset: 120,
      ),
    );
  }

  Widget builInputCode(BuildContext context, ScanController scanController) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 29.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              // controller: scanController.tableCodeController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: ('SanFransisco'),
              ),
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.grey, width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.grey, width: 0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                filled: true,
                fillColor: Colors.white,
                hintText: "Phone",
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: BaseTheme.color_grey_7,
                    fontFamily: BaseTheme.font_family_sf,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          PrimaryButton(
            text: "LOGIN",
            isValid: true,
            onPressed: () {
              // loginController.phoneNumber.value.length <= 10
              //     ? null
              //     : loginController
              //         .otpLogin(loginController.phoneNumber.trim());
            },
            fontSize: 16.sp,
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.resumeCamera();
    });
    controller.scannedDataStream.listen(
      (barcode) => setState(
        () {
          controller.pauseCamera();
          this.barcode = barcode;
          var a = this.barcode?.code;
          var parts = a?.split('/');
          var prefix = parts?[4].trim();

          scanController.tableCheck(prefix ?? "");
          print("split parts" + prefix.toString());
          // debugPrint("${barcode.code}");
        },
      ),
    );
  }
}

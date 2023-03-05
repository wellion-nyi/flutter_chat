// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: false,
      progressIndicator: SpinKitRotatingPlain(
        color: Theme.of(context).primaryColor,
      ),
      child: Scaffold(
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Container(
                  height: AppBar().preferredSize.height,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(4, 4))
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                            width: AppBar().preferredSize.height - 8,
                            height: AppBar().preferredSize.height - 8,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                borderRadius: BorderRadius.circular(32),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      const Expanded(
                          child: Text(
                        "OTP Verfication",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: Image.asset("assets/images/verification.jpg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Enter OTP that we sent to you",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 40),
                      child: PinInputTextField( 
                        pinLength: 6,
                        textInputAction: TextInputAction.done,
                        decoration: CirclePinDecoration(
                            strokeColorBuilder: FixedColorBuilder(
                                Theme.of(context).primaryColor),
                                hintText: "345678",
                                errorText: "error"),
                       ),
                    )   
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_chat/model/intro_model.dart';

class IntroView extends StatelessWidget {
  final IntroModel introModel;
  const IntroView({super.key, required this.introModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 120,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    introModel.assetsImages,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )),
        Expanded(
            child: Container(
          child: Text(
            introModel.titleleText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )),
        const Expanded(
          child: SizedBox(),
          flex: 1,
        )
      ],
    );
  }
}

import 'package:batu_gunting_kertas/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ResultDialog extends StatelessWidget {
  final String? result;
  const ResultDialog({Key? key, this.result = "Win"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(dialogImage),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Anda ${result!}',
                style: const TextStyle(fontSize: 32),
              ),

              // Close
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  closeButtonImage,
                  height: 75,
                  width: 65,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

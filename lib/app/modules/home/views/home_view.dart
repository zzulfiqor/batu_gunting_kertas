import 'package:batu_gunting_kertas/app/data/models/leader_board_model..dart';
import 'package:batu_gunting_kertas/app/utils/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // bg
          Positioned.fill(
              child: Image.asset(
            backgroundImage,
            repeat: ImageRepeat.repeat,
          )),

          // Result Color
          Obx(
            () => Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: controller.result.toLowerCase() == "kalah"
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: controller.result.toLowerCase() == "menang"
                            ? Colors.green
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Computer Choice
              Transform.rotate(
                angle: 180 * 3.14 / 180,
                child: SizedBox(
                  height: Get.height * 0.5,
                  child: Stack(
                    children: [
                      // Batu
                      Obx(() => AnimatedPositioned(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            top: Get.width * 0.4,
                            bottom: controller.enemyChoice == PilihanTangan.batu
                                ? 20
                                : -100,
                            left: 0,
                            child: Image.asset(
                              batuImage,
                              width: Get.width / 3,
                            ),
                          )),

                      // Gunting
                      Obx(() => AnimatedPositioned(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            top: Get.width * 0.4,
                            bottom:
                                controller.enemyChoice == PilihanTangan.gunting
                                    ? 0
                                    : -100,
                            left: Get.width / 3,
                            child: GestureDetector(
                              child: Image.asset(
                                guntingImage,
                                width: Get.width / 3,
                              ),
                            ),
                          )),

                      // Kertas
                      Obx(() => AnimatedPositioned(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            top: Get.width * 0.4,
                            bottom:
                                controller.enemyChoice == PilihanTangan.kertas
                                    ? 20
                                    : -100,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.chooseHand(PilihanTangan.kertas);
                              },
                              child: Image.asset(
                                kertasImage,
                                width: Get.width / 3,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),

              // Player Choice
              SizedBox(
                height: Get.height * 0.5,
                child: Stack(
                  children: [
                    // Batu
                    Obx(() => AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          top: Get.width * 0.4,
                          bottom: controller.playerChoice == PilihanTangan.batu
                              ? 20
                              : -100,
                          left: 0,
                          child: GestureDetector(
                            onTap: () {
                              controller.chooseHand(PilihanTangan.batu);
                            },
                            child: Image.asset(
                              batuImage,
                              width: Get.width / 3,
                            ),
                          ),
                        )),

                    // Gunting
                    Obx(() => AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          top: Get.width * 0.4,
                          bottom:
                              controller.playerChoice == PilihanTangan.gunting
                                  ? 0
                                  : -100,
                          left: Get.width / 3,
                          child: GestureDetector(
                            onTap: () {
                              controller.chooseHand(PilihanTangan.gunting);
                            },
                            child: Image.asset(
                              guntingImage,
                              width: Get.width / 3,
                            ),
                          ),
                        )),

                    // Kertas
                    Obx(() => AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          top: Get.width * 0.4,
                          bottom:
                              controller.playerChoice == PilihanTangan.kertas
                                  ? 20
                                  : -100,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              controller.chooseHand(PilihanTangan.kertas);
                            },
                            child: Image.asset(
                              kertasImage,
                              width: Get.width / 3,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

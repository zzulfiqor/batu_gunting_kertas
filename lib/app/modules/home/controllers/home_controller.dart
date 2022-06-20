import 'dart:math';

import 'package:batu_gunting_kertas/app/data/models/leader_board_model..dart';
import 'package:batu_gunting_kertas/app/modules/home/views/widget/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _enemyChoice = PilihanTangan.netral.obs;
  PilihanTangan get enemyChoice => _enemyChoice.value;
  set enemyChoice(PilihanTangan value) => _enemyChoice.value = value;

  final _playerChoice = PilihanTangan.netral.obs;
  PilihanTangan get playerChoice => _playerChoice.value;
  set playerChoice(PilihanTangan value) => _playerChoice.value = value;

  final _result = ''.obs;
  String get result => _result.value;
  set result(String value) => _result.value = value;

  // Animation Controller
  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  void chooseHand(PilihanTangan value) {
    _playerChoice.value = value;

    computerChooseHand();
    checkResult();
    showDialog(
      context: Get.context!,
      builder: (context) => ResultDialog(result: result),
    ).then((value) => initialize());
  }

  void computerChooseHand() {
    var listChoice = [
      PilihanTangan.batu,
      PilihanTangan.gunting,
      PilihanTangan.kertas
    ];

    enemyChoice = listChoice[Random().nextInt(listChoice.length)];
  }

  void checkResult() {
    if (_playerChoice.value == _enemyChoice.value) {
      _result.value = 'Draw';
    } else if (_playerChoice.value == PilihanTangan.batu &&
        _enemyChoice.value == PilihanTangan.kertas) {
      _result.value = 'Kalah';
    } else if (_playerChoice.value == PilihanTangan.gunting &&
        _enemyChoice.value == PilihanTangan.batu) {
      _result.value = 'Kalah';
    } else if (_playerChoice.value == PilihanTangan.kertas &&
        _enemyChoice.value == PilihanTangan.gunting) {
      _result.value = 'Kalah';
    } else {
      _result.value = 'Menang';
    }
  }

  void initialize() {
    _enemyChoice.value = PilihanTangan.netral;
    _playerChoice.value = PilihanTangan.netral;
    _result.value = '';
  }
}

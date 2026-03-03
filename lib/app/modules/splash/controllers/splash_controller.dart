import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController slideAnimationController;
  late Animation<double> slideAnimation;
  late Animation<double> logoFadeAnimation;
  bool _statusBarUpdated = false;

  @override
  void onInit() {
    super.onInit();
    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: slideAnimationController,
        curve: Curves.easeInOutCubic,
      ),
    );

    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: slideAnimationController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    slideAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_statusBarUpdated) {
        _statusBarUpdated = true;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    slideAnimationController.forward();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {
    slideAnimationController.dispose();
    super.onClose();
  }
}

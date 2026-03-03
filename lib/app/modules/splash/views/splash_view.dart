import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedBuilder(
              animation: controller.slideAnimation,
              builder: (context, child) {
                return Stack(
                  children: [
                    const SizedBox.expand(),
                    Center(
                      child: AnimatedOpacity(
                        opacity: controller.logoFadeAnimation.value,
                        duration: Duration.zero,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF4757E4),
                              Color(0xFFFF4343),
                            ],
                          ).createShader(bounds),
                          child: Text(
                            'Logo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.anton(
                              fontSize: 48,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              letterSpacing: -2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (controller.slideAnimation.value < 1)
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: ClipPath(
                          clipper: WaveClipPath(
                            progress: controller.slideAnimation.value,
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: AppConstants.gradientBegin,
                                    end: AppConstants.gradientEnd,
                                    colors: [
                                      AppColors.gradientStart,
                                      AppColors.gradientEndSplash,
                                    ],
                                    stops: AppConstants.gradientStops,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: Image.asset(
                                  'assets/palm_trees.png',
                                  fit: BoxFit.fill,
                                  height: 300,
                                  width: Get.width,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class WaveClipPath extends CustomClipper<Path> {
  final double progress;

  WaveClipPath({required this.progress});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (progress >= 1) {
      return path;
    }

    final visibleHeight = size.height * (1 - progress);
    final waveAmplitude = 25.0;

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, visibleHeight);

    for (double x = size.width; x >= 0; x -= 2) {
      final t = x / size.width;
      final wave = math.sin(t * math.pi) * waveAmplitude;
      final y = visibleHeight + wave;
      path.lineTo(x, y);
    }

    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(WaveClipPath oldClipper) =>
      oldClipper.progress != progress;
}

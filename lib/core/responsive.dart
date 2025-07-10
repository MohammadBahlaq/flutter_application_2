import 'dart:developer';

import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  /// Function to calculate responsive height based on screen dimensions.
  /// It adjusts the given height proportionally to the screen size.
  ///
  /// [componentHeight] : The target height you want.
  /// [figmaDesignScreenHeight] : The base height of the screen you're designing on (e.g., 932).
  ///
  /// Returns a double value for the responsive height.
  double h(double componentHeight, {double figmaDesignScreenHeight = 932}) {
    return (componentHeight / figmaDesignScreenHeight) * screenHeight;
  }

  /// Function to calculate responsive width based on screen dimensions.
  /// It adjusts the given width proportionally to the screen size.
  ///
  /// [componentWidth] : The target width you want.
  /// [figmaDesignScreenWidth] : The base width of the screen you're designing on (e.g., 430).
  ///
  /// Returns a double value for the responsive width.
  double w(double componentWidth, {double figmaDesignScreenWidth = 430}) {
    return (componentWidth / figmaDesignScreenWidth) * screenWidth;
  }

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double fs(double fontSize) {
    double avgMobileWidth = 400;
    double avgTabletWidth = 600;
    double avgDeskTopWidth = 800;

    double maxModibleWidth = 400;
    double maxTabletWidth = 700;

    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;

    double newFontSize;

    if (screenWidth < maxModibleWidth) {
      newFontSize = (screenWidth / avgMobileWidth) * fontSize;
    } else if (screenWidth < maxTabletWidth) {
      newFontSize = (screenWidth / avgTabletWidth) * fontSize;
    } else {
      newFontSize = (screenWidth / avgDeskTopWidth) * fontSize;
    }

    log("fs=> newFontSize: $newFontSize");
    log("fs=> upperLimit: $upperLimit");
    log("fs=> lowerLimit: $lowerLimit");
    log("fs=> result: ${newFontSize.clamp(lowerLimit, upperLimit)}");

    return newFontSize.clamp(lowerLimit, upperLimit);
  }
}

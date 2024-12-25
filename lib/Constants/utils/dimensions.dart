import 'package:flutter/material.dart';
import 'package:macromasterai/Constants/utils/constants.dart';

var mediaQuerySize;

initMediaQuerySize (BuildContext context) {
  mediaQuerySize = MediaQuery.of(context).size;
}

double widgetWidth (double pixels) {
  return mediaQuerySize.width / (AppConstants.designWidht/pixels);
}

double widgetHeight (double pixels) {
  return mediaQuerySize.height / (AppConstants.designHeight/pixels);
}
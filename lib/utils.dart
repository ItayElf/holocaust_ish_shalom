import 'dart:ui';

double convert(double num) {
  double pixelRatio = window.devicePixelRatio;
  Size logicalScreenSize = window.physicalSize / pixelRatio;
  double logicalWidth = logicalScreenSize.width;
  return logicalWidth * num / 360;
}

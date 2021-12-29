import 'dart:ui';

double convert(double num) {
  double pixelRatio = window.devicePixelRatio;
  Size logicalScreenSize = window.physicalSize / pixelRatio;
  double logicalWidth = logicalScreenSize.width;
  double logicalHeight = logicalScreenSize.height;
  if (logicalWidth > logicalHeight) {
    return logicalWidth * num / 1920;
  }
  return logicalWidth * num / 360;
}

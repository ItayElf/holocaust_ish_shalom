import 'dart:ui';

import 'package:holocaust_ish_shalom/classes/person.dart';

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

String getTimesString(Person p) {
  if (p.times == 1) {
    return "אתם הראשונים שהדליקו נר זה";
  }
  return "נר זה הודלק ${p.times} פעמים";
}

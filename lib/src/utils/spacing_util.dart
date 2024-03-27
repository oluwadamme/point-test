import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {
  const XMargin(this.x, {Key? key}) : super(key: key);

  final double x;
  // ignore: use_key_in_widget_constructors
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  const YMargin(this.y, {Key? key}) : super(key: key);

  final double y;
  // ignore: use_key_in_widget_constructors
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

double screenHeight(BuildContext context, {double percent = 1, double? smallSize}) {
  try {
    final currentContext = context;
    final screen = MediaQuery.of(currentContext);

    if (percent == 1) {
      return MediaQuery.of(context).size.height;
    } else if (smallSize != null) {
      if (screen.size.height <= 699) {
        return screen.size.height * smallSize;
      } else {
        return screen.size.height * percent;
      }
    } else {
      return screen.size.height * percent;
    }
  } catch (e) {
    return 0;
  }
}

double screenWidth(BuildContext context, {double percent = 1}) {
  try {
    if (percent == 1) {
      return MediaQuery.of(context).size.width;
    } else {
      return MediaQuery.of(context).size.width * percent;
    }
  } catch (e) {
    return 0;
  }
}

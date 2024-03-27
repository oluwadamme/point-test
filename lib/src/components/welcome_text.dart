import 'package:flutter/widgets.dart';
import 'package:point_test/src/utils/app_colors.dart';
import 'package:point_test/src/utils/text_util.dart';

class WelcomeText extends StatefulWidget {
  const WelcomeText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  State<WelcomeText> createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> with SingleTickerProviderStateMixin {
  late Animation<double> textSize;
  late AnimationController _controller2;
  double textOpactiy = 0;
  final duration2 = const Duration(milliseconds: 1000);
  @override
  void initState() {
    super.initState();

    _controller2 = AnimationController(duration: duration2, vsync: this);
    textSize = Tween<double>(begin: 0.0, end: 1.0).animate(_controller2);

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        textOpactiy = 1;
      });
    });
    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: textOpactiy,
      duration: const Duration(milliseconds: 500),
      child: SizeTransition(
        axisAlignment: -2.0,
        sizeFactor: textSize,
        child: Text(
          widget.text,
          style: normalStyle(32, AppColors.black),
        ),
      ),
    );
  }
}

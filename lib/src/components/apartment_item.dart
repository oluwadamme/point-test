import 'package:flutter/material.dart';
import 'package:point_test/src/utils/app_colors.dart';
import 'package:point_test/src/utils/text_util.dart';

class ApartmentItem extends StatefulWidget {
  const ApartmentItem({
    super.key,
    required this.price,
    required this.showPrice,
  });

  final String price;
  final bool showPrice;

  @override
  State<ApartmentItem> createState() => _ApartmentItemState();
}

class _ApartmentItemState extends State<ApartmentItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  final duration = const Duration(seconds: 1);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: duration, vsync: this);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.bottomLeft,
      scale: _opacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        width: widget.showPrice ? 80 : 45,
        child: widget.showPrice
            ? Text(
                widget.price,
                style: normalStyle(12, Colors.white),
              )
            : const Icon(Icons.apartment, color: Colors.white),
      ),
    );
  }
}

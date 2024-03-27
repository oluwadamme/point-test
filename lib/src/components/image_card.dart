import 'package:flutter/material.dart';
import 'package:point_test/src/utils/app_colors.dart';
import 'package:point_test/src/utils/spacing_util.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    super.key,
    required this.isHalf,
    this.height,
  });
  final bool isHalf;
  final double? height;
  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  double _width = 50;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _width = screenWidth(context);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: widget.height,
        width: screenWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: widget.isHalf ? BoxFit.fitHeight : BoxFit.fitWidth,
            image: const AssetImage("assets/images/images.jpeg"),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.bottomLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white.withOpacity(0.6),
          ),
          width: _width,
          padding: const EdgeInsets.all(2).copyWith(left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _width <= 150
                ? []
                : [
                    if (!widget.isHalf) const Expanded(child: XMargin(0)),
                    const Flexible(
                      flex: 6,
                      child: Text(
                        "Gladkova St., 25",
                        maxLines: 1,
                      ),
                    ),
                    CircleAvatar(
                      radius: widget.isHalf ? 20 : 28,
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                        size: 16,
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

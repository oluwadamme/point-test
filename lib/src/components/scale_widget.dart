import 'package:flutter/widgets.dart';

class ScaleWidget extends StatelessWidget {
  const ScaleWidget({
    super.key,
    required Animation<double> size,
    required this.child,
  }) : _size = size;

  final Animation<double> _size;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _size,
      child: child,
    );
  }
}

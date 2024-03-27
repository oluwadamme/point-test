
import 'package:flutter/material.dart';
import 'package:point_test/src/components/scale_widget.dart';
import 'package:point_test/src/utils/app_colors.dart';
import 'package:point_test/src/utils/spacing_util.dart';
import 'package:point_test/src/utils/text_util.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late AnimationController _controller3;
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _size;
  final duration3 = const Duration(milliseconds: 700);
  final duration = const Duration(seconds: 1);
  @override
  void initState() {
    super.initState();
    _controller3 = AnimationController(duration: duration3, vsync: this);
    _controller = AnimationController(duration: duration, vsync: this);

    _size = Tween<double>(begin: 0.0, end: 1.0).animate(_controller3);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller3.forward();
    _controller.forward();
  }

  bool showPrice = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/map.png"), fit: BoxFit.fitHeight)),
          child: Stack(
            children: [
              ScaleTransition(
                scale: _size,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20).copyWith(top: MediaQuery.of(context).padding.top + 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: screenWidth(context),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const XMargin(7),
                              Text(
                                "Saint petersbury",
                                style: normalStyle(12, AppColors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      const XMargin(10),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.tune, color: AppColors.black),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.4, -.3),
                child: ScaleTransition(
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
                    width: showPrice ? 80 : 45,
                    child: showPrice
                        ? Text(
                            "13,3mn P",
                            style: normalStyle(12, Colors.white),
                          )
                        : const Icon(Icons.apartment, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.6, -.2),
                child: ScaleTransition(
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
                    width: showPrice ? 80 : 45,
                    child: showPrice
                        ? Text(
                            "14,3mn P",
                            style: normalStyle(12, Colors.white),
                          )
                        : const Icon(Icons.apartment, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.4, -.14),
                child: ScaleTransition(
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
                    width: showPrice ? 80 : 45,
                    child: showPrice
                        ? Text(
                            "3,3mn P",
                            style: normalStyle(12, Colors.white),
                          )
                        : const Icon(Icons.apartment, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.6, .35),
                child: ScaleTransition(
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
                    width: showPrice ? 80 : 45,
                    child: showPrice
                        ? Text(
                            "10,3mn P",
                            style: normalStyle(12, Colors.white),
                          )
                        : const Icon(Icons.apartment, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.6, .2),
                child: ScaleTransition(
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
                    width: showPrice ? 80 : 45,
                    child: showPrice
                        ? Text(
                            "13,0mn P",
                            style: normalStyle(12, Colors.white),
                          )
                        : const Icon(Icons.apartment, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.4, .5),
                child: ScaleTransition(
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
                    width: showPrice ? 80 : 45,
                    child: showPrice
                        ? Text(
                            "13,3mn P",
                            style: normalStyle(12, Colors.white),
                          )
                        : const Icon(Icons.apartment, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-.8, .75),
                child: ScaleWidget(
                  size: _size,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PopupMenuButton<String>(
                        color: Colors.white,
                        offset: const Offset(4, 4),
                        position: PopupMenuPosition.over,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                const Icon(Icons.shield_outlined),
                                const XMargin(5),
                                Text(
                                  "Cosy areas",
                                  style: normalStyle(16, Colors.grey),
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                showPrice = true;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.wallet_outlined,
                                  color: showPrice ? AppColors.orange : Colors.grey,
                                ),
                                const XMargin(5),
                                Text(
                                  "Price",
                                  style: normalStyle(16, showPrice ? AppColors.orange : Colors.grey),
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                const Icon(Icons.shopping_basket_outlined),
                                const XMargin(5),
                                Text(
                                  "Infrastructure",
                                  style: normalStyle(16, Colors.grey),
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                showPrice = false;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(Icons.menu, color: !showPrice ? AppColors.orange : Colors.grey),
                                const XMargin(5),
                                Text(
                                  "Without any layer",
                                  style: normalStyle(16, !showPrice ? AppColors.orange : Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: const Icon(Icons.menu, color: Colors.white),
                        ),
                      ),
                      const YMargin(5),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.4),
                        child: const Icon(Icons.navigation_outlined, weight: 0.2, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(.65, .77),
                child: ScaleWidget(
                  size: _size,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.4), borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.sort, color: Colors.white),
                        const XMargin(4),
                        Text(
                          "List of variants",
                          style: lightStyle(12, Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

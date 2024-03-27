import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:point_test/src/components/image_card.dart';
import 'package:point_test/src/components/scale_widget.dart';
import 'package:point_test/src/components/welcome_text.dart';
import 'package:point_test/src/presentation/map_page.dart';
import 'package:point_test/src/utils/app_colors.dart';
import 'package:point_test/src/utils/spacing_util.dart';
import 'package:point_test/src/utils/text_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final crossFade = ValueNotifier(CrossFadeState.showFirst);

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;

  late AnimationController _controller3;
  late Animation<double> _opacity;
  late Animation<double> _size;
  late Animation<double> _size1;

  late Animation<Offset> position;
  double textWidth = 50;
  double textOpactiy = 0;
  Alignment bottomBar = const Alignment(0, 2);
  int buyCount = 1;
  final icons = [
    const Icon(
      Icons.search_rounded,
      color: Colors.white,
    ),
    const Icon(
      Icons.message,
      color: Colors.white,
    ),
    const Icon(
      Icons.home,
      color: Colors.white,
    ),
    const Icon(
      Icons.favorite,
      color: Colors.white,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
    ),
  ];
  int selected = 2;
  @override
  void initState() {
    super.initState();

    const duration = Duration(milliseconds: 500);
    const duration1 = Duration(seconds: 1);

    const duration3 = Duration(seconds: 2);
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        textWidth = 155;
        textOpactiy = 1;
        bottomBar = const Alignment(0, 1);
      });
      for (var i = 1; i < 1024; i++) {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            buyCount = i;
          });
        });
      }
    });

    _controller = AnimationController(duration: duration, vsync: this);
    _controller1 = AnimationController(duration: duration1, vsync: this);

    _controller3 = AnimationController(duration: duration3, vsync: this);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _size = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _size1 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller1);

    position = Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0)).animate(_controller3);

    _controller.forward();
    _controller1.forward();

    _controller3.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: crossFade,
          builder: (context, value, child) {
            return Stack(
              children: [
                AnimatedCrossFade(
                  crossFadeState: value,
                  secondChild: value == CrossFadeState.showFirst ? const Column() : const MapPage(),
                  duration: const Duration(milliseconds: 500),
                  firstChild: Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.grey.withOpacity(0.2),
                          AppColors.orange.withOpacity(0.1),
                        ],
                        end: Alignment.bottomRight,
                      ),
                    ),
                    width: screenWidth(context),
                    height: screenHeight(context),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedContainer(
                                width: textWidth,
                                duration: const Duration(milliseconds: 800),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(6)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: textWidth > 100
                                      ? [
                                          const Icon(
                                            Icons.location_on,
                                            color: AppColors.grey,
                                          ),
                                          const XMargin(5),
                                          Flexible(
                                            child: Text(
                                              "Saint Petersburg",
                                              style: normalStyle(12, AppColors.grey),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ]
                                      : [],
                                ),
                              ),
                              FadeTransition(
                                opacity: _opacity,
                                child: ScaleWidget(
                                  size: _size,
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.grey,
                                    backgroundImage: AssetImage("assets/images/images (1).jpeg"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const YMargin(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedOpacity(
                                opacity: textOpactiy,
                                duration: const Duration(milliseconds: 700),
                                child: Text(
                                  "Hi, Perpetual",
                                  style: normalStyle(24, AppColors.grey),
                                ),
                              ),
                              const YMargin(10),
                              const WelcomeText(text: "Let's select your"),
                              const WelcomeText(text: "perfect place"),
                              const YMargin(30),
                              Row(
                                children: [
                                  Expanded(
                                    child: ScaleTransition(
                                      scale: _size1,
                                      child: CircleAvatar(
                                        radius: 100,
                                        backgroundColor: AppColors.orange,
                                        child: Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "BUY",
                                                style: lightStyle(14, Colors.white),
                                              ),
                                              const Spacer(),
                                              AnimatedFlipCounter(
                                                duration: const Duration(milliseconds: 900),
                                                value: buyCount, // pass in a value like 2014
                                                textStyle: semiBoldStyle(32, Colors.white),
                                              ),
                                              const YMargin(4),
                                              Text(
                                                "offers",
                                                style: lightStyle(14, Colors.white),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const XMargin(20),
                                  Expanded(
                                    child: ScaleTransition(
                                      scale: _size1,
                                      child: Container(
                                        height: 180,
                                        padding: const EdgeInsets.all(20),
                                        decoration:
                                            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Text(
                                              "RENT",
                                              style: lightStyle(14, AppColors.grey),
                                            ),
                                            const Spacer(),
                                            AnimatedFlipCounter(
                                              duration: const Duration(milliseconds: 900),
                                              value: buyCount, // pass in a value like 2014
                                              textStyle: semiBoldStyle(32, AppColors.grey),
                                            ),
                                            const YMargin(4),
                                            Text(
                                              "offers",
                                              style: lightStyle(14, AppColors.grey),
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const YMargin(20),
                        SlideTransition(
                          position: position,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                            ),
                            padding: const EdgeInsets.all(10).copyWith(bottom: 30),
                            child: const Column(
                              children: [
                                ImageCard(isHalf: false, height: 200),
                                YMargin(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ImageCard(isHalf: true, height: 410),
                                    ),
                                    XMargin(10),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        ImageCard(isHalf: true, height: 200),
                                        YMargin(10),
                                        ImageCard(isHalf: true, height: 200)
                                      ],
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(seconds: 3),
                  alignment: bottomBar,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          icons.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                              if (selected == 0) {
                                crossFade.value = CrossFadeState.showSecond;
                                return;
                              }
                              if (selected == 2) {
                                crossFade.value = CrossFadeState.showFirst;
                                return;
                              }
                            },
                            child: AnimatedContainer(
                              padding: EdgeInsets.all(selected == index ? 15 : 10),
                              margin: icons.length == index + 1 ? null : const EdgeInsets.only(right: 10),
                              duration: const Duration(milliseconds: 400),
                              decoration: BoxDecoration(
                                  color: selected == index ? AppColors.orange : Colors.black, shape: BoxShape.circle),
                              child: icons[index],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

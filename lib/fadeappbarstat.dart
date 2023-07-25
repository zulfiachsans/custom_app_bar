// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';

class FadeAppBarStat extends StatefulWidget {
  const FadeAppBarStat({super.key});

  @override
  State<FadeAppBarStat> createState() => _FadeAppBarStatState();
}

class _FadeAppBarStatState extends State<FadeAppBarStat> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102A83),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'images/background.png',
                width: MediaQuery.of(context).size.width / 1.35,
              ),
            ),
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 225,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 60,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PreferredSize(
              child: FadeAppBar(
                scrollOffset: _scrollControllerOffset,
              ),
              preferredSize: Size(MediaQuery.of(context).size.width, 100),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
  const FadeAppBar({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 135,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        color: Colors.white.withOpacity(
          (scrollOffset / 50).clamp(0, 1).toDouble(),
        ),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Zulfi Achsan Sani',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: scrollOffset > 50
                              ? const Color(0xFF102A83)
                              : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hi, Zulfi Achsan Sani',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: scrollOffset > 50
                              ? const Color(0xFF102A83)
                              : Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

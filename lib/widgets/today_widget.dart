import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_bar/styles/assets_audis_ressources.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:responsive_sizer/responsive_sizer.dart';

class TodayWidget extends StatefulWidget {
  const TodayWidget({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  bool hover = false;
  double turns = pi * 0.155;
  double turnsCalendar = 0.0;
  double scale = 0.9;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        boxShadow: [],
      ),
      padding: EdgeInsets.only(left: 18.w, top: 28.0),
      // margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 3,
            top: 8,
            child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: scale,
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 25.w,
                    height: 25.w,
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38),
                        color: const Color.fromRGBO(255, 255, 255, 0.5),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(249, 218, 183, 1),
                              spreadRadius: 120,
                              blurRadius: 64,
                              offset: Offset(9, 9)),
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.07),
                              blurRadius: 16,
                              spreadRadius: 4)
                        ]),
                  ),
                )),
          ),
          MouseRegion(
              onEnter: (event) {
                setState(() {
                  hover = true;
                  turns = pi * 0.139;
                  turnsCalendar = -pi * 0.0085;
                  scale = 1.0;
                });
              },
              onExit: (event) {
                setState(() {
                  hover = false;
                  turns = pi * 0.155;
                  turnsCalendar = 0.0;
                  scale = 0.9;
                });
              },
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: scale,
                child: AnimatedRotation(
                    turns: turnsCalendar,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: 25.w,
                      height: 25.w,
                      padding: const EdgeInsets.all(28.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(38),
                          color: const Color.fromRGBO(252, 246, 235, 1),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.09),
                                blurRadius: 4,
                                spreadRadius: 1)
                          ]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "July 02",
                              style: TextStyle(
                                  color: Color.fromRGBO(224, 137, 146, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 45.0),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.grey[500],
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23.0),
                                )
                              ],
                            )
                          ]),
                    )),
              )),
          Positioned(
              right: 10.5.w,
              top: 50,
              child: Transform.rotate(
                angle: pi * 0.05,
                child: Container(
                  width: 50.w,
                  height: 24.h,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 16.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38),
                      color: const Color.fromRGBO(252, 246, 235, 1),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(248, 225, 221, 1),
                            spreadRadius: 18,
                            blurRadius: 64,
                            offset: Offset(0, -100)),
                        BoxShadow(
                            color: Color.fromRGBO(248, 225, 221, 1),
                            spreadRadius: 18,
                            blurRadius: 64,
                            offset: Offset(90, 90)),
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09),
                            blurRadius: 8,
                            spreadRadius: 8)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.insert_link_sharp,
                            color: Colors.grey[450],
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Note • 1 month ago",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.open_in_new_rounded,
                            color: Colors.grey[450],
                          ))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

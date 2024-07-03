import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_bar/styles/assets_audis_ressources.dart';
import 'package:dynamic_bar/widgets/menu.dart';
import 'package:dynamic_bar/widgets/today_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    // player.setSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        decoration:
            const BoxDecoration(color: Color.fromRGBO(244, 215, 168, 0.4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TodayWidget(
              audioPlayer: player,
            ),
            MenuWidget(
              audioPlayer: player,
            )
          ],
        ),
      ),
    );
  }
}

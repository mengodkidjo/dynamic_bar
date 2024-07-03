import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_bar/styles/assets_audis_ressources.dart';
import 'package:dynamic_bar/styles/horizontal_space_style.dart';
import 'package:flutter/material.dart';

class MenuDetailsWidget extends StatefulWidget {
  const MenuDetailsWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.details,
      required this.audioPlayer});
  final IconData icon;
  final String title;
  final Widget details;
  final AudioPlayer audioPlayer;

  @override
  State<MenuDetailsWidget> createState() => _MenuDetailsWidgetState();
}

class _MenuDetailsWidgetState extends State<MenuDetailsWidget> {
  bool hover = false;
  double horizontalPadding = 0.0;

  double horizontalPaddingOut = 0.0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        widget.audioPlayer.play(AssetSource(AssetsAudiosRessources.keyboad));
        setState(() {
          hover = true;
          horizontalPadding = 16.0;
          horizontalPaddingOut = 8.0;
        });
      },
      onExit: (event) {
        widget.audioPlayer.stop();
        setState(() {
          hover = false;
          horizontalPadding = 0.0;
          horizontalPaddingOut = 0.0;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            color: hover ? Colors.black12 : null,
            borderRadius: BorderRadius.circular(14.0)),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 24.0,
                    color: Colors.black54,
                  ),
                  HorizontalSpaceStyle.h8,
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const Spacer(),
              widget.details
            ],
          ),
        ),
      ),
    );
  }
}

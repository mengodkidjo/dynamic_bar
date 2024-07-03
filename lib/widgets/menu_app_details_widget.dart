import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_bar/model/app_item_ui_model.dart';
import 'package:dynamic_bar/styles/assets_audis_ressources.dart';
import 'package:dynamic_bar/styles/horizontal_space_style.dart';
import 'package:dynamic_bar/styles/vertical_space_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MenuAppDetailsWidget extends StatefulWidget {
  const MenuAppDetailsWidget(
      {super.key, required this.appItemUiModel, required this.audioPlayer});
  final AppItemUiModel appItemUiModel;
  final AudioPlayer audioPlayer;

  @override
  State<MenuAppDetailsWidget> createState() => _MenuDetailsWidgetState();
}

class _MenuDetailsWidgetState extends State<MenuAppDetailsWidget> {
  bool hover = false;
  double horizontalPadding = 0.0;
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        widget.audioPlayer.play(AssetSource(AssetsAudiosRessources.keyboad));
        setState(() {
          hover = true;
          horizontalPadding = 16.0;
          opacity = 1.0;
        });
      },
      onExit: (event) {
        widget.audioPlayer.stop();
        setState(() {
          hover = false;
          horizontalPadding = 0.0;
          opacity = 0.0;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            color: hover ? Colors.black12 : null,
            borderRadius: BorderRadius.circular(18.0)),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.appItemUiModel.path,
                width: 32.0,
                height: 32.0,
              ),
              HorizontalSpaceStyle.h16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.appItemUiModel.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      HorizontalSpaceStyle.h8,
                      GestureDetector(
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.grey[700],
                          size: 16,
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.appItemUiModel.desc,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black87),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Text(
                    widget.appItemUiModel.target,
                    style: Theme.of(context).textTheme.bodySmall,
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

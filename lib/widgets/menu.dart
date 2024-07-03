import 'package:audioplayers/audioplayers.dart';
import 'package:dynamic_bar/model/app_item_ui_model.dart';
import 'package:dynamic_bar/model/components_item_ui_model.dart';
import 'package:dynamic_bar/model/note_item_ui_model.dart';
import 'package:dynamic_bar/styles/assets_audis_ressources.dart';
import 'package:dynamic_bar/styles/assets_images_ressources.dart';
import 'package:dynamic_bar/styles/horizontal_space_style.dart';
import 'package:dynamic_bar/styles/vertical_space_style.dart';
import 'package:dynamic_bar/widgets/menu_app_details_widget.dart';
import 'package:dynamic_bar/widgets/menu_details_widget.dart';
import 'package:dynamic_bar/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  double minWidth = 0.0;
  double minHeight = 0.0;
  String onHover = "";
  List<AppItemUiModel> appList = [
    AppItemUiModel(
        path: AssetsImagesRessources.serverexplorer,
        title: "Server Explorer",
        desc: "SSH Client | Files Explorer | Docker Management",
        target: "Mac"),
    AppItemUiModel(
        path: AssetsImagesRessources.ledocdev,
        title: "LeDoc",
        desc: "Software Engineer | Indie Hacker | Freelancer",
        target: "Web"),
  ];

  List<ComponentsItemsUiModel> components = [
    ComponentsItemsUiModel("Action Bar", "Dynamic", "06 • 24"),
    ComponentsItemsUiModel("Image Expand", "Overlay", "05 • 24"),
    ComponentsItemsUiModel("Read Time", "Scroll", "04 • 24")
  ];
  List<NoteItemUiModel> noteItem = [
    NoteItemUiModel(title: "Changelog using Github", date: "Jun, 2024"),
    NoteItemUiModel(title: "Feedback in slack", date: "May, 2024"),
  ];

  @override
  void initState() {
    super.initState();
    initValue();
  }

  void initValue() {
    setState(() {
      onHover = "";
      minWidth = 65.w;
      minHeight = 10.h;
    });
  }

  void explodeValue(String hoveredTitle) {
    if (hoveredTitle == "Notes") {
      setState(() {
        minWidth = 70.w;
        minHeight = 30.h;
      });
    } else if (hoveredTitle == "Components") {
      setState(() {
        minWidth = 70.w;
        minHeight = 42.h;
      });
    } else {
      setState(() {
        minWidth = 70.w;
        minHeight = 35.h;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {},
      onExit: (event) {
        if (onHover.isNotEmpty) {
          widget.audioPlayer.stop();
          initValue();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: minWidth,
        height: minHeight,
        curve:
            onHover.isEmpty ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(23.0)),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: onHover.isNotEmpty
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (onHover == "Apps")
              Flexible(
                  child: SizedBox(
                child: AnimatedList(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  initialItemCount: appList.length,
                  itemBuilder: (context, index, animation) {
                    return MenuAppDetailsWidget(
                      audioPlayer: widget.audioPlayer,
                      appItemUiModel: appList.elementAt(index),
                    );
                  },
                ),
              )),
            if (onHover == "Components")
              Flexible(
                  child: AnimatedList(
                initialItemCount: components.length,
                padding: const EdgeInsets.only(bottom: 16.0),
                shrinkWrap: true,
                itemBuilder: (context, index, animation) => MenuDetailsWidget(
                    audioPlayer: widget.audioPlayer,
                    icon: Icons.code,
                    title: components.elementAt(index).title,
                    details: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.black87),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Text(
                            components.elementAt(index).style,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Colors.black54),
                          ),
                        ),
                        HorizontalSpaceStyle.h16,
                        Text(
                          components.elementAt(index).date,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    )),
              )),
            if (onHover == "Notes")
              Flexible(
                  child: AnimatedList(
                initialItemCount: noteItem.length,
                padding: const EdgeInsets.only(bottom: 16.0),
                shrinkWrap: true,
                itemBuilder: (context, index, animation) => MenuDetailsWidget(
                    audioPlayer: widget.audioPlayer,
                    icon: Icons.link_rounded,
                    title: noteItem.elementAt(index).title,
                    details: Text(
                      noteItem.elementAt(index).date,
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              )),
            if (onHover.isNotEmpty)
              Container(
                width: 60.w,
                height: 2,
                color: Colors.black12,
              ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuItemWidget(
                      title: "Apps",
                      isHover: onHover == "Apps",
                      icon: Icons.open_in_browser_rounded,
                      onHover: (value) {
                        onHover = value;
                        widget.audioPlayer
                            .play(AssetSource(AssetsAudiosRessources.keyboad));
                        if (onHover == "Apps") {
                          explodeValue(onHover);
                        }
                        // setState(() {
                        //   minWidth = onHover == "Apps" ? 65.w : 60.w;
                        //   minHeight = onHover == "Apps" ? 40.h : 15.h;
                        // });
                      }),
                  MenuItemWidget(
                      title: "Components",
                      isHover: onHover == "Components",
                      icon: Icons.code_outlined,
                      onHover: (value) {
                        onHover = value;
                        // Future.delayed(const Duration(milliseconds: 400));
                        widget.audioPlayer
                            .play(AssetSource(AssetsAudiosRessources.keyboad));
                        if (onHover == "Components") {
                          explodeValue(onHover);
                        }
                      }),
                  MenuItemWidget(
                      title: "Notes",
                      icon: Icons.link,
                      isHover: onHover == "Notes",
                      onHover: (value) {
                        onHover = value;
                        // Future.delayed(const Duration(milliseconds: 400));
                        widget.audioPlayer
                            .play(AssetSource(AssetsAudiosRessources.keyboad));

                        if (onHover == "Notes") {
                          explodeValue(onHover);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

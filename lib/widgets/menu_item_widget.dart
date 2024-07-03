import 'package:dynamic_bar/styles/horizontal_space_style.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onHover,
      required this.isHover});
  final String title;
  final IconData icon;
  final Function(String title) onHover;
  final bool isHover;

  @override
  State<MenuItemWidget> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItemWidget> {
  // bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        widget.onHover(widget.title);
        // Future.delayed(const Duration(milliseconds: 400));

        // setState(() {
        //   isHover = true;
        // });
      },
      onExit: (event) {
        // widget.onHover("");
        // Future.delayed(const Duration(seconds: 100));

        // setState(() {
        //   isHover = false;
        // });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: widget.isHover ? Colors.black87 : null,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.isHover ? Colors.white : Colors.black54,
            ),
            HorizontalSpaceStyle.h8,
            Text(
              widget.title,
              style: TextStyle(
                  color: widget.isHover ? Colors.white : Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectableAvatar extends StatelessWidget {
  SelectableAvatar(
      {Key? key,
      this.color,
      this.iconData,
      required this.onTab,
      required this.isSelected})
      : super(key: key);
  String? color;
  int? iconData;
  final bool isSelected;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: HexColor(color ?? "FFFFFF"),
            radius: 20,
            child: iconData != null
                ? Icon(
                    IconData(iconData!, fontFamily: "MaterialIcons"),
                    color: Colors.black,
                  )
                : null,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black26 : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Container(),
        ],
      ),
    );
  }
}

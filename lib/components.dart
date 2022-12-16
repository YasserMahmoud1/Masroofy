import 'package:flutter/material.dart';

class SelectableAvatar extends StatelessWidget {
  const SelectableAvatar(
      {Key? key,
      required this.color,
      required this.onTab,
      required this.isSelected})
      : super(key: key);
  final Color color;
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
            backgroundColor: color,
            radius: 20,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black26 : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          isSelected? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Container(),
        ],
      ),
    );
  }
}

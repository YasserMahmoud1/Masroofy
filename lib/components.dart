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

Widget transactionTile({
  required String color,
  required String title,
  required int icon,
  required String amount,
  required bool isIncome,
  required int day,
  required int month,
  required int year,
  String? label,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: HexColor(color),
            child: Icon(
              IconData(icon, fontFamily: "MaterialIcons"),
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor(color),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  if (DateTime.now()
                          .difference(DateTime.utc(year, month, day))
                          .inDays ==
                      0)
                    const Text(
                      "Today",
                    ),
                  if (DateTime.now()
                          .difference(DateTime.utc(year, month, day))
                          .inDays ==
                      1)
                    const Text("Yesterday"),
                  if (DateTime.now()
                          .difference(DateTime.utc(year, month, day))
                          .inDays >
                      1)
                    Text(
                      "$day/$month/$year",
                    ),
                                      if (label != null)
                    const SizedBox(
                      width: 8,
                    ),
                  if (label != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: HexColor(color),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8.0),
                        child: Text(
                          label,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),

                  
                ],
              ),
            ],
          ),
        ],
      ),
      if (isIncome)
        Text(
          "+$amount EGP",
          style: TextStyle(fontSize: 16, color: Colors.green.withOpacity(.7)),
        ),
      if (!isIncome)
        Text(
          "-$amount EGP",
          style: TextStyle(fontSize: 16, color: Colors.red.withOpacity(.7)),
        ),
    ],
  );
}

int weeksBetween(DateTime from, DateTime to) {
  from = DateTime.utc(from.year, from.month, from.day);
  to = DateTime.utc(to.year, to.month, to.day);
  return (to.difference(from).inDays / 7).ceil();
}

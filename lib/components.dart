import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'features/wallet/data/models/transaction_model.dart';

// ignore: must_be_immutable
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

Widget transactionTile(TransactionModel transaction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: HexColor(transaction.category.color),
            child: Icon(
              IconData(transaction.category.icon, fontFamily: "MaterialIcons"),
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
                  color: HexColor(transaction.category.color),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                  child: Text(
                    transaction.category.title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  if (DateTime.now().difference(transaction.date).inDays == 0)
                    const Text(
                      "Today",
                    ),
                  if (DateTime.now().difference(transaction.date).inDays == 1)
                    const Text("Yesterday"),
                  if (DateTime.now().difference(transaction.date).inDays > 1)
                    Text(
                      DateFormat('yyyy-MM-dd').format(transaction.date),
                    ),

                  // if (label != null)
                  //   const SizedBox(
                  //     width: 8,
                  //   ),
                  // if (label != null)
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //     color: HexColor(backgroundColor),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 4, horizontal: 8.0),
                    //     child: Text(
                    //       label,
                    //       style: const TextStyle(fontSize: 10),
                    //     ),
                    //   ),
                    // ),
                
                ],
              ),
            ],
          ),
        ],
      ),
      if (transaction.isIncome)
        Text(
          "+${transaction.amount} EGP",
          style: TextStyle(fontSize: 16, color: Colors.green.withOpacity(.7)),
        ),
      if (!transaction.isIncome)
        Text(
          "-${transaction.amount} EGP",
          style: TextStyle(fontSize: 16, color: Colors.red.withOpacity(.7)),
        ),
    ],
  );
}



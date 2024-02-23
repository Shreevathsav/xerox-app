// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class OrderLists extends StatelessWidget {
  const OrderLists(
      {Key? key,
      required this.height,
      required this.width,
      required this.isOrderFullfilled,
      required this.fileName,
      required this.orderId,
      required this.isPaid,
      required this.date,
      required this.paidTextColor,
      required this.fullfiledTextColor,
      required this.iconColor})
      : super(key: key);
  final double height;
  final double width;
  final String isOrderFullfilled;
  final String fileName;
  final String orderId;
  final String isPaid;
  final String date;

  final Color paidTextColor;
  final Color fullfiledTextColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: height / 72, horizontal: width / 72),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.print_rounded,
                  color: iconColor,
                ),
                SizedBox(width: width / 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight (
                        child: Row(children: [
                          Text(
                            isPaid,
                            style: TextStyle(color: paidTextColor,),
                          ),
                          const VerticalDivider(
                            color: Colors.grey, // Example divider color
                            thickness: 1.0,
                          ),
                          Text(
                            isOrderFullfilled,
                            style: TextStyle(color:fullfiledTextColor)
                          ),
                        ]),
                      ),
                      SizedBox(height: height / 144),
                      Text(
                        fileName,
                      )
                    ],
                  ),
                ),
                Text(date),
              ],
            )
          ],
        ),
      ),
    );
  }
}

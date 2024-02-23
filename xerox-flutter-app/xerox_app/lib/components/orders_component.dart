// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:xerox_app/backend/orders.dart';
import 'package:xerox_app/components/orders_list.dart';

class OrdersComponent extends StatefulWidget {
  const OrdersComponent({Key? key}) : super(key: key);

  @override
  State<OrdersComponent> createState() => _OrdersComponentState();
}

class _OrdersComponentState extends State<OrdersComponent> {
  late double height, width;
  var jsonBody;
  @override
  void initState() {
    super.initState();
    getOrdersAsync();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:jsonBody == null
          ? const Center(child: CircularProgressIndicator())
          : jsonBody == null
              ? const Center(child: Text('No orders available'))
              : jsonBody!.isEmpty
                  ? const Center(child: Text('No orders available'))
          : Column(
              children: [
                for (var obj in jsonBody!)
                  OrderLists(
                    isOrderFullfilled: obj['isOrderFullfilled']==true?"Fullfilled":"Fullfilled",
                    isPaid: obj['isPaid']==true?"Paid":"Pending",
                    fileName: obj['fileName'],
                    orderId: obj['id'].toString(),
                    date: obj['dateTime'],
                    paidTextColor: obj['isPaid']==true?Colors.green:Colors.red,
                    fullfiledTextColor: obj['isOrderFullfilled']==true?Colors.green: Colors.green,
                    iconColor:  obj['isOrderFullfilled']==true?Colors.green: Colors.green,
                    height: height,
                    width: width,
                  ),
              ],
            ),);
  }

  Future<void> getOrdersAsync() async {
    OrdersBackend ordersBackend = OrdersBackend();
     List<dynamic> orders = await ordersBackend.getOrders();
     setState(() {
        jsonBody = orders.reversed; 
      });

  }
}

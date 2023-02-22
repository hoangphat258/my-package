import 'package:flutter/material.dart';
import 'package:my_package/features/historical_price/domain/entities/historical.dart';
import 'package:intl/intl.dart';

class PriceCell extends StatelessWidget {
  final Historical historical;

  const PriceCell({Key? key, required this.historical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Date: ${DateFormat('MM-dd-yyyy').format(historical.date ?? DateTime.now())}"),
        Text("Open: ${historical.open.toString()}"),
        Text("High: ${historical.high.toString()}"),
        Text("Low: ${historical.low.toString()}"),
        Text("Close: ${historical.close.toString()}"),
        const Divider(),
      ],
    );
  }
}

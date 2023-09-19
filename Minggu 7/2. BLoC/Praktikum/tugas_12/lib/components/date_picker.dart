import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker1 extends StatefulWidget {
  final DateTime date;
  final Function(DateTime) onChange;
  const DatePicker1({
    super.key,
    required this.date,
    required this.onChange,
  });

  @override
  State<DatePicker1> createState() => _DatePicker1State();
}

class _DatePicker1State extends State<DatePicker1> {
  final currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  DateFormat('dd MMMM yyyy').format(widget.date),
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: FilledButton.tonal(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(currentDate.year + 5),
                  );
                  if (selectDate != null) {
                    widget.onChange(selectDate);
                  }
                },
                child: const Text("Select Date"),
              ),
            ),
          ],
        )
      ],
    );
  }
}

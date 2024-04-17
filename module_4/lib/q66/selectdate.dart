import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dateselection extends StatefulWidget {
  const dateselection({super.key});

  @override
  State<dateselection> createState() => _dateselectionState();
}

class _dateselectionState extends State<dateselection> {
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            onTap: () async {
              await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2024, DateTime.monthsPerYear),
              ).then(
                    (value) {
                  if (value != null) {
                    date.text =
                        value.toString().substring(0, 11);
                  }
                },
              );
            },
            controller: date,
            readOnly: true,
            validator: (value) {
              return value!.isEmpty
                  ? "Please Enter Required Fields"
                  : null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "Select Date",
              prefixIcon: IconButton(
                onPressed: () async {
                  await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2024, DateTime.monthsPerYear),
                  ).then(
                        (value) {
                      if (value != null) {
                        date.text =
                            value.toString().substring(0, 11);}
                    },
                  );
                },
                icon: const Icon(Icons.date_range),
              ),
            ),
          ),
        ),
      )

    );
  }
}

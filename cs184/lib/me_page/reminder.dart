import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  int _selected_index = 0;
  DateTime time = DateTime.now();
  String notifText = "keep track of ur shit";
  static const option_style = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Reminder",
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  children: [
                    const Text("Daily Time",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      child: _DatePickerItem(
                        children: <Widget>[
                          CupertinoButton(
                            borderRadius: BorderRadius.zero,
                            // Display a CupertinoDatePicker in time picker mode.
                            onPressed: () => _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: time,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  setState(() => time = newTime);
                                },
                              ),
                            ),
                            // In this example, the time value is formatted manually. You can use intl package to
                            // format the value based on the user's locale settings.
                            child: Text(
                              '${time.hour}:${time.minute}',
                              style: const TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 36.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Notification Text",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Customize your notification message',
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    onChanged: (value) {
                      setState(() {
                        notifText = value;
                      });
                    },
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

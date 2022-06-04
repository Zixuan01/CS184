import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class SavedailyPage extends StatefulWidget {
  const SavedailyPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SavedailyPageState();
}

class _SavedailyPageState extends State<SavedailyPage> {
  int _amount = 0;
  DateTime date = DateTime(2016, 10, 26);
  int _selected_index = 0;
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Row(
                  children: [
                    const Text("Saving Plans",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: const [
                        Text(
                          "Daily saving plan is to set up a daily saving goal for your account and calculate the total amount of money you will save.",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    const Text("Start date",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _DatePickerItem(
                          children: <Widget>[
                            // const Text('Date'),
                            CupertinoButton(
                              // Display a CupertinoDatePicker in date picker mode.
                              onPressed: () => _showDialog(
                                CupertinoDatePicker(
                                  initialDateTime: date,
                                  mode: CupertinoDatePickerMode.date,
                                  use24hFormat: true,
                                  // This is called when the user changes the date.
                                  onDateTimeChanged: (DateTime newDate) {
                                    setState(() => date = newDate);
                                  },
                                ),
                              ),
                              // In this example, the date value is formatted manually. You can use intl package
                              // to format the value based on user's locale settings.
                              child: Text(
                                '${date.month}-${date.day}-${date.year}',
                                style: const TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    const Text("End date",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _DatePickerItem(
                          children: <Widget>[
                            // const Text('Date'),
                            CupertinoButton(
                              // Display a CupertinoDatePicker in date picker mode.
                              onPressed: () => _showDialog(
                                CupertinoDatePicker(
                                  initialDateTime: date,
                                  mode: CupertinoDatePickerMode.date,
                                  use24hFormat: true,
                                  // This is called when the user changes the date.
                                  onDateTimeChanged: (DateTime newDate) {
                                    setState(() => date = newDate);
                                  },
                                ),
                              ),
                              // In this example, the date value is formatted manually. You can use intl package
                              // to format the value based on user's locale settings.
                              child: Text(
                                '${date.month}-${date.day}-${date.year}',
                                style: const TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    const Text("Daily Amount",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter amount',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _amount = int.parse(value);
                            });
                          },
                        )

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    const Text("Total Amount",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Text(
                          "temp",
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CupertinoButton.filled(
                          onPressed: () {},
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class SavedailyPage extends StatefulWidget {
  const SavedailyPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SavedailyPageState();
}

class _SavedailyPageState extends State<SavedailyPage> {
  int _amount = 0, daily_budget = 0;
  static DateTime startdate = DateTime(2016, 10, 26);
  static DateTime enddate = DateTime(2016, 10, 26);
  static Duration difference = startdate.difference(enddate);
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

  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  void updateTotal(int val) {
    _amount = val * difference.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "New Saving Plan",
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    const Text("Start date",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 186,
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
                                      initialDateTime: startdate,
                                      mode: CupertinoDatePickerMode.date,
                                      use24hFormat: true,
                                      // This is called when the user changes the date.
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => startdate = newDate);
                                        difference = enddate.difference(startdate);
                                        updateTotal(daily_budget);
                                        //startdate = newDate;
                                      },
                                    ),
                                  ),
                                  // In this example, the date value is formatted manually. You can use intl package
                                  // to format the value based on user's locale settings.
                                  child: Text(
                                    '${startdate.month}/${startdate.day}/${startdate.year}',
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    const Text("End date",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 186,
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
                                      initialDateTime: enddate,
                                      mode: CupertinoDatePickerMode.date,
                                      use24hFormat: true,
                                      // This is called when the user changes the date.
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => enddate = newDate);
                                        // enddate = newDate;
                                        difference = enddate.difference(startdate);
                                        updateTotal(daily_budget);
                                      },
                                    ),
                                  ),
                                  // In this example, the date value is formatted manually. You can use intl package
                                  // to format the value based on user's locale settings.
                                  child: Text(
                                    '${enddate.month}/${enddate.day}/${enddate.year}',
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    const Text("Daily Budget",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 186,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(fontSize: 22),
                              textAlign: TextAlign.center,
                              controller: _controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter amount',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  // _amount = int.parse(value);
                                  daily_budget = int.parse(value);
                                  updateTotal(int.parse(value));
                                });
                              },
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    const Text("Total Budget",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 186,
                      decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children:  [
                            Text(
                              "${_amount}",
                              // "${_amount*difference.inDays}", // _amount*difference.inDays
                              style: const TextStyle(fontSize: 22),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: SizedBox.fromSize(
                  size: Size(300, 60),
                  child: ClipRect(
                    child: Material(
                      color: Color.fromARGB(114, 238, 230, 201),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed('/save_daily');
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_sharp), // <-- Icon
                            Text("Add New Saving Plan", style: TextStyle(fontSize: 20)), // <-- Text
                          ],
                        ),
                      ),
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

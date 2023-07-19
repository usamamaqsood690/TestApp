import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var id = 1;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  DateTime dateTime = DateTime.now();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: null,
      macOS: null,
      linux: null,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  playshow() {
    flutterLocalNotificationsPlugin.show(
        01,
        "Happy Ramzan",
        "Ready for Ramzan",
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "Happy Ramzan",
            "Ready for Ramzan",
            icon: "@mipmap/ic_launcher",
            importance: Importance.high,
          ),
          iOS: null,
          macOS: null,
          linux: null,
        ));
  }

  showNotification() {
    if (_title.text.isEmpty || _desc.text.isEmpty) {
      return;
    }

    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      _title.text,
      _desc.text,
      tz.TZDateTime.from(dateTime, tz.local),
      NotificationDetails(
          android: AndroidNotificationDetails(
        id.toString(),
        'Happy Ramzan',
        importance: Importance.max,
        icon: "@mipmap/ic_launcher",
      )),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  Widget build(BuildContext context) {
    // double widthS = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.play_circle_fill, color: Colors.green),
                    onPressed: () {
                      playshow();
                    },
                    label: const Text("Play Notification")),
              ),
              const SizedBox(
                height: 10,
              ),
            ])),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  alignment: Alignment.topRight,
                  // width: widthS / 2,
                  child: ElevatedButton.icon(
                    label: const Text('Custom Notification'),
                    icon: const Icon(Icons.add_circle_outlined),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                elevation: 24.0,
                                backgroundColor: Colors.white,
                                actions: [
                                  TextField(
                                    controller: _title,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      label: const Text("Notification Title"),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  TextField(
                                    controller: _desc,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      label: const Text(
                                          "Notification Description"),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  TextField(
                                    controller: _date,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        suffixIcon: InkWell(
                                          child: const Icon(Icons.date_range),
                                          onTap: () async {
                                            final DateTime? newlySelectedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: dateTime,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2095),
                                            );

                                            if (newlySelectedDate == null) {
                                              return;
                                            }

                                            setState(() {
                                              _date.text =
                                                  "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                                              dateTime = newlySelectedDate;
                                            });
                                          },
                                        ),
                                        label: const Text("Date")),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  TextField(
                                    controller: _time,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        suffixIcon: InkWell(
                                          child: const Icon(
                                            Icons.timer_outlined,
                                          ),
                                          onTap: () async {
                                            final TimeOfDay? slectedTime =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now());

                                            if (slectedTime == null) {
                                              return;
                                            }

                                            _time.text =
                                                "${slectedTime.hour}:${slectedTime.minute}:${slectedTime.period.toString()}";

                                            DateTime newDT = DateTime(
                                              dateTime.year,
                                              dateTime.month,
                                              dateTime.day,
                                              slectedTime.hour,
                                              slectedTime.minute,
                                            );
                                            setState(() {
                                              dateTime = newDT;
                                            });
                                          },
                                        ),
                                        label: const Text("Time")),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 40),
                                      ),
                                      onPressed: () {
                                        showNotification();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Add Notification")),
                                ],
                              ));
                    },
                  ),
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      flutterLocalNotificationsPlugin.cancel(id);
                    },
                    label: const Text("Cancel Notification")),
              ),
            ])),
          ],
        ));
  }
}

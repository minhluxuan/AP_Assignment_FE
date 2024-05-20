import 'package:flutter/material.dart';
import '../../model/template.dart';
import '../../model/object.dart';
import '../../view/firstpage2.dart';
import '../../view/vehicles/firstpage.dart';
import '../../widgets/trips/trips/line_chart.dart';
import 'package:intl/intl.dart';
import 'admin_trips.dart';
import 'dart:async';

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenu();
}

class _AdminMenu extends State<AdminMenu> {
  void todriver() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const firstpage()),
    );
  }

  void totrip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePageAdmin()),
    );
  }

  void tovehicle() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const firstpageveh()),
    );
  }

  @override
  void initState() {
    super.initState();

    //load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Material(
                color: mainColor,
                elevation: 5,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconLabel(
                        iconData: Icons.person,
                        onChanged: todriver,
                        label: 'Tài xế',
                      ),
                      IconLabel(
                        iconData: Icons.directions_car,
                        onChanged: tovehicle,
                        label: 'Phương tiện',
                      ),
                      IconLabel(
                        iconData: Icons.route,
                        onChanged: totrip,
                        label: 'Chuyến đi',
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CurrentTimeCard(),
                  LineChartWidget(date: januaryDays, prof: randomNumbers)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconLabel extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Function() onChanged;

  const IconLabel(
      {super.key,
      required this.iconData,
      required this.label,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.blueAccent,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(90.0),
            ),
            child: Icon(
              iconData,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: mainTextSize),
          )
        ],
      ),
    );
  }
}

class CurrentTimeCard extends StatefulWidget {
  const CurrentTimeCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrentTimeCardState createState() => _CurrentTimeCardState();
}

class _CurrentTimeCardState extends State<CurrentTimeCard> {
  late String _currenthhmm;
  late String _currentddmm;
  late String _currentyyyy;

  @override
  void initState() {
    super.initState();
    _updateCurrentTime();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateCurrentTime();
    });
  }

  void _updateCurrentTime() {
    if (mounted) {
      setState(() {
        _currenthhmm = DateFormat('HH:mm:ss').format(DateTime.now());
        _currentddmm = DateFormat('dd/MM').format(DateTime.now());
        _currentyyyy = DateFormat('yyyy').format(DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.black, width: 4),
      ),
      margin: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        _currentddmm,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        _currentyyyy,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_back_rounded, size: 30),
            Row(
              children: [
                const Icon(Icons.timer, size: 50),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    _currenthhmm,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

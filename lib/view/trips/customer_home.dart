import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../../bloc/trips/load_object.dart';
import 'customer_match_trip.dart';
import 'customer_current_trip.dart';
import '../../model/trips/template.dart';
import '../../model/trips/object.dart';
import '../../model/trips/city_list.dart';
import '../../bloc/trips/get_match_list.dart';
import '../../widgets/trips/trips/custom_dropdownlist.dart';
import '../../widgets/trips/trips/time.dart';
import '../../widgets/trips/trips/weather_forecast.dart';
import 'customer_introduction.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String vehicle = 'Car';
  String kindOfVehicle = '4 chỗ';
  String start = 'Hà Nội';
  String destination = 'Hà Nội';
  String dateToStart =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
  String timeStart = '00:00';

  Future<void> loadList() async {
    setState(() {
      trips = mergeData(driversj, vehiclesj, tripsj);
    });
  }

  @override
  void initState() {
    setState(() {
      if (vehicleS != null) vehicle = vehicleS!;
      if (kindOfVehicleS != null) kindOfVehicle = kindOfVehicleS!;
      if (startS != null) start = startS!;
      if (destinationS != null) destination = destinationS!;
      if (dateToStartS != null) dateToStart = dateToStartS!;
      if (timeStartS != null) timeStart = timeStartS!;
    });
    loadList();
    super.initState();
  }

  void toinfor() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CurrentTrip(),
      ),
    );
  }

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Intro(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: retur,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                onPressed: toinfor,
                style: TextButton.styleFrom(backgroundColor: mainColor),
                child: const Text(
                  'Xem vé xe đã đặt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mainTextSize,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              WeatherForecast(
                location: destination,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Tìm chuyến đi mới:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Chọn nơi đi:',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CustomDropdown(
                items: danhSachTinhThanh,
                initialValue: start,
                icon: const Icon(Icons.place),
                onChanged: (value) {
                  setState(() {
                    start = value!;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Chọn nơi đến:',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CustomDropdown(
                items: danhSachTinhThanh,
                initialValue: destination,
                icon: const Icon(Icons.place),
                onChanged: (value) {
                  setState(() {
                    destination = value!;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ngày đi:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 51,
                          child: Row(
                            children: [
                              Expanded(
                                child: DateTimePicker(
                                  initialValue: dateToStart,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  onChanged: (val) {
                                    setState(() {
                                      dateToStart = val;
                                    });
                                  },
                                ),
                              ),
                              const Icon(Icons.calendar_month)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Thời gian đi:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 41,
                          height: 50,
                          child: TimePicker(
                            initialval: timeStart,
                            onchanged: (val) {
                              setState(() {
                                timeStart = val!;
                              });
                            },
                            driver: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Chọn loại xe:',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CustomDropdown(
                items: const ['Car', 'Bus', 'Truck'],
                initialValue: vehicle,
                icon: const Icon(Icons.directions_car),
                onChanged: (newValue) {
                  setState(() {
                    vehicle = newValue!;
                    kindOfVehicle = (vehicle == 'Car'
                        ? '4 chỗ'
                        : (vehicle == 'Truck' ? '30 tấn' : '32 chỗ'));
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Phân loại:',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: mainColor,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(vehicle == 'Truck'
                        ? Icons.local_shipping
                        : Icons.airline_seat_legroom_normal),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: _buildDropdownItems(),
                        onChanged: (kind) {
                          setState(() {
                            kindOfVehicle = kind!;
                          });
                        },
                        hint: const Text('4 chỗ'),
                        value: kindOfVehicle,
                        underline: const SizedBox(),
                        focusColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        vehicleS = vehicle;
                        kindOfVehicleS = kindOfVehicle;
                        startS = start;
                        destinationS = destination;
                        dateToStartS = dateToStart;
                        timeStartS = timeStart;
                        matchTrips = timTrip(
                            trips,
                            chuyenDoiTen(start, destination),
                            dateToStart,
                            timeStart,
                            int.parse(kindOfVehicle.split(' ')[0]),
                            vehicle);
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MatchTripPage()),
                      );
                    },
                    style: TextButton.styleFrom(backgroundColor: mainColor),
                    child: const Text(
                      'Tìm xe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mainTextSize,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    switch (vehicle) {
      case 'Car':
      case '':
        return ['4 chỗ', '5 chỗ', '7 chỗ'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList();
      case 'Bus':
        return ['16 chỗ', '24 chỗ', '32 chỗ', '36 chỗ', '42 chỗ']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList();
      default:
        return ['30 tấn', '40 tấn'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList();
    }
  }
}

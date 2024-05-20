import 'package:flutter/material.dart';
import '../../view/trips/admin_trip_infor.dart';
import '../../model/trips/template.dart';
import '../../model/trips/object.dart';
import '../../model/trips/trip.dart';
import '../../widgets/trips/trips/custom_dropdownlist.dart';
import '../../widgets/trips/trips/list.dart';
import 'admin_history.dart';
import 'admin_trips.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({super.key});

  @override
  State<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  late Trip selectedTrip;
  late String search;
  void toprofit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfitPage()),
    );
  }

  void tohistory() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => TripHistoryPage(trip: selectedTrip)),
    );
  }

  void totrip(Trip trip) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => InforPage(trip: trip)),
    );
  }

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePageAdmin()),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Doanh thu của các xe",
                style: TextStyle(
                    fontSize: mainTitleSize, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: const Text(
                "Lọc theo loại xe:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: mainTextSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: CustomDropdown(
                items: const ["Bus", "Car", "Truck"],
                onChanged: (value) {
                  setState(() {
                    search = value!;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height - 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomList(
                      items: trips,
                      onPressed: (trip) {
                        setState(() {
                          selectedTrip = trip;
                        });
                        totrip(trip);
                      },
                      isadmin: true,
                      isprofit: true,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../model/template.dart';
import '../../model/trips/object.dart';
import '../../model/trips/trip.dart';
import '../../bloc/trips/load_object.dart';
import '../../widgets/trips/trips/custom_dropdownlist.dart';
import '../../widgets/trips/trips/list.dart';
import 'admin_profit.dart';
import 'admin_history.dart';
import 'admin_home.dart';
import 'admin_trip_infor.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  late Trip selectedTrip;
  late String search;
  void toprofit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfitPage()),
    );
  }

  void todetails(Trip trip) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => InforPage(
                trip: trip,
              )),
    );
  }

  void tohistory(Trip trip) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TripHistoryPage(trip: trip)),
    );
  }

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminMenu()),
    );
  }

  Future<void> loadList() async {
    setState(() {
      trips = mergeData(driversj, vehiclesj, tripsj);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadList();
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
                "Những chuyến xe hiện tại",
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
                        print("smth");
                        setState(() {
                          selectedTrip = trip;
                        });
                      },
                      isadmin: true,
                      isprofit: false,
                      details: todetails,
                      history: tohistory,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                onPressed: toprofit,
                style: TextButton.styleFrom(backgroundColor: mainColor),
                child: const Text(
                  "XEM DOANH THU",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

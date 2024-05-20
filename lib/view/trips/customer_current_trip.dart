import 'package:flutter/material.dart';
import '../../model/trips/object.dart';
import '../../model/trips/template.dart';
import '../../model/trips/trip.dart';
import '../../widgets/trips/trips/sort_bar.dart';
import '../../widgets/trips/trips/list.dart';
import 'customer_home.dart';
import 'customer_trip_infor.dart';
import '../../bloc/trips/create_customer.dart';

class CurrentTrip extends StatefulWidget {
  const CurrentTrip({super.key});

  @override
  State<CurrentTrip> createState() => _CurrentTripState();
}

class _CurrentTripState extends State<CurrentTrip> {
  String priority = '';
  bool a2z = true;

  @override
  void initState() {
    super.initState();
  }

  void pres(Trip thisTrip) {
    print(thisTrip.vehicle!.name);
    var index = cus.cusTrips?.indexWhere((trip) => trip == thisTrip);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TripInforPage(
          trip: thisTrip,
          seat: cus.seats?[index!].toString(),
          back: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CurrentTrip()),
            );
          },
          seeTrips: true,
        ),
      ),
    );
  }

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text(
            "Những chuyến xe",
            style: TextStyle(fontSize: mainTitleSize),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: SortBar(
              items: const ["Chi phí", "Loại xe", "Chuyến đi"],
              onChanged: (p0) {
              },
              onTap: () {
                a2z = !a2z;
                setState(() {
                  cus.cusTrips = cus.cusTrips!.reversed.toList();
                });
                print(trips[0].sta2des);
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 255,
            child: SingleChildScrollView(
              child: CustomList(
                items: cus.cusTrips!,
                onPressed: (trip) {
                  pres(trip);
                },
                isadmin: false,
                isprofit: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

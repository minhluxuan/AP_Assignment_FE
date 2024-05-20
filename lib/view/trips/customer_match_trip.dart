import 'package:flutter/material.dart';
import '../../bloc/trips/load_object.dart';
import '../../model/trips/template.dart';
import '../../model/trips/trip.dart';
import '../../widgets/trips/trips/sort_bar.dart';
import '../../widgets/trips/trips/list.dart';
import 'customer_comfirm.dart';
import 'customer_home.dart';

class MatchTripPage extends StatefulWidget {
  const MatchTripPage({
    super.key,
  });

  @override
  State<MatchTripPage> createState() => _MatchTripPageState();
}

class _MatchTripPageState extends State<MatchTripPage> {
  String priority = '';
  bool a2z = true;
  void pres(Trip thisTrip) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ComformPage(trip: thisTrip)),
    );
  }

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              "Những chuyến xe phù hợp",
              style: TextStyle(fontSize: mainTitleSize),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: SortBar(
                    items: const ["Chi phí", "Thời gian", "Độ dài"],
                    onChanged: (p0) {
                    },
                    onTap: () {
                      a2z = !a2z;
                      setState(() {
                        matchTrips = matchTrips.reversed.toList();
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: MediaQuery.of(context).size.height - 262,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(25)),
                    child: SingleChildScrollView(
                      child: CustomList(
                        items: matchTrips,
                        onPressed: (trip) {
                          pres(trip);
                        },
                        isadmin: false,
                        isprofit: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newapp/widgets/vehicle_list_item.dart';
import '../../model/object.dart';
import '../../model/template.dart';
import '../../widgets/vehicles/vehicle_list_item.dart';
import 'vehicle_infor_update.dart';
import '../../model/vehicle.dart';
import '../../view/vehicles/vehicle_infor.dart';
import '../../view/vehicles/firstpage.dart';
import '../../view/vehicles/mainte_infor.dart';

class UpdateInfor extends StatefulWidget {
  final String toPage;
  const UpdateInfor({super.key, required this.toPage});

  @override
  State<UpdateInfor> createState() => _UpdateInforState();
}

class _UpdateInforState extends State<UpdateInfor> {
  void toVehicle(Vehicle veh) {
    if (widget.toPage == "INFOR_UPDATE") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VehicleInfor(vehicle: veh)),
      );
    } else if (widget.toPage == "MAINTE") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainteUpdate(vehicle: veh)),
      );
    } else if (widget.toPage == "INFOR"){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InforOfAVehicle(vehicle: veh)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, size: 30),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const firstpageveh(),
                            ));
                      },
                    ),
                    Text(
                      widget.toPage == 'INFOR'
                          ? "Thông tin chi tiết"
                          : widget.toPage == 'MAINTE'
                              ? "Bảo dưỡng"
                              : "Cập nhật thông tin",
                      style: const TextStyle(
                        fontSize: mainTitleSize,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort_by_alpha,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 170,
              child: ListView.builder(
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListItem(
                        vehicle: vehicles[index],
                        toInfor: (veh) {
                          toVehicle(veh);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

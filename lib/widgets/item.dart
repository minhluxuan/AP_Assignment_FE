import 'package:flutter/material.dart';
import '../view/vehicles/vehicle_detail.dart'; // Import your detail page here

class VehicleListItem extends StatelessWidget {
  final Map<String, dynamic> vehicle;

  const VehicleListItem({required this.vehicle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page when tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(vehicle: vehicle)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${vehicle["idVehicle"]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Loại: ${vehicle["vehicleType"]}',
            ),
            Text(
              'Tuyến: ${vehicle["departure"]} → ${vehicle["destination"]}',
            ),
            SizedBox(height: 5),
            // Add more vehicle details as needed
          ],
        ),
      ),
    );
  }
}

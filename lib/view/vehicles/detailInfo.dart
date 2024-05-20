import 'dart:convert';

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
import '../../widgets/item.dart';
import 'package:http/http.dart' as http;
import '../../bloc/getToken.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _UpdateInforState();
}

class _UpdateInforState extends State<DetailInfo> {
  List<dynamic> vehiclesList = [];
  _UpdateInforState() {
    final String? token;
    http.get(Uri.parse('http://localhost:8762/api/vehicle'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJtaW5obHV4dWFuMms1Iiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzEzNzkyOTM0LCJleHAiOjE3MTM4NzkzMzR9.NBQ-fOVifTkBMC11FkRvRdDniy1Ybt5jKN0ly__5SZVw76bBs1uUvN9S6HjG7KLz'
    }).then((response) {
      if (response.statusCode == 200) {
        
        var decodedResponse = jsonDecode(response.body);
        List<dynamic> gotVehicleList = decodedResponse["data"];
        setState(() {
          vehiclesList = gotVehicleList;
        });
        print(vehiclesList);
      } else {
        throw Exception('Failed to load vehicles');
      }
    });
    // print(vehiclesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title:Text("Thông tin chi tiết",
          style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: vehiclesList.map((vehicle) {
              return Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 5),
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
                child: VehicleListItem( vehicle: vehicle), // Example: Displaying vehicle details
              );
            }).toList(), // Convert Iterable to List
          ),
        ),
      ),
    );
  }
}

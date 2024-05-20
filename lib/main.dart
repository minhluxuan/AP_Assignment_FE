import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/view/login.dart';
//import 'package:newapp/view/drivers/firstpage.dart';
import 'package:newapp/view/vehicles/firstpage.dart';
import '../widgets/firstpage.dart';
import 'model/driver.dart';
import 'package:newapp/view/vehicles/coach.dart';
import 'package:newapp/view/vehicles/customer_on_vehicle.dart';
import 'package:newapp/view/vehicles/goods_on_vehicle.dart';
import 'package:newapp/view/vehicles/infor.dart';
import 'package:newapp/view/vehicles/mainte_infor.dart';
import 'package:newapp/view/vehicles/new_customer.dart';
import 'package:newapp/view/vehicles/new_goods.dart';
import 'package:newapp/view/vehicles/page2.dart';
import 'package:newapp/view/vehicles/secondpage.dart';
import 'package:newapp/view/vehicles/update_infor.dart';
import 'package:newapp/view/vehicles/vehicle_infor.dart';
import 'package:newapp/view/vehicles/xetai.dart';
//import 'package:newapp/bloc/api_service.dart';
import 'package:newapp/bloc/create_trip.dart';
import 'package:newapp/bloc/create_customer.dart';
import 'package:newapp/bloc/get_match_list.dart';
import 'package:newapp/model/vehicle.dart';
import 'package:newapp/widgets/vehicles/bottombar.dart';
import 'package:newapp/widgets/vehicles/dropdown.dart';
//import 'package:newapp/widgets/vehicles/firstpage.dart';
import 'package:newapp/widgets/vehicles/sex.dart';
import 'package:newapp/widgets/vehicles/tuyenxe.dart';
import 'package:newapp/widgets/vehicles/vehicle_list_item.dart';
import 'model/object.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'api_vehicle.dart';
import 'package:newapp/bloc/api_vehicle.dart';
//import 'drivers.dart';
void main(List<String> args) {
  cloneObj();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.blueAccent),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const LoginPage();
  }
}

//import 'package:flutter/material.dart';
import '../../model/trips/trip.dart';
import 'package:diacritic/diacritic.dart';

String chuyenDoiTen(String sta, String des) {
  sta = sta.replaceAll(' ', '');
  des = des.replaceAll(' ', '');

  sta = chuyenDoiDinhDang(sta);
  des = chuyenDoiDinhDang(des);
  String result = '$sta-$des';
  return result;
}

String chuyenDoiDinhDang(String input) {
  List<String> words = input.split(' ');
  for (int i = 0; i < words.length; i++) {
    words[i] = removeDiacritics(words[i]);
  }
  return words.join('');
}

List<Trip> timTrip(List<Trip> danhSachTrip, String route, String date,
    String time, int? numofseat, String vehicleKind) {
  //String k = vehicleKind == "Truck" ? "container" : "coach";
  return danhSachTrip.where((trip) {
    return (trip.sta2des == route ||
            trip.stations!.any((element) => element.contains(route))) &&
        trip.date == date &&
        trip.time == time; //&&
    //trip.numofseat == numofseat;
    //trip.vehicle!.name == vehicleKind;
  }).toList();
}

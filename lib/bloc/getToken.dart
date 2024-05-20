import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');
    return stringValue;
}
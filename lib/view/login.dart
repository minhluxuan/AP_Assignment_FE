import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/template.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import "../view/vehicles/firstpage.dart";
import "../view/firstpage2.dart";
import '../view/trips/admin_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');
    return stringValue;
  }

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // TextEditingController _textController = TextEditingController();

      @override
      void dispose() {
        usernameController.dispose();
        passwordController.dispose();
        super.dispose();
      }
        return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Đăng nhập",
              style: TextStyle(fontSize: mainTitleSize),
            ),
            const SizedBox(height: 5.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                labelText: 'Tên đăng nhập',
              ),
            ),
            TextFormField(
              // Bind the password controller to the TextField
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                labelText: 'Mật khẩu',
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: TextButton(
                onPressed: () async {
                  try {
                    Map<String, String> postData = {
                      "username": usernameController.text,
                      "password": passwordController.text
                    };
                    var response = await http.post(
                      Uri.parse('http://localhost:8762/api/auth/login'),
                      body: json.encode(postData),
                      headers: {'Content-Type': 'application/json'},
                    );

                    if (response.statusCode == 200) {
                      var decodedResponse = json.decode(response.body);
                      await saveToken(decodedResponse["token"]);
                      final token = await getToken();
                      print(token);
                      
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Đăng nhập thành công!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text('Xác nhận'),
                              ),
                            ],
                          );
                        },
                      );

                      Navigator.push(context, MaterialPageRoute(builder: ((context) => AdminMenu())));
                    }
                    else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Tên đăng nhập hoặc mật khẩu không đúng!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text('Xác nhận'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } catch (error) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('Tên đăng nhập hoặc mật khẩu không đúng!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                ),
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(color: Colors.white, fontSize: mainTextSize),
                ),
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Quên mật khẩu",
                    style: TextStyle(fontSize: mainTextSize),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Tạo tài khoản",
                    style: TextStyle(fontSize: mainTextSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/dropdown2.dart';
import '../widgets/tuyenxe2.dart';
import '../view/firstpage2.dart';
import '../bloc/getToken.dart';

class Modalbottomcard extends StatefulWidget {
  final String driverid;

  const Modalbottomcard({super.key, required this.driverid});

  @override
  _ModalbottomState createState() => _ModalbottomState();
}

class _ModalbottomState extends State<Modalbottomcard> {
  TextEditingController controllerxe = TextEditingController();

  Future<void> submitData() async {
    // Create JSON data
    Map<String, dynamic> postData1 = {
      "vehicleId": "null",
      "vehicleType": controllerxe.text,
    };
    try {
      // Send POST request
      final response = await http.put(
        Uri.parse(
            'http://localhost:8083/api/drivers/${widget.driverid}/vehicle'),
        body: json.encode(postData1),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${await getToken()}'
        },
      );

      // Check for successful response
      if (response.statusCode == 200) {
        ShowSuccess('Cập nhật thành công');
        print('Data submitted successfully!');
        print(response.body);
        // Handle success response
      } else {
        print('Error submitting data: ${response.statusCode}');
        print(response.body);
        ShowError('Cập nhật thất bại');
        // Handle error response
      }
    } on http.ClientException catch (e) {
      print('Error sending request: $e');
      ShowError('Cập nhật thất bại');

      // Handle connection errors
    } catch (e) {
      print('Error: $e');
      ShowError('Cập nhật thất bại');

      // Handle other errors
    }
  }

  void ShowSuccess(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void ShowError(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 201, 220, 235),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              DropdownMenuApp(
                onChanged: (p0) {
                  setState(() {
                    controllerxe.text = p0;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // _formKey.currentState!.validate();
                    // await submitData();
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const firstpage()),
                    // );

                    // Nếu dữ liệu hợp lệ, gửi dữ liệu và điều hướng
                    await submitData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const firstpage()),
                    );
                  },
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

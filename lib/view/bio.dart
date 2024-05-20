import 'package:flutter/material.dart';
import '../view/modalBottom.dart';
import '../view/modalCard.dart';
import '../view/update2.dart';

import '../model/driver2.dart';

class Bio extends StatelessWidget {
  Bio({
    super.key,
    // required this.driver,
    required this.driver_name,
    required this.driverid,
    required this.status,
    required this.address,
    required this.cccd,
    required this.createAt,
    required this.email,
    required this.gender,
    required this.yearOfBirth,
    required this.phone,
    required this.routeId,
    required this.vehicleId,
    required this.vehicleType,
    required this.license,
  });
  var driver_name,
      driverid,
      status,
      address,
      cccd,
      createAt,
      email,
      phone,
      gender,
      yearOfBirth,
      routeId,
      vehicleId,
      vehicleType,
      license;
  // var driver = Driver(
  //   id: '',
  //   name: '',
  //   tuyen: '',
  //   add: '',
  //   phonenumber: '',
  //   email: '',
  //   lisence: '',
  //   typeCar: '',
  //   date: '',
  //   sex: '',
  //   cccd: '',
  // );
  // List<Driver> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.border_color_sharp),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => update(
                        driver_name: driver_name,
                        driverid: driverid,
                        status: status,
                        address: address,
                        cccd: cccd,
                        createAt: createAt,
                        email: email,
                        phone: phone,
                        routeId: routeId,
                        vehicleId: vehicleId,
                        vehicleType: vehicleType,
                        license: license)),
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xff143234),
        title: const Text(
          "TIỂU SỬ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: () => (Navigator.pop(context)),
        ),
      ),
      // body: Container(
      //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      //   constraints: const BoxConstraints.expand(),
      //   color: Colors.white,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: <Widget>[
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           padding: const EdgeInsets.fromLTRB(1000, 100, 1000, 100),
      //           margin: const EdgeInsets.all(12),
      //           color: Colors.amber,
      //           child: const Text(
      //             'hello',
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0xffDFDFDF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Họ và Tên',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            driver_name,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Năm sinh',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              margin: const EdgeInsets.only(bottom: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    yearOfBirth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Giới tính',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              margin: const EdgeInsets.only(bottom: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    gender,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                    const Text(
                      'Căn cước công dân',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            cccd,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
            ),
            Container(
              width: double.infinity,
              height: 450,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0xffDFDFDF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Số điện thoại',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            phone,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Địa chỉ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            address,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            email,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Bằng lái xe hạng',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            license,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Loại xe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(
                                vehicleType,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,

                                backgroundColor: Colors
                                    .grey[200], // Set the background color
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Modalbottomcard(
                                    driverid: driverid,
                                  );
                                },
                              );
                              // Xử lý sự kiện khi biểu tượng được nhấn
                            },
                            icon: const Icon(Icons
                                .edit_outlined), // Thay thế Icon bằng biểu tượng cây viết
                            color: const Color.fromARGB(255, 27, 27, 27),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Tuyến',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(
                                routeId,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors
                                    .grey[200], // Set the background color
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Modalbottom(
                                    driverid: driverid,
                                  );
                                },
                              );
                              // Xử lý sự kiện khi biểu tượng được nhấn
                            },
                            icon: const Icon(Icons
                                .edit_outlined), // Thay thế Icon bằng biểu tượng cây viết
                            color: const Color.fromARGB(255, 27, 27, 27),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

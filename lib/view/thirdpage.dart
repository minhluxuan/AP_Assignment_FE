import 'package:flutter/material.dart';

import '../model/driver2.dart';
import '../widgets/bottombar.dart';
import 'bio.dart';
import 'hist.dart';

class profile extends StatelessWidget {
  profile({
    super.key,
    // required this.drivername,
    // required this.tuyen,
    // required this.id,
    // required this.driver,
    required this.driver_name,
    required this.driverid,
    required this.status,
    required this.address,
    required this.cccd,
    required this.createAt,
    required this.email,
    required this.phone,
    required this.routeId,
    required this.vehicleId,
    required this.vehicleType,
    required this.gender,
    required this.yearOfBirth,
    required this.license,
  });
  // var drivername;
  // var tuyen;
  // var id;
  var driver_name,
      driverid,
      status,
      address,
      cccd,
      createAt,
      email,
      phone,
      routeId,
      vehicleId,
      license,
      gender,
      yearOfBirth,
      vehicleType;
  setSateDriver(var num) {
    if (num != '') {
      return Container(
        height: 30,
        // width: 250,
        decoration: BoxDecoration(
          // Bo tròn góc
          color: const Color.fromARGB(255, 9, 174, 12),
          borderRadius: BorderRadius.circular(500),
        ),
        alignment: Alignment.center,
        // color: const Color.fromARGB(255, 9, 174, 12),
        child: const Text('Đang hoạt động'),
        // Your container properties here
      );
    } else {
      return Container(
        height: 30,
        // width: 250,
        decoration: BoxDecoration(
          // Bo tròn góc
          color: const Color.fromARGB(255, 239, 7, 23),
          borderRadius: BorderRadius.circular(500),
        ),
        alignment: Alignment.center,
        // color: const Color.fromARGB(255, 9, 174, 12),
        child: const Text('Chưa có tuyến'),
        // Your container properties here
      );
    }
  }

  // var driver = Driver(
  //     id: '',
  //     name: '',
  //     tuyen: '',
  //     add: '',
  //     phonenumber: '',
  //     email: '',
  //     lisence: '',
  //     typeCar: '',
  //     date: '',
  //     sex: '',
  //     cccd: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xff143234),
        title: const Text(
          "PROFILE",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: () => (Navigator.pop(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              width: double.infinity,
              height: 150,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: const Color(0xff143234),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          ('assetss/anh1.jpg'),
                        )
                        // 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        // ),
                        ),
                    //
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              driver_name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'ID: ',
                                    style: TextStyle(
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    driverid,
                                    style: const TextStyle(
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'Loại xe: ',
                                    style: TextStyle(
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    vehicleType,
                                    style: const TextStyle(
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 5)),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'ID xe: ',
                                    style: TextStyle(
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    vehicleId,
                                    style: const TextStyle(
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 170,
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'TÌNH TRẠNG',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        setSateDriver(status),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  SizedBox(
                    // width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'TUYẾN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 40,
                          // width: 250,
                          decoration: BoxDecoration(
                            color: const Color(0xffDEDEDE),
                            borderRadius: BorderRadius.circular(000),
                          ),
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          // color: const Color.fromARGB(255, 9, 174, 12),
                          child: Text(
                            routeId,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  SizedBox(
                    // width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                          // width: 250,
                          decoration: BoxDecoration(
                            color: const Color(0xffDEDEDE),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.centerLeft,
                          // color: const Color.fromARGB(255, 9, 174, 12),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Bio(
                                      gender: gender,
                                      yearOfBirth: yearOfBirth,
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
                                      license: license,
                                      vehicleType: vehicleType),
                                ),
                              );
                            },
                            child: const Text(
                              'THÔNG TIN CÁ NHÂN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  SizedBox(
                    // width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                          // width: 250,
                          decoration: BoxDecoration(
                            color: const Color(0xffDEDEDE),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.centerLeft,
                          // color: const Color.fromARGB(255, 9, 174, 12),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Hist()));
                            },
                            child: const Text(
                              'LỊCH SỬ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

//TAO XE
import 'package:flutter/material.dart';
import 'package:newapp/widgets/bottombar.dart';
import '../../widgets/vehicles/bottombar.dart';
import 'coach.dart';
import 'xetai.dart';

// ignore: camel_case_types
class page2 extends StatefulWidget {
  const page2({
    super.key,
  });
  @override
  State<page2> createState() => _MyAppState();
}

class _MyAppState extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TẠO XE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.filter_list_alt),
        //     color: Colors.white,
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.search),
        //     color: Colors.white,
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.home),
        //     color: Colors.white,
        //   ),
        // ],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: () => (Navigator.pop(context)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            Column(children: [
              Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // Điều chỉnh để làm cho góc cong nếu cần
                    image: const DecorationImage(
                      image: AssetImage('../../assets/anh2.jpg'),
                      fit: BoxFit.cover, // Đảm bảo ảnh hiển thị đúng tỷ lệ
                    ),
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 150)),
              SizedBox(
                // width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NewWidget(label: 'XE KHÁCH'),
                    const Padding(padding: EdgeInsets.only(bottom: 30)),
                    NewWidget(label: 'XE CONTAINER'),
                    const Padding(padding: EdgeInsets.only(bottom: 30)),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

// ignore: must_be_immutable
class NewWidget extends StatelessWidget {
  String label = '';
  NewWidget({
    super.key,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: 250,
      decoration: BoxDecoration(
        color: const Color(0xff143234),
        borderRadius: BorderRadius.circular(500),
      ),
      padding: const EdgeInsets.only(left: 5),
      alignment: Alignment.center,
      // color: const Color.fromARGB(255, 9, 174, 12),

      child: button(label: label),
    );
  }
}

// ignore: camel_case_types
class button extends StatelessWidget {
  const button({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (label == 'XE KHÁCH') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Coach()),
          );
        } else if (label == 'XE CONTAINER') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Xetai()),
          );
        }
        // Thêm hành động khác cho các trường hợp khác nếu cần
      },
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

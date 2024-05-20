import 'package:flutter/material.dart';

class DateList extends StatelessWidget {
  final List<Map<String, List<List<String>>>> danhSach;
  const DateList({super.key, required this.danhSach});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: danhSach
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.keys.first}: ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (item.values.first).map((mocThoiGian) {
                        return Text(
                          '+ ${mocThoiGian[0]}:\n    ${mocThoiGian.sublist(1).join('\n')}',
                          style: const TextStyle(fontSize: 18),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

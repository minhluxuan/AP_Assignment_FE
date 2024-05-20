import 'package:flutter/material.dart';

class CustomDetailList extends StatelessWidget {
  final List<Map<String, String>> danhSach;

  const CustomDetailList({super.key, required this.danhSach});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: danhSach
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.keys.first}: ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(height: 4),
                    Text(
                      item.values.first,
                      style: const TextStyle(fontSize: 18),
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

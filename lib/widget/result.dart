import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required double result})
      : _kelvin = result,
        super(key: key);

  final double _kelvin;

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Hasil",
                style: TextStyle(fontSize: 26),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                _kelvin.toStringAsFixed(2),
                style: const TextStyle(fontSize: 36),
              )
            ],
          ),
        ),
      ],
    );
  }
}

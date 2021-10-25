import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etInput,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan masukkan suhu dalam celcius';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}

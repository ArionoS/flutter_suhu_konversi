import 'package:flutter/material.dart';
import 'package:flutter_suhu_konversi/widget/input.dart';
import 'package:flutter_suhu_konversi/widget/result.dart';
import 'package:flutter_suhu_konversi/widget/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // text controller
  TextEditingController etInput = TextEditingController();
  //variabel berubah
  double _inputUser = 0;
  double _result = 0;
  var listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  List<String> listHasil = [];
  final _formKey = GlobalKey<FormState>();

  _konversiSuhu() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        // ignore: avoid_print
        print(listHasil.length);
        _inputUser = double.parse(etInput.text);
        switch (selectedDropdown) {
          case "Kelvin":
            {
              // statements;
              _result = _inputUser + 273;
              listHasil.add("Konversi dari : " +
                  "$_inputUser" +
                  " ke " +
                  "$_result" +
                  " Kelvin");
            }
            break;

          case "Reamur":
            {
              //statements;
              _result = _inputUser * 4 / 5;
              listHasil.add("Konversi dari : " +
                  "$_inputUser" +
                  " ke " +
                  "$_result" +
                  " Reamur");
            }
            break;
          case "Fahrenheit":
            {
              //statements;
              _result = 9 / 5 * _inputUser + 32;
              listHasil.add("Konversi dari : " +
                  "$_inputUser" +
                  " ke " +
                  "$_result" +
                  " Fahrenheit");
            }
            break;
        }
      }
    });
  }

  _onDropdownChanged(value) {
    setState(() {
      selectedDropdown = value.toString();
    });
    _konversiSuhu();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu Bab 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Input(etInput: etInput),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: DropdownButton(
                  items: listSatuanSuhu.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: selectedDropdown,
                  onChanged: _onDropdownChanged,
                  isExpanded: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Result(
                    result: _result,
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _konversiSuhu,
                child: const Text(
                  'Konversi Suhu',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Center(
                  child: Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: listHasil.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  listHasil[index],
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                            ));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

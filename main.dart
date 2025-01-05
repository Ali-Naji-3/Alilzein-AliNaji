import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//ali lzein 
// ali naji

void main() {
  runApp(MaterialApp(home: CarSearchApp()));
}

class CarSearchApp extends StatefulWidget {
  @override
  _CarSearchAppState createState() => _CarSearchAppState();
}

class _CarSearchAppState extends State<CarSearchApp> {
  List cars = [];
  double minPrice = 0.0;
  double maxPrice = 50000.0;

  Future<void> fetchCars() async {
    final response = await http.get(Uri.parse(
        'http://10.0.2.2/mobile/index.php?minPrice=$minPrice&maxPrice=$maxPrice'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['data'] != null) {
        cars = data['data'];
      } else {
        cars=[];
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Car Search')),
      body: Column(
        children: [
          RangeSlider(
            min: 0,
            max: 100000,
            values: RangeValues(minPrice, maxPrice),
            onChanged: (values) {
              setState(() {
                minPrice = values.start;
                maxPrice = values.end;
              });
            },
            onChangeEnd: (_) => fetchCars(),
          ),
          Text('Price: \$${minPrice.toInt()} - \$${maxPrice.toInt()}'),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                return ListTile(
                  title: Text('${car['make']} ${car['model']}'),
                  subtitle: Text('Year: ${car['year']} - \$${car['price']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

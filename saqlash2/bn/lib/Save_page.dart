import 'package:bn/servuse.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SavePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 64,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Nomi',
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 64,
                child: TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'miqdor',
                  ),
                  keyboardType: TextInputType.number, // Keyboard type for numbers
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 64,
                child: TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'narxi',
                  ),
                  keyboardType: TextInputType.number, // Keyboard type for numbers
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 64,
                child: TextField(
                  controller: _colorController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'rangi',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 64),
              ElevatedButton(
                onPressed: () {
                  final item = Item(
                    name: _nameController.text,
                    price: double.parse(_priceController.text),
                    quantity: int.parse(_quantityController.text),
                    color: _colorController.text,
                  );
                  Hive.box<Item>('itemBox').add(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data Saved')),
                  );
                  _nameController.clear();
                  _priceController.clear();
                  _quantityController.clear();
                  _colorController.clear();
                },
                child: Text('Save Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

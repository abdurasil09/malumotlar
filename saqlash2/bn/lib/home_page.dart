import 'package:bn/servuse.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ValueListenableBuilder<Box<Item>>(
        valueListenable: Hive.box<Item>('itemBox').listenable(),
        builder: (context, box, _) {
          List<Item> items = box.values.toList();
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              Item item = items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Column(
                  children: [
                    Text(
                        'Price: ${item.price}, Quantity: ${item.quantity}, Color: ${item.color}'),
                   Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 1,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    )
                  ],
                ),
                    
              );
            },
          );
        },
      ),
    );
  }
}

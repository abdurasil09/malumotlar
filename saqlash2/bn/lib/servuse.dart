import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

class DataModel extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

@HiveType(typeId: 0)
class Item {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  int quantity;

  @HiveField(3)
  String color;

  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.color,
  });
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 0;

  @override
  Item read(BinaryReader reader) {
    return Item(
      name: reader.readString(),
      price: reader.readDouble(),
      quantity: reader.readInt(),
      color: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer.writeString(obj.name);
    writer.writeDouble(obj.price);
    writer.writeInt(obj.quantity);
    writer.writeString(obj.color);
  }
}

// model_item_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hufs_project/models/mode_item.dart';

class ItemProvider with ChangeNotifier {
  late CollectionReference itemsReference;
  List<Item> items = [];
  List<Item> searchItems = [];

  ItemProvider({reference}) {
    itemsReference =
        reference ?? FirebaseFirestore.instance.collection('items');
  }

  Future<void> fetchItems() async {
    items = await itemsReference.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Item.fromSnapshot(document);
      }).toList();
    });
    items.sort((b, a) => a.Grade.compareTo(b.Grade));
    notifyListeners();
  }

  Future<void> search(String query) async {
    searchItems = [];
    if (query.isEmpty) {
      return;
    }
    for (Item item in items) {
      if (item.Name.contains(query)) {
        searchItems.add(item);
      } else if (item.Company.contains(query)) {
        searchItems.add(item);
      } else if (item.Main_ingredient_1.contains(query)) {
        searchItems.add(item);
      } else if (item.Main_ingredient_2.contains(query)) {
        searchItems.add(item);
      } else if (item.Main_ingredient_3.contains(query)) {
        searchItems.add(item);
      }
      searchItems.sort((b, a) => a.Grade.compareTo(b.Grade));
    }
    notifyListeners();
  }
  
    Future<void> searchP(String query1,query2,query3) async {
    searchItems = [];
    if (query1.isEmpty) {
      return;
    }
    for (Item item in items) {
      if (item.Skin_type.contains(query1)) {
        if (item.Pimple_care.contains(query2)) {
          if (item.Cosmetic_type.contains(query3)) {
            searchItems.add(item);
          }
        }
      }
      searchItems.sort((b, a) => a.Grade.compareTo(b.Grade));
    }
    notifyListeners();
  }
}
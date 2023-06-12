//model_item.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String Company;
  late String Name;
  late String Cosmetic_type;
  late num Price;
  late num Grade;
  late String Photo;
  late String Url;
  late String Pimple_care;
  late String Atopy_care;
  late String Skin_type;
  late String Main_ingredient_1;
  late String Main_ingredient_2;
  late String Main_ingredient_3;

  Item({
    required this.Company,
    required this.Name,
    required this.Cosmetic_type,
    required this.Price,
    required this.Grade,
    required this.Photo,
    required this.Url,
    required this.Pimple_care,
    required this.Atopy_care,
    required this.Skin_type,
    required this.Main_ingredient_1,
    required this.Main_ingredient_2,
    required this.Main_ingredient_3,
  });

  Item.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    Name = data['Name'];
    Company = data['Company'];
    Cosmetic_type = data['Cosmetic_type'];
    Price = data['Price'];
    Grade = data['Grade'];
    Photo = data['Photo'];
    Url = data['Url'];
    Pimple_care = data['Pimple_care'];
    Atopy_care = data['Atopy_care'];
    Skin_type = data['Skin_type'];
    Main_ingredient_1 = data['Main_ingredient_1'];
    Main_ingredient_2 = data['Main_ingredient_2'];
    Main_ingredient_3 = data['Main_ingredient_3'];
  }

  Item.fromMap(Map<String, dynamic> data) {
    Name = data['Name'];
    Company = data['Company'];
    Cosmetic_type = data['Cosmetic_type'];
    Price = data['Price'];
    Grade = data['Grade'];
    Photo = data['Photo'];
    Url = data['Url'];
    Pimple_care = data['Pimple_care'];
    Atopy_care = data['Atopy_care'];
    Skin_type = data['Skin_type'];
    Main_ingredient_1 = data['Main_ingredient_1'];
    Main_ingredient_2 = data['Main_ingredient_2'];
    Main_ingredient_3 = data['Main_ingredient_3'];
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'Name': Name,
      'Company': Company,
      'Cosmetic_type': Cosmetic_type,
      'Price': Price,
      'Grade': Grade,
      'Photo': Photo,
      'Url': Url,
      'Pimple_care': Pimple_care,
      'Atopy_care': Atopy_care,
      'Skin_type': Skin_type,
      'Main_ingredient_1': Main_ingredient_1,
      'Main_ingredient_2': Main_ingredient_2,
      'Main_ingredient_3': Main_ingredient_3,
    };
  }
}

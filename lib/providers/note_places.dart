import 'dart:io';
import 'package:flutter/foundation.dart';

import '../helpers/db_helper.dart';
import '../models/place.dart';

class NotePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        // location: PlaceLoaction(latitude: 33, longitude: 33),
        image: image);
    _items.add(newPlace);
    notifyListeners();
    print(
        'inserting to database :${newPlace.id},${newPlace.title}, ${newPlace.image.path}');
    DBHelper.insertData(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (e) => Place(
            id: e['id'],
            title: e['title'],
            /*location: location,*/ image: File(e['image']),
          ),
        ).toList()
        ;
    notifyListeners();
  }
}

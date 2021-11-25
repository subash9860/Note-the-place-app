import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';

class NotePlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: PlaceLoaction(latitude: 33, longitude: 33),
        image: image);
    _items.add(newPlace);
    notifyListeners();
  }
}

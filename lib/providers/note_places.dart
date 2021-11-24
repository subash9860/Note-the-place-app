import 'package:flutter/foundation.dart';
import 'package:note_the_place/models/place.dart';

class NotePlaces with ChangeNotifier {
 final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}

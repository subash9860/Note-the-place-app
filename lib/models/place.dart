import 'dart:io';

// class PlaceLoaction {
//   final double latitude;
//   final double longitude;
//   final String? address;

//   PlaceLoaction({
//     required this.latitude,
//     required this.longitude,
//     this.address,
//   });
// }

class Place {
  final String id;
  final String title;
  // final PlaceLoaction location;
  final File image;

  Place({
    required this.id,
    required this.title,
    // required this.location,
    required this.image,
  });
}

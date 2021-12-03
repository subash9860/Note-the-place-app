import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:note_the_place/screen/map_screen.dart';
import '../widgets/map_current_loc.dart';

class PlaceInput extends StatefulWidget {
  const PlaceInput({Key? key}) : super(key: key);

  @override
  State<PlaceInput> createState() => _PlaceInputState();
}

class _PlaceInputState extends State<PlaceInput> {
  var _previewImageUrl = false;
// final locData =  Location().getLocation();
  double? lat;
  double? lng;

  Future<void> _getUserLocation() async {
    final locData2 = await Location().getLocation();
    print('latitude:${locData2.latitude}');
    print('longitude:${locData2.longitude}');
    setState(() {
      lat = locData2.latitude!;
      lng = locData2.longitude!;
    });
  }

  @override
  void initState() {
    super.initState();
    _previewImageUrl = false;
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 170,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            alignment: Alignment.center,
            width: double.infinity,
            child: (!_previewImageUrl)
                ? const Text(
                    "no location choosen",
                    textAlign: TextAlign.center,
                  )
                : CurrentLoc(lat!, lng!)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _previewImageUrl = true;
                });
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Current loaction"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.map),
              label: const Text("select a map"),
            )
          ],
        )
      ],
    );
  }
}

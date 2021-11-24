import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/add_place_screen.dart';
import '../providers/note_places.dart';
import '../screen/places_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NotePlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note the place',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: Colors.amber, secondary: Colors.indigo),
            appBarTheme: AppBarTheme(color: Colors.indigo[900])),
        home: const PlaceListScreen(),
        routes: {
          AddPlaceScree.routeName: (ctx) => const AddPlaceScree(),
        },
      ),
    );
  }
}

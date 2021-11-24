import 'package:flutter/material.dart';
import '../screen/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScree.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(color: Colors.amber,),
      ),
    );
  }
}

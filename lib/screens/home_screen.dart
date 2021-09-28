import 'package:flutter/material.dart';
import 'package:peliculasapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Películas en Cines"),
        actions: [
          IconButton(onPressed: (){
          }, 
          icon: Icon(Icons.search_outlined),
          splashRadius: 25.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(),
            MovieSlider(),
          ],),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:peliculasapp/providers/movies_provider.dart';
import 'package:peliculasapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar:  AppBar(
        title: Text("Películas en Cines"),
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.search_outlined),
          splashRadius: 25.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
            MovieSlider( 
              movies: moviesProvider.popularMovies, 
              title:'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(), 
            ),
          ],),
      )
    );
  }
}
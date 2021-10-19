import 'package:flutter/material.dart';
import 'package:peliculasapp/models/models.dart';
import 'package:peliculasapp/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie,),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie),
              _Overview(movie: movie),
              CastingCards()
            ])
          )
        ],
      ),
    ); 
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;  

  const _CustomAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle:true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(movie.title, style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.fullBackdropPath),
          fit:BoxFit.cover
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({
    Key? key, 
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            height:150,
            placeholder: AssetImage('assets/no-image.jpg'), 
            image: NetworkImage(movie.fullBackdropPath)
          )
        ),
        SizedBox(width: 20,),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Text(movie.title, 
              style: textTheme.headline5, 
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
        
            Text(
              movie.originalTitle,
              style: textTheme.subtitle1, 
            ),
        
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star_outline, size: 15, color: Colors.grey),
                SizedBox(width: 5),
                Text(movie.voteAverage.toString(), style: textTheme.caption),
              ],
            )
          ],),
        )
      ],),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({
    Key? key, 
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,textAlign: TextAlign.justify),
    );
  }
}
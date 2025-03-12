import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<bool> bookmarked = [];

  @override
  void initState() {
    super.initState();
    bookmarked = List<bool>.filled(movieList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return ListTile(
            leading: Image.network(movie.imgUrl,
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(movie.title),
            subtitle: Text(
                '${movie.year} - ${movie.genre} - Rating: ${movie.rating}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: movie),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.bookmark),
              color: bookmarked[index] ? Colors.blue : Colors.black,
              onPressed: () {
                setState(() {
                  bookmarked[index] = !bookmarked[index];
                });
              },
              iconSize: 24.0,
              padding: EdgeInsets.all(0.0),
              constraints: BoxConstraints(),
              splashRadius: 24.0,
              splashColor: Colors.blue.withOpacity(0.2),
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              disabledColor: Colors.transparent,
              tooltip: 'Bookmark',
            ),
          );
        },
      ),
    );
  }
}

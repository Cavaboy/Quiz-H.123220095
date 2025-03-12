import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(movie.imgUrl, height: 300, fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(movie.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Year: ${movie.year}'),
              Text('Genre: ${movie.genre}'),
              Text('Director: ${movie.director}'),
              SizedBox(height: 16),
              Text('Casts: ${movie.casts.join(', ')}'),
              SizedBox(height: 16),
              Text('Synopsis: ${movie.synopsis}'),
              SizedBox(height: 16),
              Text('Rating: ${movie.rating}/10'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (await canLaunch(movie.movieUrl)) {
                    await launch(movie.movieUrl);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch Wikipedia page')),
                    );
                  }
                },
                child: Text('Go to Wikipedia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
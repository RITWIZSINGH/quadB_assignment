import 'package:flutter/material.dart';
import '../models/show_model.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Show show = ModalRoute.of(context)!.settings.arguments as Show;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(show.name, style: TextStyle(color: Colors.white)),
              background: show.imageUrl != null
                ? Image.network(
                    show.imageUrl!, 
                    fit: BoxFit.cover,
                  )
                : Container(color: Colors.grey),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview', 
                      style: TextStyle(
                        fontSize: 22, 
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 10),
                    Text(
                      show.summary,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 5),
                        Text(
                          '${show.rating?.toStringAsFixed(1) ?? 'N/A'}/10',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Genres: ${show.genres.join(", ")}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
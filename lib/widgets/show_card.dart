import 'package:flutter/material.dart';
import '../models/show_model.dart';

class ShowCard extends StatelessWidget {
  final Show show;
  final VoidCallback onTap;

  const ShowCard({Key? key, required this.show, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black87,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: show.imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(show.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: show.imageUrl == null
                    ? Center(
                        child: Text('No Image',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            )))
                    : null,
              ),
            ),

            // Title and Summary Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Show Title
                  Text(
                    show.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),

                  // Show Summary
                  Text(
                    show.summary ?? 'No summary available',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 3,
                  ),

                  // Additional Information
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Show Type and Genre
                        Text(
                          '${show.type} • ${show.genres?.isNotEmpty == true ? show.genres!.join(", ") : "Unknown"}',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),

                        // Rating (if available)
                        if (show.rating != null)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '⭐ ${show.rating}/10',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

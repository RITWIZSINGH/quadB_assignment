import 'package:flutter/material.dart';
import '../models/show_model.dart';
import '../services/api_service.dart';
import '../widgets/show_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Show> shows = [];
  TextEditingController _searchController = TextEditingController();
  bool isLoading = false;

  Future<void> _searchShows(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      final fetchedShows = await ApiService.searchShows(query);
      setState(() {
        shows = fetchedShows;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to search shows'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search shows...',
            border: InputBorder.none,
          ),
          onSubmitted: _searchShows,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _searchShows(_searchController.text),
          )
        ],
      ),
      body: isLoading 
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: shows.length,
            itemBuilder: (context, index) {
              return ShowCard(
                show: shows[index], 
                onTap: () => Navigator.pushNamed(
                  context, 
                  '/details', 
                  arguments: shows[index]
                )
              );
            },
          ),
    );
  }
}
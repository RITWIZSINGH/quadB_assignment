import 'package:flutter/material.dart';
import '../models/show_model.dart';
import '../services/api_service.dart';
import '../widgets/show_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Show> shows = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchShows();
  }

  Future<void> _fetchShows() async {
    try {
      final fetchedShows = await ApiService.searchShows('all');
      setState(() {
        shows = fetchedShows;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load shows'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Shows', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
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
class Show {
  final int id;
  final String name;
  final String type;
  final List<String> genres;
  final String summary;
  final String? imageUrl;
  final double? rating;

  Show({
    required this.id,
    required this.name,
    required this.type,
    required this.genres,
    required this.summary,
    this.imageUrl,
    this.rating,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    final show = json['show'] ?? json;
    return Show(
      id: show['id'] ?? 0,
      name: show['name'] ?? 'Unknown Title',
      type: show['type'] ?? 'Unknown Type',
      genres: show['genres'] != null 
        ? List<String>.from(show['genres'])
        : [],
      summary: show['summary'] != null 
        ? show['summary'].replaceAll(RegExp(r'<[^>]*>'), '')
        : 'No summary available',
      imageUrl: show['image'] != null 
        ? (show['image']['original'] ?? show['image']['medium'])
        : null,
      rating: show['rating'] != null 
        ? (show['rating']['average']?.toDouble() ?? 0.0)
        : 0.0,
    );
  }
}
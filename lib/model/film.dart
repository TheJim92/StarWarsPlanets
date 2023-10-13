class Film {
  final String title;
  final String episodeId;

  Film(
      {required this.title,
      required this.episodeId,
      });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      episodeId: json['espisode_id'],
    );
  }
}

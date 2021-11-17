class Song {
  String title;
  String artist;
  String image;
  String audio;
  Song(
      {required this.title,
      required this.artist,
      required this.image,
      required this.audio});
  static Song mapToObject(map) {
    return Song(
        title: map['trackName'],
        artist: map['artistName'],
        image: map['artworkUrl100'],
        audio: map['previewUrl']);
  }
}

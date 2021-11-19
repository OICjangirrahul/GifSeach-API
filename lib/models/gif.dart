class Gif {
  String name;
  String imgurl;
  
  Gif(
      {required this.name,
      required this.imgurl,
     });
  
  static Gif mapToObject(map) {
    return Gif(
        name: map['username'],
        imgurl: map['images']['original']['url']
       );
  
  }
}

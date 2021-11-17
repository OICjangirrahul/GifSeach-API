import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/utils/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/utils/conversion.dart';
// import 'dart:convert' as jsonconvert;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  List listOfSongs = [];
  List<Widget> listOfWidgets = [];
  List<Widget> _prepareList(List<Song> songList) {
    return songList
        .map((song) => ListTile(
            subtitle: Text(song.artist),
            title: Text(song.title),
            leading: Image.network(song.image),
            trailing: IconButton(
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Colors.red,
              ),
              onPressed: () {},
            )))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State call");
    Future<http.Response> future = ApiClient.getSongs('arjit singh');
    future.then((response) {
      String responseBody = response.body;
      var list = Conversion.convertJSONTOObject(responseBody, 'results');
      List<Song> songList = Conversion.convertSongObjects(list);
      this.listOfWidgets = _prepareList(songList);
      setState(() {});
      // var data = jsonconvert.jsonDecode(responseBody);
      // print(data);
      // print(data.runtimeType);
      // var listOfSongs = data['results'];
      // print(listOfSongs);
      // this.listOfSongs = listOfSongs;
      // listOfWidgets = this
      //     .listOfSongs
      //     .map((song) => ListTile(
      //           subtitle: Text(song['artistName']),
      //           title: Text(song['trackName']),
      //           leading: Image.network(song['artworkUrl100']),
      //           trailing: IconButton(
      //             icon: Icon(Icons.play_arrow),
      //             onPressed: () {},
      //           ),
      //         ))
      //     .toList();
      // setState(() {});
      //print("Body Type ${responseBody.runtimeType}");
      //print("Response Body $responseBody ");
    }).catchError((err) => print("Error Rec During Server Call ${err}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: listOfWidgets
            // ElevatedButton(
            //     onPressed: () {
            //       ApiClient.getSongs('Sonu nigam');
            //     },
            //     child: Text('Call Server'))
            ,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/models/gif.dart';
import 'package:music_app/utils/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/utils/conversion.dart';
// import 'dart:convert' as jsonconvert;
import 'dart:ui';

class GifSearch extends StatefulWidget {
  const GifSearch({Key? key}) : super(key: key);

  @override
  _GifSearchState createState() => _GifSearchState();
}

class _GifSearchState extends State<GifSearch> {
  TextEditingController con = TextEditingController();
  String? valuee;
  Widget buildtext() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
       setState(() {
          valuee = value;
       });
      },
    );
  }

  List listOfSongs = [];
  List<Widget> listOfWidgets = [];
  List<Widget> _prepareList(List<Gif> giflist) {
    return giflist
        .map((gif) => Center(
              child: Column(
                children: [
                  Text(
                    gif.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                      width: 300,
                      child: Image.network(
                        gif.imgurl,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
    print("Init State call");
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: IconButton(onPressed: (){
           Future<http.Response> future = ApiClient.getgiphy('$valuee');
    future.then((response) {
      print(response);
      String responseBody = response.body;
      print(responseBody);
      var list = Conversion.convertJSONTOObject(responseBody, 'data');
      List<Gif> giflist = Conversion.convertSongObjects(list);
      this.listOfWidgets = _prepareList(giflist);
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
        }, icon: Icon(Icons.search))
      ),
      onChanged: (value) {
       setState(() {
          valuee = value;
       });
      },
              ),
            
            
              Text('$valuee'),
              Column(
                children: listOfWidgets
                // ElevatedButton(
                //     onPressed: () {
                //       ApiClient.getSongs('Sonu nigam');
                //     },
                //     child: Text('Call Server'))
                ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

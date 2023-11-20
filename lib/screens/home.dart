// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_experiment/services/data_request.dart';
import 'package:flutter_experiment/widgets/marks_carusel_widget.dart';
// import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // https://androidride.com/flutter-carousel-slider-example/
  final List<String> imagesList = [
    'https://cdn.pixabay.com/photo/2017/12/10/14/47/piza-3010062_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/07/01/49/ice-cream-1440830_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/02/25/07/15/food-3179853_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/10/26/11/10/honey-1006972_1280.jpg',
  ];

  final List<String> titles = [
    'Pizza',
    'Ice Cream',
    'Brownie',
    'Food',
    'Honey',
  ];

  @override
  void initState() {
    super.initState();
    // loadPages().then((_) => setState(() {}));
  }

  // This could is for SD UI
  // Future<void> loadPages() async {
  //   Response response = await DataRequest.get("home_title2.json");
  //   Map<String, dynamic> json = jsonDecode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          // FractionallySizedBox(
          //   widthFactor: 0.3,
          //   heightFactor: 0.7,
          //   child: Container(
          //     color: Colors.amber[600],
          //     child: const Center(child: Text('Entry A')),
          //   ),
          // ),
          // LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){

          // }),
          MarksCaruselWidget(
            height: MediaQuery.of(context).size.height * 0.65,
            imagesList: imagesList,
            navigation: true,
          ),
          SizedBox(
            height: 300,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Title 1',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MarksCaruselWidget(
                  height: 200,
                  imagesList: imagesList,
                  viewportFraction: 0.6,
                  titles: titles,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Title 2',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MarksCaruselWidget(
                  height: 200,
                  imagesList: imagesList,
                  viewportFraction: 1,
                ),
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

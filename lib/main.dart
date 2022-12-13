import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CharacterModel {
  Color color;
  String imagePath;
  String name;

  CharacterModel(this.color, this.imagePath, this.name);
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSelectedItem = 1;
  List<CharacterModel> characters = [
    CharacterModel(const Color(0xff111111), "images/heroes/captain.jpg",
        "Captain America"),
    CharacterModel(
        const Color(0xff6dfd01), "images/heroes/deadpool.jpeg", "Deadpool"),
    CharacterModel(
        const Color(0xff0a27cc), "images/heroes/iron_man.jpg", "Iron Man"),
    CharacterModel(
        const Color(0xfffd0136), "images/heroes/spider_man.jpg", "Spider Man"),
    CharacterModel(const Color(0xfffd01b2), "images/heroes/strange.jpeg",
        "Doctor Strange"),
    CharacterModel(
        const Color(0xff01bffe), "images/heroes/thanos.jpeg", "Thanos"),
    CharacterModel(const Color(0xfffd01bc), "images/heroes/thor.jpeg", "Thor"),
  ];

  void _indexChanged(int index) {
    setState(() {
      _currentSelectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2323),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image(
              image: const AssetImage('images/background.png'),
              fit: BoxFit.fill,
              color: characters[_currentSelectedItem].color,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Image(
                    image: AssetImage('images/marvel_logo.png'),
                    width: 200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 40),
                  child: Text(
                    'Choose your hero',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),
                ),
                // FractionallySizedBox(
                SizedBox(
                  height: 540,
                  child: Swiper(
                    onIndexChanged: _indexChanged,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(children: <Widget>[
                          Image(
                            image: AssetImage(characters[index].imagePath),
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  characters[index].name,
                                  style: const TextStyle(
                                      fontSize: 32, color: Colors.white60),
                                )),
                          ),
                        ]),
                      );
                    },
                    itemCount: characters.length,
                    viewportFraction: 0.8,
                    scale: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColorBrightness: Brightness.dark
      ),
      home: new HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MainPage extends StatelessWidget {
  const MainPage({ this.Name, this.Location, this.Pin });

  final String Name;
  final String Location;
  final int Pin;

//widget for each bar
//defined container for ican and two buttons
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
      .of(context)
      .textTheme;
    return new Container(
      height: 60.0,      
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.4),
        borderRadius: new BorderRadius.circular(3.0),
      ),
      
      child: new IntrinsicHeight(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(''
                
                ),
                radius: 20.0,
              ),
            ),
            new Expanded(
              child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(Name, style: textTheme.subhead),
                    new Text(Location, style: textTheme.caption),
                  ],
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: new InkWell(
                child: new Icon(Icons.done, size: 30.0),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              child: new InkWell(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.cancel, size: 30.0),
                  ],
                ),
                onTap: () {
                  // TODO(implement)
                },
              ),
            ),
          ],
        ),
        
      ),
      
    );
    
  }
}

//database fetch function



class Approval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    db = FirebaseDatabase.instance.reference().child("zoom_users");
db.once().then((DataSnapshot snapshot){
  Map<dynamic, dynamic> values = snapshot.value;
     values.forEach((key,values) {
      print(values["name"]);
    });
 });
    
    return new ListView(
      children: [
        new MainPage(Name: 'Trapadelic lobo', Location: 'lillobobeats', Pin: 4),
        new MainPage(Name: 'Different', Location: 'younglowkey', Pin: 23),
        new MainPage(Name: 'Future', Location: 'younglowkey', Pin: 2),
        new MainPage(Name: 'ASAP', Location: 'tha_producer808', Pin: 13),
        new MainPage(Name: '🌲🌲🌲', Location: 'TraphousePeyton'),
        new MainPage(Name: 'Something sweet...', Location: '6ryan'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
        new MainPage(Name: 'Sharpie', Location: 'Fergie_6'),
      ],
    );
  }
}



class CustomTabBar extends AnimatedWidget implements PreferredSizeWidget {
  CustomTabBar({ this.pageController, this.pageNames })
    : super(listenable: pageController);

  final PageController pageController;
  final List<String> pageNames;

  @override
  final Size preferredSize = new Size(0.0, 40.0);


// Widget for page controller
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
      .of(context)
      .textTheme;
    return new Container(
      height: 40.0,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: new BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.3),
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: new List.generate(pageNames.length, (int index) {
          return new InkWell(
            child: new Text(
              pageNames[index],
              style: textTheme.subhead.copyWith(
                color: Colors.white.withOpacity(
                  index == pageController.page ? 1.0 : 0.2,
                ),
              )
            ),
            onTap: () {
              pageController.animateToPage(
                index,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 150),
              );
            }
          );
        })
          .toList(),
      ),
    );
  }
}



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController = new PageController(initialPage: 0);

  @override
  build(BuildContext context) {
    final Map<String, Widget> pages = <String, Widget>{
      'Approval List': new Approval(),
      'On going': new Center(
        child: new Text('under work'),
      ),
      'Customers': new Center(
        child: new Text('Under Work'),
      ),
      
    };

    TextTheme textTheme = Theme
      .of(context)
      .textTheme;
    return new Stack(
      children: [
        new Container(
          //for the commented below lines
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                const Color.fromARGB(255, 250, 120, 80),
                const Color.fromARGB(255, 150, 70, 90),
              ],
              stops: [0.0, 1.0],
            )
          ),
          // child: new Align(
          //   alignment: FractionalOffset.bottomCenter,
          //   child: new Container(
          //     padding: const EdgeInsets.all(10.0),
          //     child: new Text(
          //       'Rohit Madhu',
          //       style: textTheme.headline.copyWith(
          //         color: Colors.grey.shade800.withOpacity(0.8),
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   )
          // )
        ),
        new Scaffold(
          backgroundColor: const Color(0x00000000),
          appBar: new AppBar(
            backgroundColor: const Color(0x00000000),
            elevation: 0.0,
            leading: new Center(
              child: new ClipOval(
                child: new Image.network(
                  '',
                ),
              ),
            ),
            actions: [
              new IconButton(
                icon: new Icon(Icons.cancel),
                onPressed: () {
                  // TODO: implement
                },
              ),
            ],
            title: const Text('Test App'),
            bottom: new CustomTabBar(
              pageController: _pageController,
              pageNames: pages.keys.toList(),
            ),
          ),
          body: new PageView(
            controller: _pageController,
            children: pages.values.toList(),
          ),
        ),
      ],
    );
  }
}
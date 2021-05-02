
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

int toggle = 0;

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _control;
  // This widget is the root of your application.
  @override
  void initState(){
    super.initState();

    _control = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 375,
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'soNofNos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            children: <Widget>[
              Center(
                child: Text(
                  "Emeka Chibuike",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),

              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Top Projects',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 205.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: locations.length,
                      itemBuilder: (BuildContext context, int index) {
                        Location location = locations[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (_) => UpdateTopics(
                                //   location: location,
                                // ),
                                builder: (_) =>

                                    Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              // height: MediaQuery.of(context).size.width,
                                              height: 500,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(0.0, 2.0),
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                              ),
                                              child: Positioned(
                                                top: 0.0,
                                                left: 0.0,
                                                right: 0.0,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  child: Image(
                                                    image: AssetImage(location.imageUrl),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
                                              child: Row(children: [
                                                IconButton(
                                                  icon: Icon(Icons.arrow_back_ios),
                                                  iconSize: 25.0,
                                                  color: Color.fromRGBO(35, 173, 97, 1),
                                                  onPressed: (){Navigator.pop(context);},
                                                ),
                                              ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: 300.0,
                            margin: EdgeInsets.all(15.0),
                            child:
                            Stack(alignment: Alignment.topCenter, children: <Widget>[
                              Container(
                                // height: 300.0,
                                width: 30.0,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: location.imageUrl,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 300.0,
                                          width: 300.0,
                                          image: AssetImage(location.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0.0,
                                      bottom: 0.0,
                                      child: Container(
                                        height: 60,
                                        width: 250.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only( topRight: Radius.circular(55.0), bottomLeft: Radius.circular(20.0),),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Positioned(
                                            left: 10.0,
                                            bottom: 10.0,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text(
                                                  location.description,
                                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Recent Projects',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 450.0,
                    child: ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (BuildContext context, int index) {
                        Location location = locations[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (_) => UpdateTopics(
                                //   location: location,
                                // ),



                                builder: (_) =>


                                    Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              // height: MediaQuery.of(context).size.width,
                                              height: 500,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(0.0, 2.0),
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                              ),
                                              child: Positioned(
                                                top: 0.0,
                                                left: 0.0,
                                                right: 0.0,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  child: Image(
                                                    image: AssetImage(location.imageUrl),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
                                              child: Row(children: [
                                                IconButton(
                                                  icon: Icon(Icons.arrow_back_ios),
                                                  iconSize: 25.0,
                                                  color: Color.fromRGBO(35, 173, 97, 1),
                                                  onPressed: (){Navigator.pop(context);},
                                                ),
                                              ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: 300.0,
                            margin: EdgeInsets.all(10.0),
                            child:
                            Stack(alignment: Alignment.topCenter, children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: location.imageUrl,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 200.0,
                                          width: 360.0,
                                          image: AssetImage(location.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0.0,
                                      bottom: 0.0,
                                      child: Container(
                                        height: 70,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(60.0),
                                            bottomLeft: Radius.circular(20.0),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Positioned(
                                            left: 15.0,
                                            bottom: 15.0,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text(
                                                  location.description,
                                                  style: TextStyle(
                                                      fontSize: 12, color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),




            ],
          ),
        ),

        floatingActionButton:  Positioned(
          bottom: 50.0,
          left: 10.0,
          child: Container(
            // height: 100.0,
            height: 100.0,
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment(-1.0, 0.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 375),
              height: 48.0,
              // height: (toggle == 0) ? 48.0 : 96.0,
              width: (toggle == 0) ? 48.0 : MediaQuery.of(context).size.width * 0.8,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        height: 38.0,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: AnimatedBuilder(
                          child: Icon(
                            Icons.keyboard_voice_rounded,
                            size: 20.0,
                            color: Color.fromRGBO(35, 173, 97, 1),
                          ),
                          builder: (context, widget) {
                            return Transform.rotate(
                              angle: _control.value * 2.0 * pi,
                              child: widget,
                            );
                          },
                          animation: _control,
                        ),
                      ),
                    ),
                    duration: Duration(milliseconds: 375),
                    top: 6.0,
                    right: 7.0,
                    curve: Curves.easeOut,
                  ),
                  AnimatedPositioned(
                    child: (AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      child: Container(
                        height: 23.0,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          cursorRadius: Radius.circular(10.0),
                          cursorWidth: 2.0,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: "Search Projects...",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,

                              )
                          ),
                        ),
                      ),
                    )),
                    duration: Duration(milliseconds: 375),
                    left: (toggle == 0) ? 20.0 : 40.0,
                    top: 13.0,
                    curve: Curves.easeOut,
                  ),

                  Material(
                    color: Color.fromRGBO(35, 173, 97, 1),
                    borderRadius: BorderRadius.circular(30.0),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          if (toggle == 0){
                            toggle = 1;
                            _control.forward();
                          }else{
                            toggle = 0;
                            _control.reverse();
                          }
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Activity{
  String imageUrl;
  String name;
  String type;

  Activity({
    this.imageUrl,
    this.name,
    this.type,
  });

}


class Location {
  String imageUrl;
  String description;
  List<Activity> activities;

  Location({
    this.imageUrl,
    this.activities,
    this.description,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: "assets/images/onboardingtwo.png",
  ),
  Activity(
    imageUrl: "assets/images/onboardingone.png",
  ),
  Activity(
    imageUrl: "assets/images/onboardingone.png",
  ),
];

List<Location> locations = [
  Location(
    imageUrl: "assets/images/onboardingtwo.png",
    activities: activities,
    description: 'Apprizee',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Photo App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Visit Unilag for an amazing picnic',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Amazon App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Travel App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Weather App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Banking App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Education App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Navigation App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Event Booking App',
  ),
  Location(
    imageUrl: "assets/images/onboardingone.png",
    activities: activities,
    description: 'Gym App',
  ),
];
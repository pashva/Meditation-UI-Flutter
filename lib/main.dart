import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset("assets/icons/calendar.svg"),
                Text("Today")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/gym.svg"),
                Text("Gym")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/Settings.svg"),
                Text("Settings")
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEBB).withOpacity(0.5),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1), shape: BoxShape.circle),
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Text("Good Morning \n Pashva",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: SvgPicture.asset("assets/icons/search.svg")),
                  ),
                ),
                Expanded(
                                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      Category(name: "Diet Recommendation",svgsrc: "assets/icons/Hamburger.svg",),
                      Category(name: "Excercise",svgsrc: "assets/icons/Excrecises.svg",),
                      Category(name: "Meditation",svgsrc: "assets/icons/Meditation.svg",),
                      Category(name: "Yoga",svgsrc: "assets/icons/yoga.svg",),
                      
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String svgsrc;
  final String name;
  const Category({
    Key key, this.svgsrc, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          SvgPicture.asset(svgsrc),
          Spacer(),
          Text(name,style: Theme.of(context).textTheme.title.copyWith(fontSize: 13.5),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}

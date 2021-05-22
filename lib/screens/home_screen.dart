import 'package:flutter/material.dart';
import 'package:yatravel/widgets/destination_carousel.dart';
import 'package:yatravel/screens/states.dart';
import 'package:yatravel/screens/maps.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    Icons.settings,             ///change password
    Icons.list,                 ///user wish list
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Welcome to YaTravel!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel('NBU495HUZ0jhSnYFgj10'),        ///Explore suggestions based on reviews
            SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: new Text("Search"),      ///search entire app for places to visit
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),

          ),

          BottomNavigationBarItem(
            title: new Text("Explore"),     ///open states list
            icon: IconButton(
              icon: Icon(Icons.explore,
              size: 30.0,
            ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => States()),
                );
              },
            ),

          ),
          BottomNavigationBarItem(
            title: new Text("Maps"),      ///takes you to google maps
            icon: IconButton(
              icon: Icon(Icons.map,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Maps()),
                );
              },
            ),

          )
        ],
      ),
    );
  }
}

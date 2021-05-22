import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yatravel/models/destination_model.dart';
import 'package:yatravel/screens/destination_screen.dart';

class FoodCarousel extends StatelessWidget {

  final String state;

  FoodCarousel(this.state);
  @override
  Widget build(BuildContext context) {
    CollectionReference Food = FirebaseFirestore.instance.collection('Food');

    return FutureBuilder<DocumentSnapshot>(             ///calling food_data of particular state
        future: Food.doc(state).get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasError) {
    return  Text("Something went wrong!");
    }
    if (snapshot.hasData && !snapshot.data.exists) {
    return Text("Document does not exist");
    }
    if (snapshot.connectionState == ConnectionState.done) {
    Map<String, dynamic> data = snapshot.data.data();
    return Scaffold();
        /*body: Column(
          children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Foods in "${data['state']}"',
                  style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
      ),
      ),
      Container(
      height: 300.0,
      child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: destinations.length,
      itemBuilder: (BuildContext context, int index) {
      Destination destination = destinations[index];
      return GestureDetector(
      onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
      builder: (_) => DestinationScreen(
      destination: destination,
      ),
      ),
      ),
      child: Container(
      margin: EdgeInsets.all(10.0),
      width: 210.0,
      child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
      Positioned(
      bottom: 15.0,
      child: Container(
      height: 120.0,
      width: 200.0,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
      '${destination.activities.length} activities',
      style: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      ),
      ),
      Text(
      destination.description,
      style: TextStyle(
      color: Colors.grey,
      ),
      ),
      ],
      ),
      ),
      ),
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
      tag: destination.imageUrl,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image(
      height: 180.0,
      width: 180.0,
      image: AssetImage(destination.imageUrl),
      fit: BoxFit.cover,
      ),
      ),
      ),
      Positioned(
      left: 10.0,
      bottom: 10.0,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
      destination.state,
      style: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      ),
      ),
      Row(
      children: <Widget>[
      Icon(
      Icons.arrow_circle_down ,
      size: 10.0,
      color: Colors.white,
      ),
      SizedBox(width: 5.0),
      Text(
      destination.country,
      style: TextStyle(
      color: Colors.white,
      ),
      ),
      ],
      ),
      ],
      ),
      ),
      ],
      ),
      )
      ],
      ),
      ),
      );
      },
      ),
      ),
      ],
      );
      );
    */
    }
    return CircularProgressIndicator();
    }
    );
    }
  }


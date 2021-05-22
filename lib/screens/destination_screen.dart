import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yatravel/widgets/destination_carousel.dart';

class DestinationScreen extends StatelessWidget {
  final String documentId;

  DestinationScreen(this.documentId);

  /*@override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  */
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }



  @override
  Widget build(BuildContext context) {
    CollectionReference States = FirebaseFirestore.instance.collection('States');

    return FutureBuilder<DocumentSnapshot>(             ///calling data of particular state
      future: States.doc(documentId).get(),
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
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "${data['name']}",
              home: Scaffold(
                appBar: AppBar(title:Text("${data['name']}"),),
                body: SafeArea(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical:30.0),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left:20.0,right:20.0),
                          child:
                          Text("${data['description']}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,)
                          ),
                        ),
                        SizedBox(height: 20.0),
                        DestinationCarousel("${data['state']}"),
                      ],
                    ),
                  ),
              ),
            );

            /*return Scaffold(
            body:Column(
              children: <Widget>[
              Stack(
              children: <Widget>[
              Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
              BoxShadow(
              color: Colors.teal,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
              ),
              ],
              ),
              child: Hero(
              tag: "${data['imageUrl']}",
              child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                '${data['imageUrl']}',
                alignment: Alignment.center,
              ),
              ),
              ),
              ),
              Padding(
              padding: EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 40.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              ),
              Row(
              children: <Widget>[
              IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              ),
              IconButton(
              icon: Icon(Icons.arrow_circle_down),
              iconSize: 25.0,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              ),
              ],
              ),
              ],
              ),
              ),
              Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                "${data['name']}",
              style: TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              ),
              ),
              Row(
              children: <Widget>[
              Icon(
              Icons.location_on,
              size: 15.0,
              color: Colors.white70,
              ),
              SizedBox(width: 5.0),
              Text("${data['country']}",
              style: TextStyle(
              color: Colors.white70,
              fontSize: 20.0,
              ),
              ),
              ],
              ),
              ],
              ),
              ),
              Positioned(
              right: 20.0,
              bottom: 20.0,
              child: IconButton(
                icon: Icon(Icons.explore),
              color: Colors.white70,
              iconSize: 25.0,
                onPressed:() {
                  DestinationCarousel("${data['name']}");
                }
              ),
              ),
              ],
              ),
          ],
        ),
      );*/
    }
    return CircularProgressIndicator();
    }
  );
  }
}

// Text("Full Name: ${data['name']} Country: ${data['country']} Description: ${data['description']}");

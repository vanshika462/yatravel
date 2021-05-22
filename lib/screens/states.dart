import 'package:flutter/material.dart';
import 'package:yatravel/models/destination_model.dart';
import 'package:yatravel/screens/destination_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class States extends StatelessWidget {
  const States({Key key}) : super(key: key);


  static const String _title = 'States of India';
  Future<Widget> _getImage(BuildContext context, String imageName) async{
    Image m;
    await FireStorageService.loadImage(context, imageName).then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text("States of India")),
        body: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(                                  ///background image
                  child: FutureBuilder(
                    future: _getImage(context, "assets/bg.jpg"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width ,
                          height:MediaQuery.of(context).size.height ,
                          child: snapshot.data,
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return Container(
                          width: MediaQuery.of(context).size.width ,
                          height:MediaQuery.of(context).size.height ,
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container();
                    }
                ),
                ),
              ],
            ),
            Container(                                ///dropdown list of states
              alignment: Alignment.center,
              child: Dropdown(),
            ),
          ],
        ),
      ),
      theme: ThemeData(
        primaryColor: Color(0xFF033A34),
        accentColor: Color(0xFFe3b081),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  const Dropdown({Key key}) : super(key: key);

  @override
  State<Dropdown> createState() => _Dropdown();
}


class _Dropdown extends State<Dropdown> {
  String dropdownValue = 'Delhi';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: Text('Select State'),
      dropdownColor: Color(0xFFe3b081),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 30,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 3,
        color: Colors.teal[900],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          switch(newValue){
            case "Delhi":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DestinationScreen('NBU495HUZ0jhSnYFgj10')),
              );
              break;
            case 'HimachalPradesh':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DestinationScreen('14xoeExtpT1iCNzeiYKQ')),
              );
              break;
            case 'Goa':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DestinationScreen('3hmtMw8Q61nsk6EoqDiJ')),
              );
              break;
            case 'Rajasthan':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DestinationScreen('8WF3rmrRRnt8vZsL19ia')),
              );
              break;
          }
        }
        );
      },
      items: <String>['Delhi', 'HimachalPradesh', 'Goa', 'Kerala','Rajasthan','Assam']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.teal.withOpacity(1.0), fontStyle: FontStyle.italic)
          ),
        );
      }).toList(),
    );
  }
}


class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String imageName) async{
    return await FirebaseStorage.instance.ref().child(imageName).getDownloadURL();
  }
}

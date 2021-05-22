import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yatravel/screens/home_screen.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "yatravel/assets/yatravel logo3.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            LoginWidget()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          width: 300,
          height: 250,
          color: Colors.white.withAlpha(400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: 'Email', hintStyle: TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password', hintStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                children: [

                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      HomeScreen();     /// Login
                    },
                  ),

                  SizedBox(width: 20,),

                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {},    ///Register
                  ),

                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
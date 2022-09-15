import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Intro Screen",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                Navigator.of(context).pushReplacementNamed("/");
                prefs.setBool("isIntroVisited", true);
              });
            },
            child: const Text("Skip"),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: IndexedStack(
            alignment: Alignment.center,
            index: initialIndex,
            children: [
              Column(
                children: const [
                  FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 300,
                  ),
                  Text(
                    "Welcome To Flutter",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  FlutterLogo(
                    style: FlutterLogoStyle.markOnly,
                    size: 100,
                  ),
                  // Spacer(),
                  Text(
                    "Made with ❤  in india",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  FlutterLogo(
                    style: FlutterLogoStyle.stacked,
                    size: 190,
                  ),
                  Text(
                    "Press Next to Homepage",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            if (initialIndex < 2) {
              initialIndex++;
            } else {
              Navigator.of(context).pushReplacementNamed("/");
              prefs.setBool("isIntroVisited", true);
            }
          });
        },
        child: const Text("Next"),
      ),
    );
  }
}

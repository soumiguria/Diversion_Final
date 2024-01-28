import 'package:diversion/SplashScreen.dart';
import 'package:diversion/future_analysis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Ideation',
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alt Explorer'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4CAF50), Color(0xFF2196F3)], // Adjust colors as needed
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Project Ideation Hub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                PromptInputPlaceholder(),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FutureAnalysisPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade800),
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.white, width: 2.0),
      //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      // RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
      // ),
                    ),
                    // Change the color to the desired one, for example, Colors.red
                  ),
                  child: Text('Generate Analysis'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PromptInputPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter your project idea prompt here...',
          border: InputBorder.none,
        ),
        maxLines: 5,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(color: Colors.black), // Adjust text color
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diversion/APIEndpoints.dart';
import 'package:diversion/SetupDetails.dart';
import 'package:diversion/SplashScreen.dart';
import 'package:diversion/FutureAnalysis.dart';
import 'package:diversion/Technologies.dart';
import 'package:diversion/WinningStrategies.dart';
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

      routes: {
    '/Technologies Information': (context) => Technologies(),
    '/API Endpoints Information': (context) => ApiEndpoints(),
    '/Setup Details Information': (context) => SetupDetails(),
    '/Winning Strategies Information': (context) => WinningStrategies(),
  },

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController promptController = TextEditingController();

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
            colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alt Explorer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                PromptInputPlaceholder(promptController: promptController),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    // Check if the prompt is empty
                    if (promptController.text.isEmpty) {
                      // Show snackbar for required field
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('This is a required field.'),
                        ),
                      );
                    } else {
                      print('Button pressed 1'); 
                      // Call the API and display response
                      await _generateAnalysisResponse();

                      print('Button pressed 2'); 

                      // Redirect to FutureAnalysisPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FutureAnalysisPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade800,
                    side: BorderSide(color: Colors.white, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'Generate Analysis',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _generateAnalysisResponse() async {
    // Ensure the prompt is not empty
    if (promptController.text.isEmpty) {
      print('Please enter a project idea prompt.');
      return;
    }

    // API endpoint for generating analysis (update with your actual endpoint)
    final String apiUrl = 'http://localhost:3001/generate-analysis';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'prompt': promptController.text}),
      );

      // Parse the response
      final responseData = json.decode(response.body);

      // Display the response in the console
      print('Analysis Result: ${responseData['analysis']}');
      print('Feedback: ${responseData['feedback']}');
      print('Reality Check: ${responseData['realityCheck']}');

      // You can also display the response on the screen if needed
      // setState(() {
      //   // Update UI with response
      // });
    } catch (error) {
      print('Error generating analysis: $error');
    }
  }
}

class PromptInputPlaceholder extends StatefulWidget {
  final TextEditingController promptController;

  const PromptInputPlaceholder({Key? key, required this.promptController}) : super(key: key);

  @override
  State<PromptInputPlaceholder> createState() => _PromptInputPlaceholderState();
}

class _PromptInputPlaceholderState extends State<PromptInputPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: widget.promptController,
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

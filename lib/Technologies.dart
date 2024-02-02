// import 'package:flutter/material.dart';

// class Technologies extends StatelessWidget {
//   const Technologies({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Text('Technology'),
//       ),
//     );
//   }
// }



import 'dart:convert';

import 'package:diversion/api_key.dart';
import 'package:diversion/components/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Technologies extends StatefulWidget {
  const Technologies({Key? key}) : super(key: key);

  @override
  _TechnologiesState createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
  late Future<String> futureTechnologies;

  @override
  void initState() {
    super.initState();

    // Retrieve the user prompt from the ChatProvider
    String userPrompt = Provider.of<ChatProvider>(context, listen: false).userPrompt;

    // Initialize futureTechnologies lazily in the initState
    futureTechnologies = fetchTechnologies(userPrompt);
  }

  Future<String> fetchTechnologies(String userPrompt) async {
    // Run a background prompt to generate information about technologies based on the user input
    String backgroundPrompt =
        "Provide information about the technologies that can be used for building the project: $userPrompt";

    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": backgroundPrompt},
        {"role": "user", "content": userPrompt}
      ],
      "max_tokens": 200,
    };

    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${APIKey.apiKey}",
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = json.decode(response.body);
        String technologiesData = parsedResponse['choices'][0]['message']['content'];
        return technologiesData;
      } else {
        throw Exception('Failed to fetch technologies. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error during API request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder<String>(
              future: futureTechnologies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Text(
                    snapshot.data ?? 'No data available',
                    style: TextStyle(fontSize: 16.0),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

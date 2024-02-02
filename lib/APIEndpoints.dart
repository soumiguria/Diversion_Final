// // import 'package:flutter/material.dart';

// // class ApiEndpoints extends StatelessWidget {
// //   const ApiEndpoints({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Text('ApiEndpoints'),
// //       ),
// //     );
// //   }
// // }



// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:diversion/components/provider.dart'; // Import your provider class

// // class ApiEndpoints extends StatefulWidget {
// //   const ApiEndpoints({Key? key}) : super(key: key);

// //   @override
// //   _ApiEndpointsState createState() => _ApiEndpointsState();
// // }

// // class _ApiEndpointsState extends State<ApiEndpoints> {
// //   late Future<String> apiEndpointsData;

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Retrieve the user prompt from the ChatProvider
// //     String userPrompt = Provider.of<ChatProvider>(context, listen: false).userPrompt;

// //     // Initialize apiEndpointsData lazily in the initState
// //     apiEndpointsData = fetchApiEndpoints(userPrompt);
// //   }

// //   Future<String> fetchApiEndpoints(String userPrompt) async {
// //     // Simulating a delay of 2 seconds
// //     await Future.delayed(Duration(seconds: 2));

// //     // Run a prompt in the background based on the userPrompt
// //     String backgroundPrompt = "for my idea try to provide me  link of APIS  available on internet which help me in building my app and if you are not able to provide then provide me link of those websites where i can find APIS of my requirement easily  i don't need any real time data: $userPrompt";

// //     // Add your OpenAI API call logic here to fetch data based on the background prompt

// //     // For now, returning dummy data
// //     return 'API endpoints data based on the user prompt: $userPrompt';
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('API Endpoints'),
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: FutureBuilder<String>(
// //             future: apiEndpointsData,
// //             builder: (context, snapshot) {
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return Center(
// //                   child: CircularProgressIndicator(),
// //                 );
// //               } else if (snapshot.hasError) {
// //                 return Center(
// //                   child: Text('Error: ${snapshot.error}'),
// //                 );
// //               } else {
// //                 return Center(
// //                   child: Text(snapshot.data ?? 'No data available'),
// //                 );
// //               }
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }




// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:diversion/api_key.dart'; // Import your API key file

// Future<String> fetchApiEndpoints(String userPrompt) async {
//   // Run a prompt in the background based on the userPrompt
//   String backgroundPrompt = "Provide information about API endpoints based on the user prompt: $userPrompt";

//   // Prepare the API request
//   Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

//   Map<String, dynamic> body = {
//     "model": "gpt-3.5-turbo",
//     "messages": [
//       {"role": "system", "content": backgroundPrompt},
//       {"role": "user", "content": userPrompt}
//     ],
//     "max_tokens": 200,
//   };

//   try {
//     final response = await http.post(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer ${APIKey.apiKey}", // Replace with your OpenAI API key
//       },
//       body: json.encode(body),
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> parsedResponse = json.decode(response.body);

//       // Extract and return the generated API endpoints data
//       String apiEndpointsData = parsedResponse['choices'][0]['message']['content'];
//       return apiEndpointsData;
//     } else {
//       throw Exception('Failed to fetch API endpoints. Status code: ${response.statusCode}');
//     }
//   } catch (error) {
//     throw Exception('Error during API request: $error');
//   }
// }





// import 'package:diversion/api_key.dart';
// import 'package:diversion/components/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:provider/provider.dart';

// class ApiEndpoints extends StatefulWidget {

//   const ApiEndpoints({Key? key}) : super(key: key);

//   @override
//   _ApiEndpointsState createState() => _ApiEndpointsState();
// }

// class _ApiEndpointsState extends State<ApiEndpoints> {
//   late Future<String> futureApiEndpoints;

//   @override
//   void initState() {
//     super.initState();
//     futureApiEndpoints = fetchApiEndpoints(widget.userPrompt);
//   }

//   Future<String> fetchApiEndpoints(String userPrompt) async {
//     // Run a background prompt to generate API endpoints based on the user input
//     String backgroundPrompt = "for my idea try to provide me  link of APIS  available on internet which help me in building my app and if you are not able to provide then provide me link of those websites where i can find APIS of my requirement easily  i don't need any real time data: $userPrompt";

//     Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

//     Map<String, dynamic> body = {
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {"role": "system", "content": backgroundPrompt},
//         {"role": "user", "content": userPrompt}
//       ],
//       "max_tokens": 200,
//     };

//     try {
//       final response = await http.post(
//         uri,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer ${APIKey.apiKey}",
//         },
//         body: json.encode(body),
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> parsedResponse = json.decode(response.body);
//         String apiEndpointsData = parsedResponse['choices'][0]['message']['content'];
//         return apiEndpointsData;
//       } else {
//         throw Exception('Failed to fetch API endpoints. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       throw Exception('Error during API request: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Endpoints'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: FutureBuilder<String>(
//           future: futureApiEndpoints,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               return Text(
//                 snapshot.data ?? 'No data available',
//                 style: TextStyle(fontSize: 16.0),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:diversion/api_key.dart';
import 'package:diversion/components/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiEndpoints extends StatefulWidget {
  const ApiEndpoints({Key? key}) : super(key: key);

  @override
  _ApiEndpointsState createState() => _ApiEndpointsState();
}

class _ApiEndpointsState extends State<ApiEndpoints> {
  late Future<String> futureApiEndpoints;

  @override
  void initState() {
    super.initState();

    // Retrieve the user prompt from the ChatProvider
    String userPrompt = Provider.of<ChatProvider>(context, listen: false).userPrompt;

    // Initialize futureApiEndpoints lazily in the initState
    futureApiEndpoints = fetchApiEndpoints(userPrompt);
  }

  Future<String> fetchApiEndpoints(String userPrompt) async {
    // Run a background prompt to generate API endpoints based on the user input
    String backgroundPrompt =
        "for my idea try to provide me  link of APIS  available on the internet which help me in building my app and if you are not able to provide then provide me the link of those websites where I can find APIS of my requirement easily  I don't need any real-time data, also make the links of the apis clickable so that they redirect to the respective pages: $userPrompt";

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
        String apiEndpointsData = parsedResponse['choices'][0]['message']['content'];
        return apiEndpointsData;
      } else {
        throw Exception('Failed to fetch API endpoints. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error during API request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Endpoints'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder<String>(
            future: futureApiEndpoints,
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
    );
  }
}

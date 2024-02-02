// import 'package:flutter/material.dart';

// class RevenueModelPage extends StatelessWidget {
//   const RevenueModelPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Revenue Model'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [const Color.fromARGB(255, 214, 116, 231), Color.fromARGB(255, 230, 230, 142)], // Set your gradient colors
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Revenue Streams',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               SizedBox(height: 16.0),
//               _buildRevenueStream('Subscription', 'Monthly subscription fee'),
//               _buildRevenueStream('Advertising', 'Revenue from ads displayed'),
//               _buildRevenueStream('In-App Purchases', 'Revenue from in-app purchases'),
//               _buildRevenueStream('Affiliate Marketing', 'Commission from affiliate marketing'),
//               // Add more revenue streams as needed
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRevenueStream(String title, String description) {
//     return Card(
//       elevation: 5,
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               description,
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:diversion/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RevenueModelPage extends StatefulWidget {
  final String userPrompt;

  const RevenueModelPage({Key? key, required this.userPrompt}) : super(key: key);

  @override
  _RevenueModelPageState createState() => _RevenueModelPageState();
}

class _RevenueModelPageState extends State<RevenueModelPage> {
  late Future<String> futureRevenueModel;

  @override
  void initState() {
    super.initState();
    futureRevenueModel = fetchRevenueModel(widget.userPrompt);
  }

  Future<String> fetchRevenueModel(String userPrompt) async {
    // Implement your logic to fetch the revenue model in the background based on userPrompt
    // For example, you can use an API call or any asynchronous operation

    // Simulating a delay of 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // Dummy revenue model (replace with actual data)
    String revenueModel = 'Generated revenue model based on user input: $userPrompt';

    // Run another prompt in the background based on the previous userPrompt
    String backgroundPrompt = "explain me how i can generate revenue for my app by different methods and explain   how these methods work on my app  i want you to explain each model in 500 words pointwise where first point explains how it works ,second point explains its implementation pointwise";

    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": backgroundPrompt},
        {"role": "user", "content": userPrompt}
      ],
      "max_tokens": 2000,
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${APIKey.apiKey}", // Replace with your OpenAI API key
      },
      body: json.encode(body),
    );

    Map<String, dynamic> parsedResponse = json.decode(response.body);

    String additionalResponse = parsedResponse['choices'][0]['message']['content'];

    // Process the additionalResponse as needed

    // Combine the fetched revenue model and additional response
    String combinedResults = '$revenueModel\n\nAdditional details: $additionalResponse';

    return combinedResults;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revenue Model'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color.fromARGB(255, 214, 116, 231), Color.fromARGB(255, 230, 230, 142)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<String>(
              future: futureRevenueModel,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Generated Revenue Model',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        snapshot.data!,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
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

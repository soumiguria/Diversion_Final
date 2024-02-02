import 'dart:convert';
import 'package:diversion/CompetitorsPage.dart';
import 'package:diversion/EnhancingOpportunityPage.dart';
import 'package:diversion/GuidancePage.dart';
import 'package:diversion/RevenuePage.dart';
import 'package:diversion/MarketTrendsPage.dart';
import 'package:diversion/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureAnalysisPage extends StatelessWidget {

  final String response;

  FutureAnalysisPage({required this.response});

    Future<List<String>> fetchCompetitors(String userPrompt) async {
    // Implement your logic to fetch competitors in the background based on userPrompt
    // For example, you can use an API call or any asynchronous operation

    // Simulating a delay of 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // Dummy list of competitors (replace with actual data)
    List<String> competitors = ['Competitor A', 'Competitor B', 'Competitor C'];

    // Run another prompt in the background based on the previous userPrompt
    String backgroundPrompt = "If similar products are present in the market, provide names of any five.";

    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": backgroundPrompt},
        {"role": "user", "content": userPrompt}
      ],
      "max_tokens": 50,
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

    // Combine the fetched competitors and additional response
    List<String> combinedResults = [...competitors, additionalResponse];

    return combinedResults;
  }

  @override
  Widget build(BuildContext context) {
    // String userPrompt = Provider.of<ChatProvider>(context).userPrompt;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alt Explorer'),
        // backgroundColor: Colors.purple,
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
              // colors: [Colors.purple, Colors.blue]
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // Text(
                    //   'Future Analysis',
                    //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        response,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: CategoryContainer(
                        label: 'Competitors',
                        imageAsset: 'assets/images/competitors_image.jpeg', // Replace with your image asset
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CompetitorsPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: CategoryContainer(
                        label: 'Market Trends and Potential',
                        imageAsset: 'assets/images/market_potential_image.jpeg',
                        onPressed: () async {
                          // Pass the context and user prompt to MarketTrendsPage
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MarketTrendsPage(),
                            ),
                          );

                          // Handle the result if needed
                          print(result);
                        },
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: CategoryContainer(
                        label: 'Revenue Model',
                        imageAsset: 'assets/images/revenue_model.jpeg', // Replace with your image asset
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RevenueModelPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: CategoryContainer(
                        label: 'Enhancing Opportunity',
                        imageAsset: 'assets/images/enhancing_opportunity.jpeg', // Replace with your image asset
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EnhancingOpportunityPage()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: CategoryContainer(
                        label: 'Guidance',
                        imageAsset: 'assets/images/guidance.jpeg', // Replace with your image asset
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GuidancePage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final String label;
  final String imageAsset;
  final VoidCallback onPressed;

  CategoryContainer({required this.label, required this.imageAsset, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

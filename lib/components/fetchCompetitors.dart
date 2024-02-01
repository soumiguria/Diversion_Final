import 'dart:convert';
import 'package:diversion/api_key.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCompetitors(String userMessage) async {
  // Replace 'YOUR_OPENAI_API_KEY' with your actual OpenAI API key
  // final String apiKey = 'YOUR_OPENAI_API_KEY';

  // Construct the prompt based on userMessage
  final String prompt = 'Name all the direct and indirect competitors present in the market for the $userMessage.';

  // Prepare the request headers
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${APIKey.apiKey}",
  };

  // Prepare the request body
  final Map<String, dynamic> requestBody = {
    'model': 'gpt-3.5-turbo', // Use the appropriate model
    'prompt': prompt,
    'max_tokens': 150, // Adjust max_tokens based on your requirements
  };

  try {
    // Perform the HTTP POST request to the OpenAI API
    final http.Response response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/gpt-3.5-turbo/completions'), // Adjust the endpoint accordingly
      headers: headers,
      body: json.encode(requestBody),
    );

    // Parse the response and extract the competitors
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      final List<String> competitors = responseBody['choices'][0]['text'].toString().split('\n');
      return competitors;
    } else {
      // Handle the error scenario
      throw Exception('Failed to fetch competitors. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle exceptions
    throw Exception('Error during API request: $error');
  }
}

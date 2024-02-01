// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:diversion/APIEndpoints.dart';
// import 'package:diversion/SetupDetails.dart';
// import 'package:diversion/SplashScreen.dart';
// import 'package:diversion/FutureAnalysis.dart';
// import 'package:diversion/Technologies.dart';
// import 'package:diversion/WinningStrategies.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Project Ideation',
//       home: SplashScreen(),

//       routes: {
//     '/Technologies Information': (context) => Technologies(),
//     '/API Endpoints Information': (context) => ApiEndpoints(),
//     '/Setup Details Information': (context) => SetupDetails(),
//     '/Winning Strategies Information': (context) => WinningStrategies(),
//   },

//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController promptController = TextEditingController();

//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alt Explorer'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Alt Explorer',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 PromptInputPlaceholder(promptController: promptController),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Check if the prompt is empty
//                     if (promptController.text.isEmpty) {
//                       // Show snackbar for required field
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('This is a required field.'),
//                         ),
//                       );
//                     } else {
//                       print('Button pressed 1'); 
//                       // Call the API and display response
//                       await _generateAnalysisResponse();

//                       print('Button pressed 2'); 

//                       // Redirect to FutureAnalysisPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FutureAnalysisPage()),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue.shade800,
//                     side: BorderSide(color: Colors.white, width: 2.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                     child: Text(
//                       'Generate Analysis',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _generateAnalysisResponse() async {
//     // Ensure the prompt is not empty
//     if (promptController.text.isEmpty) {
//       print('Please enter a project idea prompt.');
//       return;
//     }

//     // API endpoint for generating analysis (update with your actual endpoint)
//     final String apiUrl = 'http://192.168.29.73:3000/generate-analysis';

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'prompt': promptController.text}),
//       );

//       // Parse the response
//       final responseData = json.decode(response.body);

//       // Display the response in the console
//       // print('Analysis Result: ${responseData['analysis']}');
//       // print('Feedback: ${responseData['feedback']}');
//       // print('Reality Check: ${responseData['realityCheck']}');

//       print('Analysis Result: ${responseData['assistantMessage']}');

//       // You can also display the response on the screen if needed
//       // setState(() {
//       //   // Update UI with response
//       // });

//       print('Complete Response: $responseData');

//     } catch (error) {
//       print('Error generating analysis: $error');
//     }
//   }
// }

// class PromptInputPlaceholder extends StatefulWidget {
//   final TextEditingController promptController;

//   const PromptInputPlaceholder({Key? key, required this.promptController}) : super(key: key);

//   @override
//   State<PromptInputPlaceholder> createState() => _PromptInputPlaceholderState();
// }

// class _PromptInputPlaceholderState extends State<PromptInputPlaceholder> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: TextField(
//         controller: widget.promptController,
//         decoration: InputDecoration(
//           hintText: 'Enter your project idea prompt here...',
//           border: InputBorder.none,
//         ),
//         maxLines: 5,
//         textAlignVertical: TextAlignVertical.top,
//         style: TextStyle(color: Colors.black), // Adjust text color
//       ),
//     );
//   }
// }




import 'dart:convert';
import 'package:diversion/FutureAnalysis.dart';
import 'package:diversion/SplashScreen.dart';
import 'package:diversion/api_key.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<void> main() async {
  await dotenv.load();
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

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController promptController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alt Explorer'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Alt Explorer',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 PromptInputPlaceholder(promptController: promptController),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Check if the prompt is empty
//                     if (promptController.text.isEmpty) {
//                       // Show snackbar for required field
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('This is a required field.'),
//                         ),
//                       );
//                     } else {
//                       print('Button pressed 1'); 
//                       // Call the API and display response
//                       await _generateAnalysisResponse();

//                       print('Button pressed 2'); 
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue.shade800,
//                     side: BorderSide(color: Colors.white, width: 2.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                     child: Text(
//                       'Generate Analysis',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _generateAnalysisResponse() async {
//     // Ensure the prompt is not empty
//     if (promptController.text.isEmpty) {
//       print('Please enter a project idea prompt.');
//       return;
//     }

//     // API endpoint for generating analysis (update with your actual endpoint)
//     final String apiUrl = 'http://192.168.29.73:3001/generate-analysis';

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'prompt': promptController.text}),
//       );

//       // Parse the response
//       final responseData = json.decode(response.body);

//       // Display the response in the console
//       print('Analysis Result: ${responseData['assistantMessage']}');

//       // You can also display the response on the screen if needed
//       // For example, show the result in a SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Analysis Result: ${responseData['assistantMessage']}'),
//         ),
//       );

//       print('Complete Response: $responseData');
//     } catch (error) {
//       print('Error generating analysis: $error');
//     }
//   }
// }

// class PromptInputPlaceholder extends StatefulWidget {
//   final TextEditingController promptController;

//   const PromptInputPlaceholder({Key? key, required this.promptController}) : super(key: key);

//   @override
//   State<PromptInputPlaceholder> createState() => _PromptInputPlaceholderState();
// }

// class _PromptInputPlaceholderState extends State<PromptInputPlaceholder> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: TextField(
//         controller: widget.promptController,
//         decoration: InputDecoration(
//           hintText: 'Enter your project idea prompt here...',
//           border: InputBorder.none,
//         ),
//         maxLines: 5,
//         textAlignVertical: TextAlignVertical.top,
//         style: TextStyle(color: Colors.black), // Adjust text color
//       ),
//     );
//   }
// }

// class ResponseModel {
//   late final List<Map<String, dynamic>> choices;

//   ResponseModel({required this.choices});

//   factory ResponseModel.fromJson(Map<String, dynamic> json) {
//     return ResponseModel(choices: List<Map<String, dynamic>>.from(json['choices']));
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   late final TextEditingController promptController;
//   String responseTxt = '';
//   late ResponseModel _responseModel;

//   @override
//   void initState() {
//     promptController = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     promptController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff343541),
//       appBar: AppBar(
//         title: const Text('Alt Explorer'),
//         backgroundColor: const Color(0xff343541),
//       ),
//       body: Column(
//         children: [
//           PromptBldr(responseTxt: responseTxt),
//           TextFormFieldBldr(promptController: promptController, btnFun: completionFun),
//         ]
//         ),
//     );
//   }

//   completionFun() async {
//     setState(() {
//       responseTxt = 'Loading...';
//     });

//     final response = await http.post(
//       Uri.parse('https://api.openai.com/v1/engines/gpt-3.5-turbo/completions'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer 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'
//       },
//       body: jsonEncode(
//         {
//           'model': "gpt-3.5-turbo",
//           'prompt': promptController.text,
//           'max_tokens': 250,
//           'temperature': 0,
//           'top_p': 1,
//         },
//       ),
//     );

//     setState(() {
//       _responseModel = ResponseModel.fromJson(jsonDecode(response.body));
//       responseTxt = _responseModel.choices[0]['text'];
//       debugPrint(responseTxt);
//     });

//   }

// }

// class PromptBldr extends StatelessWidget {
//   const PromptBldr({super.key, required this.responseTxt});

//   final String responseTxt;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Text(
//             responseTxt,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TextFormFieldBldr extends StatelessWidget {
//   const TextFormFieldBldr(
//     {super.key, required this.promptController, required this.btnFun});

//   final TextEditingController promptController;
//   final Function btnFun;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Flexible(
//               child: TextFormField(
//                 cursorColor: Colors.white,
//                 controller: promptController,
//                 autofocus: true,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your project idea prompt here...',
//                   hintStyle: TextStyle(color: Colors.white),
//                   border: InputBorder.none,
//                 ),
//               )
//             ),
//             Container(
//               color:  Colors.green,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: IconButton(
//                   onPressed: () => btnFun(),
//                   icon: const Icon(Icons.send),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Message> _messages = [];

//   final TextEditingController _textEditingController = TextEditingController();

//   void onSendMessage() async {
//     Message message = Message(text: _textEditingController.text, isMe: true);

//     _textEditingController.clear();

//     setState(() {
//       _messages.insert(0, message);
//     });

//     String response = await sendMessageToChatGpt(message.text);

//     Message chatGpt = Message(text: response, isMe: false);

//     setState(() {
//       _messages.insert(0, chatGpt);
//     });
//   }

//   Future<String> sendMessageToChatGpt(String message) async {
//     Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

//     Map<String, dynamic> body = {
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {"role": "user", "content": message}
//       ],
//       "max_tokens": 27,
//     };

//     final response = await http.post(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer ${APIKey.apiKey}",
//       },
//       body: json.encode(body),
//     );

//     print(response.body);

//     Map<String, dynamic> parsedReponse = json.decode(response.body);

//     String reply = parsedReponse['choices'][0]['message']['content'];

//     return reply;
//   }

//   Widget _buildMessage(Message message) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Column(
//           crossAxisAlignment:
//               message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               message.isMe ? 'You' : 'GPT',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(message.text),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alt Explorer'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return _buildMessage(_messages[index]);
//               },
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10.0),
//                       hintText: 'Type a message...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: onSendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final bool isMe;

//   Message({required this.text, required this.isMe});
// }


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Message> _messages = [];
//   final TextEditingController _textEditingController = TextEditingController();

//   void onSendMessage() async {
//     Message userMessage = Message(text: _textEditingController.text, isMe: true);
//     _textEditingController.clear();

//     setState(() {
//       _messages.insert(0, userMessage);
//     });

//     String response = await sendMessageToChatGpt(userMessage.text);

//     Message chatGpt = Message(text: response, isMe: false);

//     setState(() {
//       _messages.insert(0, chatGpt);
//     });
//   }

//   Future<String> sendMessageToChatGpt(String message) async {
//     Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

//     Map<String, dynamic> body = {
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {"role": "user", "content": message}
//       ],
//       "max_tokens": 27,
//     };

//     final response = await http.post(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer ${APIKey.apiKey}",
//       },
//       body: json.encode(body),
//     );

//     Map<String, dynamic> parsedReponse = json.decode(response.body);

//     String reply = parsedReponse['choices'][0]['message']['content'];

//     return reply;
//   }

//   Widget _buildMessage(Message message) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Column(
//           crossAxisAlignment:
//               message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               message.isMe ? 'You' : 'GPT',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(message.text),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alt Explorer'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return _buildMessage(_messages[index]);
//               },
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: _textEditingController,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(10.0),
//                         hintText: 'Enter your project idea prompt here...',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: onSendMessage,
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue.shade800,
//                       side: BorderSide(color: Colors.white, width: 2.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       child: Text(
//                         'Generate',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final bool isMe;

//   Message({required this.text, required this.isMe});
// }



// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Message> _messages = [];
//   final TextEditingController _textEditingController = TextEditingController();
//   bool generatedResponse = false;

//   void onSendMessage() async {
//     Message userMessage = Message(
//       text: _textEditingController.text,
//       isMe: true,
//     );
//     _textEditingController.clear();

//     setState(() {
//       _messages.insert(0, userMessage);
//     });

//     String response = await sendMessageToChatGpt(userMessage.text);

//     Message chatGpt = Message(text: response, isMe: false);

//     setState(() {
//       _messages.insert(0, chatGpt);
//       generatedResponse = true;
//     });
//   }

//   Future<String> sendMessageToChatGpt(String message) async {
//     Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

//     Map<String, dynamic> body = {
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {"role": "user", "content": message}
//       ],
//       "max_tokens": 27,
//     };

//     final response = await http.post(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer ${APIKey.apiKey}",
//       },
//       body: json.encode(body),
//     );

//     Map<String, dynamic> parsedResponse = json.decode(response.body);

//     String reply = parsedResponse['choices'][0]['message']['content'];

//     return reply;
//   }

//   void onProceed() {
//     if (generatedResponse) {
//       // Navigate to the future analysis page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => FutureAnalysisPage()),
//       );
//     }
//   }

//   Widget _buildMessage(Message message) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Column(
//           crossAxisAlignment:
//               message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               message.isMe ? 'You' : 'GPT',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(message.text),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alt Explorer'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return _buildMessage(_messages[index]);
//               },
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: _textEditingController,
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(10.0),
//                         hintText: 'Enter your project idea prompt here...',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: generatedResponse ? onProceed : onSendMessage,
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.blue.shade800,
//                       side: BorderSide(color: Colors.white, width: 2.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       child: Text(
//                         generatedResponse ? 'Proceed' : 'Generate',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final bool isMe;

//   Message({required this.text, required this.isMe});
// }



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Message> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();
  bool generatedResponse = false;
  String responseFromGPT = '';

  void onSendMessage() async {
    Message userMessage = Message(
      text: _textEditingController.text,
      isMe: true,
    );
    _textEditingController.clear();

    setState(() {
      _messages.insert(0, userMessage);
    });

    String response = await sendMessageToChatGpt(userMessage.text);

    Message chatGpt = Message(text: response, isMe: false);

    setState(() {
      _messages.insert(0, chatGpt);
      generatedResponse = true;
      responseFromGPT = response;
    });
  }

    Future<String> sendMessageToChatGpt(String userMessage) async {
    String backgroundPrompt = "See you will be a model that will give answers to only a prompt when it is regarding any particular project idea which the user wants to build, assist that user with this product idea in terms of competition, market analysis, revenue model, guidance, enhancing opportunities and anything in relevance to the particular project else say \"I don't know the thing what you are asking for, but would surely love to learn about it\". also provide details about the technologies that the user might require for building the particular project idea also analyze the project idea on the basis of its potential, also supply the user with the proper API endpoints that he might require for building the project if it is not related to software then don't provide these details and respond accordingly, also let them know about the strategies to make their idea stand out in the market among their competitors, also if possible try to provide graphical analysis for the market potential and competitors portion in pie chart , bar graphs and x-y graphical representation. But the first line that should be displayed on generating the prompt should always contain an encouraging statement also stating about the competitive market but we are here to help you proceed. Remember not to answer any thing apart from proect idea related things. Don't answer any coding question, nothing irrevent to project ideas, or startups, if that is the case I am going to behave harshly with you";

    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": backgroundPrompt},
        {"role": "user", "content": userMessage}
      ],
      "max_tokens": 50,
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${APIKey.apiKey}",
      },
      body: json.encode(body),
    );

    Map<String, dynamic> parsedResponse = json.decode(response.body);

    String reply = parsedResponse['choices'][0]['message']['content'];

    return reply;
  }

  void onProceed() {
    if (generatedResponse) {
      // Navigate to the future analysis page and pass the response
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FutureAnalysisPage(response: responseFromGPT),
        ),
      );
    }
  }

  Widget _buildMessage(Message message) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.yellow],
          ),
        ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment:
              message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.isMe ? 'You' : 'Alt Explorer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(message.text),
          ],
        ),
      ),
    );
  }

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
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMessage(_messages[index]);
                },
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Enter your project idea prompt here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: generatedResponse ? onProceed : onSendMessage,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        side: BorderSide(color: Colors.white, width: 2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          generatedResponse ? 'Proceed' : 'Generate',
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
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
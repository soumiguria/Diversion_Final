import 'package:diversion/components/fetchRevenueModel.dart';
import 'package:flutter/material.dart';
import 'package:diversion/components/provider.dart';
import 'package:provider/provider.dart';

class RevenueModelPage extends StatefulWidget {
  const RevenueModelPage({Key? key}) : super(key: key);

  @override
  _RevenueModelPageState createState() => _RevenueModelPageState();
}

class _RevenueModelPageState extends State<RevenueModelPage> {
  late Future<String> futureRevenueModel;

  @override
  void initState() {
    super.initState();

    // Retrieve the user prompt from the ChatProvider
    String userPrompt = Provider.of<ChatProvider>(context, listen: false).userPrompt;

    futureRevenueModel = fetchRevenueModel(userPrompt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Row(
    children: <Widget>[
      // Wrap the Image.asset with CircleAvatar to make it circular
      CircleAvatar(
        radius: 15,  // Adjust the radius to set the size of the circular avatar
        backgroundColor: Colors.transparent,  // Set background color to transparent
        child: ClipOval(
          child: Image.asset(
            'assets/images/splash_screen.jpeg',  // Replace with the actual path to your image
            height: 30,  // Adjust the height as needed
            width: 30,   // Adjust the width as needed
          ),
        ),
      ),
      
      // Add some space between the logo and title
      SizedBox(width: 10),

      // Add the title text
      Text('Alt Explorer'),
    ],
  ),
  backgroundColor: Colors.blue.shade300,
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
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
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

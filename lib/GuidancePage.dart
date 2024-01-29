import 'package:flutter/material.dart';

class GuidancePage extends StatelessWidget {
  const GuidancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidance Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.blue], // Set your desired gradient colors
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildClickableContainer(
                'Technologies',
                'Explore the technologies that can be used for building the project.',
                'assets/images/technologies.jpg',
                () => _navigateToInformation(context, 'Technologies Information'),
              ),
              SizedBox(height: 16.0), // Add spacing between the containers
              _buildClickableContainer(
                'API Endpoints',
                'Discover necessary API endpoints to refer to for building the project.',
                'assets/images/api-endpoints.jpg',
                () => _navigateToInformation(context, 'API Endpoints Information'),
              ),
              SizedBox(height: 16.0), // Add spacing between the containers
              _buildClickableContainer(
                'Setup Details',
                'Learn how to get started with setting up the application.',
                'assets/images/setup_details.jpg',
                () => _navigateToInformation(context, 'Setup Details Information'),
              ),
              SizedBox(height: 16.0), // Add spacing between the containers
              _buildClickableContainer(
                'Winning Strategies',
                'Strategies for making the idea stand out in the market and its unique selling points.',
                'assets/images/winning_strategies.png',
                () => _navigateToInformation(context, 'Winning Strategies Information'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableContainer(String title, String description, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Cover the whole width
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, // Set white background color
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 200, // Set the desired height
              width: double.infinity,
              fit: BoxFit.cover, // Make the image cover the whole container
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToInformation(BuildContext context, String information) {
    // In a real application, you would navigate to the corresponding information screen.
    // For simplicity, this example just prints the information to the console.
    print('Navigating to $information');
  }
}
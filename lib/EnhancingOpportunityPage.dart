import 'package:flutter/material.dart';

class EnhancingOpportunityPage extends StatelessWidget {
  const EnhancingOpportunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enhancing Opportunities'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color.fromARGB(255, 214, 116, 231), Color.fromARGB(255, 230, 230, 142)], // Set your gradient colors
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enhancing Opportunities',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              _buildEnhancementItem(
                'User Experience Improvement',
                'Enhance the overall user interface for a smoother and more intuitive experience.',
              ),
              _buildEnhancementItem(
                'Feature Expansion',
                'Introduce new features that add value and functionality to the application.',
              ),
              _buildEnhancementItem(
                'Performance Optimization',
                "Optimize the app's performance to ensure faster response times and better efficiency.",
              ),
              _buildEnhancementItem(
                'Integration with Emerging Technologies',
                'Explore opportunities to integrate emerging technologies like AI or AR for enhanced features.',
              ),
              // Add more enhancement opportunities as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancementItem(String title, String description) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
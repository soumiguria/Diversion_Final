import 'package:flutter/material.dart';

class RevenueModelPage extends StatelessWidget {
  const RevenueModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revenue Model'),
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
                'Revenue Streams',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              _buildRevenueStream('Subscription', 'Monthly subscription fee'),
              _buildRevenueStream('Advertising', 'Revenue from ads displayed'),
              _buildRevenueStream('In-App Purchases', 'Revenue from in-app purchases'),
              _buildRevenueStream('Affiliate Marketing', 'Commission from affiliate marketing'),
              // Add more revenue streams as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRevenueStream(String title, String description) {
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

import 'package:diversion/CompetitorsPage.dart';
import 'package:diversion/EnhancingOpportunityPage.dart';
import 'package:diversion/GuidancePage.dart';
import 'package:diversion/RevenuePage.dart';
import 'package:diversion/MarketTrendsPage.dart';
import 'package:flutter/material.dart';

class FutureAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alt Explorer'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
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
                      child: Text("Ahh!!! your idea sounds great... let's see if we can make any improvements based on the following things...",
                        style: TextStyle(color: Colors.white, fontSize: 16,),
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
                        imageAsset: 'assets/images/market_potential_image.jpeg', // Replace with your image asset
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MarketTrendsPage()),
                          );
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
                            MaterialPageRoute(builder: (context) => MarketPotentialPage()),
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


// Define other pages (CompetitorsPage, MarketTrendsPage, etc.) similar to FutureAnalysisPage
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CompetitorsPage extends StatelessWidget {
  const CompetitorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Competitors Page'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: [Colors.blue, Colors.green], // You can change these colors
              colors: [const Color.fromARGB(255, 214, 116, 231), Color.fromARGB(255, 230, 230, 142)]
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Competitors',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 16.0),
                _buildCompanyList(),
                SizedBox(height: 24.0),
                Text(
                  'Market Share Distribution',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 16.0),
                Builder(
                  builder: (context) => _buildMarketShareChart(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCompanyItem('Company A', '25%'),
        _buildCompanyItem('Company B', '20%'),
        _buildCompanyItem('Company C', '15%'),
        _buildCompanyItem('Company D', '10%'),
        _buildCompanyItem('Company E', '20%'),
        _buildCompanyItem('Company F', '15%'),
        // Add more companies as needed
      ],
    );
  }

  Widget _buildCompanyItem(String companyName, String marketShare) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(companyName, style: TextStyle(fontSize: 18.0, color: Colors.white)),
          Text('Market Share: $marketShare', style: TextStyle(fontSize: 16.0, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildMarketShareChart(BuildContext context) {
    return PieChart(
      dataMap: {
        'Company A': 25,
        'Company B': 20,
        'Company C': 15,
        'Company D': 10,
        'Company E': 20,
        'Company F': 15,
        // Add more companies as needed
      },
      colorList: [
        Colors.purple,
        Colors.pink,
        Colors.orange,
        Colors.red,
        Colors.yellow,
        Colors.indigo
        // Add more colors as needed
      ],
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      chartType: ChartType.ring,
      // showChartValues: true,
      // chartValuesColor: Colors.white,
      // decimalPlaces: 1, // Specify the number of decimal places for percentage values
    );
  }
}
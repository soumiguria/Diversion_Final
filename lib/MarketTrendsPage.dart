import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MarketTrendsPage extends StatelessWidget {
  const MarketTrendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Trends and Potential'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple], // Set your gradient colors
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Market Trends',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _buildTrendsList(),
              SizedBox(height: 24.0),
              Text(
                'Market Potential',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _buildPotentialChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTrendItem('Trend 1', 'Description of Trend 1'),
        _buildTrendItem('Trend 2', 'Description of Trend 2'),
        _buildTrendItem('Trend 3', 'Description of Trend 3'),
        _buildTrendItem('Trend 4', 'Description of Trend 4'),
        // Add more trends as needed
      ],
    );
  }

  Widget _buildTrendItem(String trendTitle, String trendDescription) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trendTitle,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(trendDescription, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }

  Widget _buildPotentialChart() {
    // Example data for the bar chart
    var data = [
      SalesData('Product A', 50),
      SalesData('Product B', 80),
      SalesData('Product C', 30),
      SalesData('Product D', 100),
    ];

    var series = [
      charts.Series(
        id: 'Sales',
        data: data,
        domainFn: (SalesData sales, _) => sales.product,
        measureFn: (SalesData sales, _) => sales.sales,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (SalesData sales, _) => '${sales.product}: ${sales.sales}',
      ),
    ];

    return Container(
      height: 300,
      child: charts.BarChart(
        series,
        animate: true,
        barRendererDecorator: charts.BarLabelDecorator<String>(),
        domainAxis: charts.OrdinalAxisSpec(),
      ),
    );
  }
}

class SalesData {
  final String product;
  final int sales;

  SalesData(this.product, this.sales);
}

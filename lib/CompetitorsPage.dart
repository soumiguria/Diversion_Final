// // import 'package:diversion/components/fetchCompetitors.dart';
// // import 'package:diversion/components/provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pie_chart/pie_chart.dart';
// // import 'package:provider/provider.dart';

// // class CompetitorsPage extends StatelessWidget {
// //   const CompetitorsPage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {

// //      String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Competitors Page'),
// //         ),
// //         body: 
        
// //   //       Container(
// //   //         decoration: BoxDecoration(
// //   //           gradient: LinearGradient(
// //   //             begin: Alignment.topCenter,
// //   //             end: Alignment.bottomCenter,
// //   //             // colors: [Colors.blue, Colors.green], // You can change these colors
// //   //             colors: [const Color.fromARGB(255, 214, 116, 231), Color.fromARGB(255, 230, 230, 142)]
// //   //           ),
// //   //         ),
// //   //         child: Padding(
// //   //           padding: const EdgeInsets.all(16.0),
// //   //           child: Column(
// //   //             crossAxisAlignment: CrossAxisAlignment.start,
// //   //             children: [
// //   //               Text(
// //   //                 'Top Competitors',
// //   //                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
// //   //               ),
// //   //               SizedBox(height: 16.0),
// //   //               _buildCompanyList(),
// //   //               SizedBox(height: 24.0),
// //   //               Text(
// //   //                 'Market Share Distribution',
// //   //                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
// //   //               ),
// //   //               SizedBox(height: 16.0),
// //   //               Builder(
// //   //                 builder: (context) => _buildMarketShareChart(context),
// //   //               ),
// //   //             ],
// //   //           ),
// //   //         ),
// //   //       ),
// //   //     ),
// //   //   );
// //   // }

// //   // Widget _buildCompanyList() {
// //   //   return Column(
// //   //     crossAxisAlignment: CrossAxisAlignment.start,
// //   //     children: [
// //   //       _buildCompanyItem('Company A', '25%'),
// //   //       _buildCompanyItem('Company B', '20%'),
// //   //       _buildCompanyItem('Company C', '15%'),
// //   //       _buildCompanyItem('Company D', '10%'),
// //   //       _buildCompanyItem('Company E', '20%'),
// //   //       _buildCompanyItem('Company F', '15%'),
// //   //       // Add more companies as needed
// //   //     ],
// //   //   );
// //   // }
        
// //         FutureBuilder<List<String>>(
// //         future: fetchCompetitors(userPrompt),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             // Display a loading indicator while fetching data
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             // Display an error message if fetching data fails
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //             // Display a message if no competitors are found
// //             return Center(child: Text('No competitors found.'));
// //           } else {
// //             // Display the fetched competitors and additional response
// //             List<String> results = snapshot.data!;
// //             return _buildResultsList(results);
// //           }
// //         },
// //       ),
// //     ),);
// //   }

// //   Widget _buildResultsList(List<String> results) {
// //     return ListView.builder(
// //       itemCount: results.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(results[index]),
// //           // You can add more information or actions related to the results
// //         );
// //       },
// //     );
// //   }
// // }
// //   Widget _buildCompanyItem(String companyName, String marketShare) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(companyName, style: TextStyle(fontSize: 18.0, color: Colors.white)),
// //           Text('Market Share: $marketShare', style: TextStyle(fontSize: 16.0, color: Colors.white)),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMarketShareChart(BuildContext context) {
// //     return PieChart(
// //       dataMap: {
// //         'Company A': 25,
// //         'Company B': 20,
// //         'Company C': 15,
// //         'Company D': 10,
// //         'Company E': 20,
// //         'Company F': 15,
// //         // Add more companies as needed
// //       },
// //       colorList: [
// //         Colors.purple,
// //         Colors.pink,
// //         Colors.orange,
// //         Colors.red,
// //         Colors.yellow,
// //         Colors.indigo
// //         // Add more colors as needed
// //       ],
// //       chartRadius: MediaQuery.of(context).size.width / 3.2,
// //       chartType: ChartType.ring,
// //       // showChartValues: true,
// //       // chartValuesColor: Colors.white,
// //       // decimalPlaces: 1, // Specify the number of decimal places for percentage values
// //     );
// //   }



// // import 'package:diversion/components/fetchCompetitors.dart';
// // import 'package:diversion/components/provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pie_chart/pie_chart.dart';
// // import 'package:provider/provider.dart';

// // class CompetitorsPage extends StatelessWidget {
// //   const CompetitorsPage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Competitors Page'),
// //         ),
// //         body: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               begin: Alignment.topCenter,
// //               end: Alignment.bottomCenter,
// //               colors: [
// //                 const Color.fromARGB(255, 214, 116, 231),
// //                 Color.fromARGB(255, 230, 230, 142)
// //               ],
// //             ),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Top Competitors',
// //                   style: TextStyle(
// //                     fontSize: 24.0,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 SizedBox(height: 16.0),
// //                 _buildCompanyList(),
// //                 SizedBox(height: 24.0),
// //                 Text(
// //                   'Market Share Distribution',
// //                   style: TextStyle(
// //                     fontSize: 24.0,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 SizedBox(height: 16.0),
// //                 Builder(
// //                   builder: (context) => _buildMarketShareChart(context),
// //                 ),
// //                 SizedBox(height: 16.0),
// //                 FutureBuilder<List<String>>(
// //                   future: fetchCompetitors(userPrompt),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.connectionState == ConnectionState.waiting) {
// //                       // Display a loading indicator while fetching data
// //                       print('Loading competitors...');
// //                       return Center(child: CircularProgressIndicator());
// //                     } else if (snapshot.hasError) {
// //                       // Display an error message if fetching data fails
// //                       print('Error: ${snapshot.error}');
// //                       return Center(child: Text('Error: ${snapshot.error}'));
// //                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                       // Display a message if no competitors are found
// //                       print('No competitors found.');
// //                       return Center(child: Text('No competitors found.'));
// //                     } else {
// //                       // Display the fetched competitors and additional response
// //                       List<String> results = snapshot.data!;
// //                       print('Results: $results');
// //                       return _buildResultsList(results);
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCompanyList() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         _buildCompanyItem('Company A', '25%'),
// //         _buildCompanyItem('Company B', '20%'),
// //         _buildCompanyItem('Company C', '15%'),
// //         _buildCompanyItem('Company D', '10%'),
// //         _buildCompanyItem('Company E', '20%'),
// //         _buildCompanyItem('Company F', '15%'),
// //         // Add more companies as needed
// //       ],
// //     );
// //   }

// //   Widget _buildResultsList(List<String> results) {
// //     return ListView.builder(
// //       itemCount: results.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(results[index]),
// //           // You can add more information or actions related to the results
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildCompanyItem(String companyName, String marketShare) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(companyName, style: TextStyle(fontSize: 18.0, color: Colors.white)),
// //           Text('Market Share: $marketShare', style: TextStyle(fontSize: 16.0, color: Colors.white)),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMarketShareChart(BuildContext context) {
// //     return PieChart(
// //       dataMap: {
// //         'Company A': 25,
// //         'Company B': 20,
// //         'Company C': 15,
// //         'Company D': 10,
// //         'Company E': 20,
// //         'Company F': 15,
// //         // Add more companies as needed
// //       },
// //       colorList: [
// //         Colors.purple,
// //         Colors.pink,
// //         Colors.orange,
// //         Colors.red,
// //         Colors.yellow,
// //         Colors.indigo
// //         // Add more colors as needed
// //       ],
// //       chartRadius: MediaQuery.of(context).size.width / 3.2,
// //       chartType: ChartType.ring,
// //       // showChartValues: true,
// //       // chartValuesColor: Colors.white,
// //       // decimalPlaces: 1, // Specify the number of decimal places for percentage values
// //     );
// //   }
// // }



// import 'package:diversion/components/fetchCompetitors.dart';
// import 'package:diversion/components/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:provider/provider.dart';

// class CompetitorsPage extends StatelessWidget {
//   const CompetitorsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Competitors Page'),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 const Color.fromARGB(255, 214, 116, 231),
//                 Color.fromARGB(255, 230, 230, 142)
//               ],
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Top Competitors',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 // _buildCompanyList(),

//                 FutureBuilder<List<String>>(
//                   future: fetchCompetitors('If there is any similar product or applications existing in the market that supports the same functionality then give me the names of the top 5 of such companies', userPrompt),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       // Display a loading indicator while fetching data
//                       print('Loading competitors...');
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       // Display an error message if fetching data fails
//                       print('Error: ${snapshot.error}');
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       // Display a message if no competitors are found
//                       print('No competitors found.');
//                       return Center(child: Text('No competitors found.'));
//                     } else {
//                       // Display the fetched competitors and additional response
//                       List<String> results = snapshot.data!;
//                       print('Results: $results');
//                       return Expanded(child: _buildResultsList(results));
//                     }
//                   },
//                 ),

//                 SizedBox(height: 24.0),
//                 Text(
//                   'Market Share Distribution',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Builder(
//                   builder: (context) => _buildMarketShareChart(context),
//                 ),
//                 SizedBox(height: 16.0),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCompanyList() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildCompanyItem('Company A', '25%'),
//         _buildCompanyItem('Company B', '20%'),
//         _buildCompanyItem('Company C', '15%'),
//         _buildCompanyItem('Company D', '10%'),
//         _buildCompanyItem('Company E', '20%'),
//         // Add more companies as needed
//       ],
//     );
//   }

//   Widget _buildResultsList(List<String> results) {
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(results[index]),
//           // You can add more information or actions related to the results
//         );
//       },
//     );
//   }

//   Widget _buildCompanyItem(String companyName, String marketShare) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(companyName, style: TextStyle(fontSize: 18.0, color: Colors.white)),
//           Text('Market Share: $marketShare', style: TextStyle(fontSize: 16.0, color: Colors.white)),
//         ],
//       ),
//     );
//   }

//   Widget _buildMarketShareChart(BuildContext context) {
//     return PieChart(
//       dataMap: {
//         'Company A': 25,
//         'Company B': 20,
//         'Company C': 15,
//         'Company D': 10,
//         'Company E': 20,
//         // Add more companies as needed
//       },
//       colorList: [
//         Colors.purple,
//         Colors.pink,
//         Colors.orange,
//         Colors.red,
//         Colors.yellow,
//         Colors.indigo
//         // Add more colors as needed
//       ],
//       chartRadius: MediaQuery.of(context).size.width / 3.2,
//       chartType: ChartType.ring,
//       // showChartValues: true,
//       // chartValuesColor: Colors.white,
//       // decimalPlaces: 1, // Specify the number of decimal places for percentage values
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:diversion/components/provider.dart';
// import 'package:diversion/components/fetchCompetitors.dart';
// import 'package:provider/provider.dart';

// class CompetitorsPage extends StatelessWidget {
//   const CompetitorsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Competitors Page'),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 const Color.fromARGB(255, 214, 116, 231),
//                 Color.fromARGB(255, 230, 230, 142)
//               ],
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Top Competitors',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 FutureBuilder<List<String>>(
//                   future: fetchCompetitors('If there is any similar product or applications existing in the market that supports the same functionality then give me the names of the top 5 of such companies', userPrompt),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No competitors found.'));
//                     } else {
//                       List<String> results = snapshot.data!;
//                       return Column(
//                         children: [
//                           Expanded(child: _buildResultsList(results)),
//                           SizedBox(height: 24.0),
//                           Text(
//                             'Market Share Distribution',
//                             style: TextStyle(
//                               fontSize: 24.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(height: 16.0),
//                           _buildMarketShareChart(results),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildResultsList(List<String> results) {
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(results[index]),
//         );
//       },
//     );
//   }

//   Widget _buildMarketShareChart(List<String> competitors) {
//     Map<String, int> dataMap = {};
//     int totalShare = 100;
//     int sharePerCompetitor = totalShare ~/ competitors.length;

//     for (int i = 0; i < competitors.length; i++) {
//       dataMap[competitors[i]] = sharePerCompetitor;
//     }

//     return PieChart(
//       dataMap: dataMap,
//       colorList: [
//         Colors.purple,
//         Colors.pink,
//         Colors.orange,
//         Colors.red,
//         Colors.yellow,
//         Colors.indigo,
//       ],
//       chartRadius: 200,
//       chartType: ChartType.ring,
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:diversion/components/provider.dart';
import 'package:diversion/components/fetchCompetitors.dart';
import 'package:provider/provider.dart';

class CompetitorsPage extends StatelessWidget {
  const CompetitorsPage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Competitors Page'),
  //       ),
  //       body: Container(
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [
  //               const Color.fromARGB(255, 214, 116, 231),
  //               Color.fromARGB(255, 230, 230, 142)
  //             ],
  //           ),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Top Competitors',
  //                 style: TextStyle(
  //                   fontSize: 24.0,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               SizedBox(height: 16.0),
  //               FutureBuilder<List<String>>(
  //                 future: fetchCompetitors(
  //                     'If there is any similar product or applications existing in the market that supports the same functionality then give me the names of the top 5 of such companies',
  //                     userPrompt),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //                     return Center(child: CircularProgressIndicator());
  //                   } else if (snapshot.hasError) {
  //                     return Center(child: Text('Error: ${snapshot.error}'));
  //                   } else if (!snapshot.hasData ||
  //                       snapshot.data!.isEmpty) {
  //                     return Center(child: Text('No competitors found.'));
  //                   } else {
  //                     List<String> results = snapshot.data!;
  //                     return Column(
  //                       children: [
  //                         Expanded(child: _buildResultsList(results)),
  //                         SizedBox(height: 24.0),
  //                         Text(
  //                           'Market Share Distribution',
  //                           style: TextStyle(
  //                             fontSize: 24.0,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                         SizedBox(height: 16.0),
  //                         _buildMarketShareChart(results),
  //                       ],
  //                     );
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }


@override
  Widget build(BuildContext context) {
    String userPrompt = Provider.of<ChatProvider>(context).userPrompt;

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
              colors: [
                const Color.fromARGB(255, 214, 116, 231),
                Color.fromARGB(255, 230, 230, 142),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Competitors',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: FutureBuilder<List<String>>(
                    future: fetchCompetitors(
                      'If there is any similar product or applications existing in the market that supports the same functionality then give me the names of the top 5 of such companies. Just show me the names of the top 5 of such companies. No need to show the line like "The top 5 companies are". Just show me the names of the top 5 of such companies.',
                      userPrompt,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData ||
                          snapshot.data!.isEmpty) {
                        return Center(child: Text('No competitors found.'));
                      } else {
                        List<String> results = snapshot.data!;
                        return Column(
                          children: [
                            Expanded(child: _buildResultsList(results)),
                            SizedBox(height: 24.0),
                            Text(
                              'Market Share Distribution',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            _buildMarketShareChart(results),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // Widget _buildResultsList(List<String> results) {
  //   return ListView.builder(
  //     itemCount: results.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text(results[index]),
  //       );
  //     },
  //   );
  // }

    Widget _buildResultsList(List<String> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
        );
      },
    );
  }

//   Widget _buildMarketShareChart(List<String> competitors) {
//     Map<String, double> dataMap = {};
//     double totalShare = 100.0;
//     double sharePerCompetitor = totalShare / competitors.length;

//     for (int i = 0; i < competitors.length; i++) {
//       dataMap[competitors[i]] = sharePerCompetitor;
//     }

//     return PieChart(
//       dataMap: dataMap,
//       colorList: [
//         Colors.purple,
//         Colors.pink,
//         Colors.orange,
//         Colors.red,
//         Colors.yellow,
//         Colors.indigo,
//       ],
//       chartRadius: 200,
//       chartType: ChartType.ring,
//     );
//   }
// }


 Widget _buildMarketShareChart(List<String> competitors) {
    Map<String, double> dataMap = {};
    double totalShare = 100.0;
    double sharePerCompetitor = totalShare / competitors.length;

    for (int i = 0; i < competitors.length; i++) {
      dataMap[competitors[i]] = sharePerCompetitor;
    }

    return PieChart(
      dataMap: dataMap,
      colorList: [
        Colors.purple,
        Colors.pink,
        Colors.orange,
        Colors.red,
        Colors.yellow,
        Colors.indigo,
      ],
      chartRadius: 200,
      chartType: ChartType.ring,
    );
  }
}


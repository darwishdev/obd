import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<_SalesData> data = [
    _SalesData('Jan', 0),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  List<_PieData> pieData = [
    _PieData('Feb', 28),
    _PieData('Mar', 34),
    _PieData('Apr', 32),
    _PieData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          //Initialize the chart widget
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text("Your Car Satatistics"),
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: SfCircularChart(
                    title: ChartTitle(text: 'lorem ipsum'),
                    legend: Legend(isVisible: true),
                    series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                          explode: true,
                          explodeIndex: 0,
                          dataSource: pieData,
                          xValueMapper: (_PieData data, _) => data.xData,
                          yValueMapper: (_PieData data, _) => data.yData,
                          //  dataLabelMapper: (_PieData data, _) => data.text,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: true)),
                    ]),
              ),
              Expanded(
                  flex: 5,
                  child: SfCircularChart(
                      title: ChartTitle(text: 'dolar set'),
                      legend: Legend(isVisible: true),
                      series: <PieSeries<_PieData, String>>[
                        PieSeries<_PieData, String>(
                            explode: true,
                            explodeIndex: 0,
                            dataSource: pieData,
                            xValueMapper: (_PieData data, _) => data.xData,
                            yValueMapper: (_PieData data, _) => data.yData,
                            //  dataLabelMapper: (_PieData data, _) => data.text,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true)),
                      ])),
            ],
          ),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'lorem'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Speed',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     //Initialize the spark charts widget
          //     child: SfSparkLineChart.custom(
          //       //Enable the trackball
          //       trackball: SparkChartTrackball(
          //           activationMode: SparkChartActivationMode.tap),
          //       //Enable marker
          //       marker: SparkChartMarker(
          //           displayMode: SparkChartMarkerDisplayMode.all),
          //       //Enable data label
          //       labelDisplayMode: SparkChartLabelDisplayMode.all,
          //       xValueMapper: (int index) => data[index].year,
          //       yValueMapper: (int index) => data[index].sales,
          //       dataCount: 5,
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _PieData {
  _PieData(this.xData, this.yData);
  final String xData;
  final num yData;
}

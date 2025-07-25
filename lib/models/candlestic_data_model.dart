import 'package:fl_chart/fl_chart.dart';

class CandlestickDataModel {
  final int x;
  final double high;
  final double low;
  final double open;
  final double close;

  const CandlestickDataModel({
    required this.x,
    required this.high,
    required this.low,
    required this.open,
    required this.close,
  });

  CandlestickSpot toCandlestickSpot() {
    return CandlestickSpot(
      x: x.toDouble(),
      high: high,
      low: low,
      open: open,
      close: close,
    );
  }
}
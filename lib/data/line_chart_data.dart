import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

class WidgetLineChartData {
  /// Generates a list of random FlSpots with values under 99.99
  List<FlSpot> generateMonthlySpots({double maxY = 99.99}) {
    final rng = Random();
    final months = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110];

    return months.map((x) {
      final y = double.parse((rng.nextDouble() * maxY).toStringAsFixed(2));
      return FlSpot(x.toDouble(), y);
    }).toList();
  }

  List<FlSpot> generateSnappedSpots({int count = 50, double maxY = 99.99}) {
    final rng = Random();
    final ticks = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110];

    double snap(double value) {
      return ticks
          .reduce((a, b) => (value - a).abs() < (value - b).abs() ? a : b)
          .toDouble();
    }

    return List.generate(count, (_) {
      final x = snap(rng.nextDouble() * 110);
      final y = double.parse((rng.nextDouble() * maxY).toStringAsFixed(2));
      return FlSpot(x, y);
    });
  }

  List<FlSpot> normalizeSpots(List<FlSpot> original) {
    final maxX = original.map((e) => e.x).reduce(max);

    return original.map((spot) {
      final normalizedX = (spot.x / maxX) * 110; // stretch into 0–110
      return FlSpot(double.parse(normalizedX.toStringAsFixed(2)), spot.y);
    }).toList()..sort((a, b) => a.x.compareTo(b.x));
  }

  final leftTitle = {
    0: '0',
    10: '2K',
    20: '4K',
    30: '6K',
    40: '8K',
    50: '10k',
    60: '20k',
    70: '40k',
    80: '60k',
    100: '100k',
  };

  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    110: 'Dec',
  };
}

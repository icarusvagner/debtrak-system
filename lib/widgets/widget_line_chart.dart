import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/data/line_chart_data.dart';
import 'package:debtrak/widgets/widget_custom_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class WidgetLineChartCard extends StatelessWidget {
  const WidgetLineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = WidgetLineChartData();

    return WidgetCustomCard(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total monthly debts",
            style: GoogleFonts.outfit(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 20),

          AspectRatio(
            aspectRatio: 16 / 6,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(handleBuiltInTouches: true),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.bottomTitle[value.toInt()] != null
                            ? SideTitleWidget(
                                meta: meta,
                                child: Text(
                                  data.bottomTitle[value.toInt()].toString(),
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                      showTitles: true,
                      interval: 1,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.leftTitle[value.toInt()] != null
                            ? Text(
                                data.leftTitle[value.toInt()].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              )
                            : const SizedBox();
                      },
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: DebtrakPalette.blue.mid,
                    barWidth: 2.5,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          DebtrakPalette.emerald.mid.withValues(alpha: 0.5),
                          Colors.transparent,
                        ],
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(show: false),
                    spots: data.generateMonthlySpots(),
                  ),
                ],
                minX: 0,
                maxX: 120,
                minY: -5,
                maxY: 105,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

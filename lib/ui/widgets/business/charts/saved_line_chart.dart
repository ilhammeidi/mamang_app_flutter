import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

// ignore: must_be_immutable
class SavedLineChart extends StatelessWidget {
  const SavedLineChart({ super.key });

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
    );

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Text(
        value.toString(),
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  LineTouchData get lineTouchData => LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => ThemePalette.primaryDark,
        getTooltipItems: (List<LineBarSpot> touchedSpots) {
          return touchedSpots.map((LineBarSpot touchedSpot) {
            return LineTooltipItem(
              touchedSpot.y.toString(),
              const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            );
          }).toList();
        },
      ),
      getTouchedSpotIndicator: (_, indicators) {
        return indicators
          .map((int index) => const TouchedSpotIndicatorData(
                FlLine(color: Colors.transparent),
                FlDotData(show: false),
              ))
          .toList();
      },
      touchSpotThreshold: 12,
      distanceCalculator:
        (Offset touchPoint, Offset spotPixelCoordinates) =>
          (touchPoint - spotPixelCoordinates).distance,
  );

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            showingTooltipIndicators: [],
            lineTouchData: lineTouchData,
            lineBarsData: [
              LineChartBarData(
                color: ThemePalette.primaryMain,
                spots: const [
                  FlSpot(0, 1),
                  FlSpot(1, 13),
                  FlSpot(2, 12),
                  FlSpot(3, 5),
                  FlSpot(4, 8),
                  FlSpot(5, 4),
                  FlSpot(6, 9),
                ],
                isCurved: true,
                isStrokeCapRound: true,
                barWidth: 5,
                belowBarData: BarAreaData(
                  show: false,
                ),
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 5,
                      color: ThemePalette.primaryMain,
                      strokeColor: ThemePalette.primaryLight.withOpacity(0.75),
                      strokeWidth: 4,
                    );
                  },
                ),
              ),
            ],
            minY: 0,
            maxY: 15,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 38,
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
            ),
            gridData: const FlGridData(
              show: true,
              drawVerticalLine: true,
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                left: BorderSide(color: colorScheme.outline),
                bottom: BorderSide(color: colorScheme.outline),
                top: const BorderSide(color: Colors.transparent),
                right: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
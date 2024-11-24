import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class ViewBarChart extends StatelessWidget {
  const ViewBarChart({super.key});

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: [],
      barRods: [
        BarChartRodData(
          color: ThemePalette.secondaryMain,
          toY: y.toDouble()
        ),
      ],
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
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

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: AspectRatio(
          aspectRatio: 2,
          child: BarChart(
            BarChartData(
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: leftTitles,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                border: Border(
                  bottom: BorderSide(color: colorScheme.outline),
                  left: BorderSide(color: colorScheme.outline),
                )
              ),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: colorScheme.outlineVariant,
                  strokeWidth: 1,
                  dashArray: [5, 6]
                ),
                drawVerticalLine: false,
              ),
              barGroups: [
                generateGroupData(0, 10),
                generateGroupData(1, 3),
                generateGroupData(2, 18),
                generateGroupData(3, 4),
                generateGroupData(4, 11),
                generateGroupData(5, 18),
                generateGroupData(6, 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
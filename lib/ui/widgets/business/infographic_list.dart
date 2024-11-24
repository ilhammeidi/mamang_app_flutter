import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/stats_card.dart';

class InfographicList extends StatelessWidget {
  const InfographicList({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    const double cardWidth = 320;
    
    return SizedBox(
      height: height,
      child: ListView(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/business-report');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: spacingUnit(2), 
                right: spacingUnit(1), 
                top: spacingUnit(1),
                bottom: spacingUnit(1)
              ),
              width: cardWidth,
              child: StatsCard(
                background: colorScheme.primaryContainer,
                foreground: colorScheme.onPrimaryContainer,
                bigText: 'Medium',
                title: 'Business Strength',
                infoGraphic: SizedBox(
                  width: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: 0.7,
                          strokeWidth: 15.0,
                          backgroundColor: ThemePalette.primaryMain.withOpacity(0.5),
                          valueColor: AlwaysStoppedAnimation<Color>(ThemePalette.primaryMain),
                        ),
                      ),
                      Text('70%', style: ThemeText.subtitle.copyWith(color: colorScheme.onPrimaryContainer))
                    ],
                  )
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/business-analytics');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: spacingUnit(1)),
              width: cardWidth,
              child: StatsCard(
                background: colorScheme.secondaryContainer,
                foreground: colorScheme.onSecondaryContainer,
                bigText: '112',
                title: 'Engagement',
                infoGraphic: SizedBox(
                  width: 160,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: SimpleBarChart(color: ThemePalette.secondaryMain,),
                  ),
                )
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/business');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: spacingUnit(1), 
                right: spacingUnit(2), 
                top: spacingUnit(1),
                bottom: spacingUnit(1)
              ),
              width: cardWidth,
              child: StatsCard(
                background: colorScheme.tertiaryContainer,
                foreground: colorScheme.onTertiaryContainer,
                bigText: '12',
                title: 'Total Campaigns',
                infoGraphic: Icon(Icons.campaign, color: ThemePalette.tertiaryMain, size: 120)
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  const SimpleBarChart({super.key, required this.color});

  final Color color;

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          color: color,
          width: 10,
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              'Last 7 days',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey
              ),
            ),
          ),
        ),
        gridData: const FlGridData(
          show: false, // Hide grid lines
        ),
        borderData: FlBorderData(
          show: false, // Hide border
        ),
        barGroups: [
          generateGroupData(1, 10),
          generateGroupData(2, 8),
          generateGroupData(3, 4),
          generateGroupData(4, 4),
          generateGroupData(5, 2),
          generateGroupData(6, 6),
          generateGroupData(7, 1),
        ],
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipMargin: 0,
            tooltipPadding: const EdgeInsets.all(0),
            getTooltipColor: (touchedSpot) => Colors.transparent, 
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                rod.toY.round().toString(),
                TextStyle(
                  color: color,
                  fontSize: 11
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
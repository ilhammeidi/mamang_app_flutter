import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/stats_card.dart';

class InfographicList extends StatelessWidget {
  const InfographicList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle whiteText = const TextStyle(color: Colors.white);

    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 280,
            child: StatsCard(
              color: ThemePalette.primaryMain,
              bigText: 'Medium',
              title: 'Profile Strength',
              infoGraphic: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 0.7,
                      strokeWidth: 10.0,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    Text('70%', style: whiteText.merge(ThemeText.subtitle))
                  ],
                )
              ),
            ),
          ),
          SizedBox(
            width: 280,
            child: StatsCard(
              color: ThemePalette.secondaryMain,
              bigText: '112',
              title: 'Engengagement',
              infoGraphic: const AspectRatio(
                aspectRatio: 1.6,
                child: SimpleBarChart(),
              )
            ),
          ),
          SizedBox(
            width: 280,
            child: StatsCard(
              color: ThemePalette.tertiaryMain,
              bigText: '12',
              title: 'Campaigns',
              infoGraphic: const Icon(Icons.campaign, color: Colors.white, size: 56)
            ),
          )
        ],
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  const SimpleBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        titlesData: const FlTitlesData(
          show: false,
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 8,
                color: Colors.white,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 5,
                color: Colors.white,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 12,
                color: Colors.white,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 12,
                color: Colors.white,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 5,
                color: Colors.white,
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 12,
                color: Colors.white,
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 12,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
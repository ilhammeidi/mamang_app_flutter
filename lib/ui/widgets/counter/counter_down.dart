import 'package:flutter/widgets.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CounterDown extends StatelessWidget {
  const CounterDown({super.key, required this.format});
  
  final CountDownTimerFormat format;

  @override
  Widget build(BuildContext context) {

    return TimerCountdown(
      format: format,
      endTime: DateTime.now().add(
        const Duration(
          days: 1,
          hours: 11,
          minutes: 47,
        ),
      ),
      // onEnd: () {
      //   print("Timer finished");
      // },
      timeTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      colonsTextStyle: const TextStyle(
        fontSize: 40,
      ),
      descriptionTextStyle: const TextStyle(
        fontSize: 14,
      ),
      spacerWidth: 0,
      daysDescription: "Days",
      hoursDescription: "Hours",
      minutesDescription: "Minutes",
    );
  }
}
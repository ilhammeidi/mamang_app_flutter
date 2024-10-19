import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/utils/no_data.dart';

class NotifEmpty extends StatelessWidget {
  const NotifEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoData(
      image: 'assets/images/puzzle.png',
      bgColor: Colors.amberAccent,
      title: 'All clear now!',
      desc: 'No new notifications yet',
    );
  }
}
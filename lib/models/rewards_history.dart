import 'package:flutter/material.dart';

class Reward {
  final String id;
  final String title;
  final String date;
  final IconData icon;
  final Color color;
  final bool isOut;

  Reward({
    required this.id,
    required this.title,
    required this.date,
    required this.icon,
    required this.color,
    this.isOut = false
  });
}

final List<Reward> pointHistory = [
  Reward(
    id: '1',
    title: '+200 from gave rating',
    icon: Icons.stars_rounded,
    color: Colors.amber,
    date: '2 hour ago'
  ),
  Reward(
    id: '2',
    title: '+100 from saved promo',
    icon: Icons.bookmark,
    color: Colors.teal,
    date: '5 hour ago'
  ),
  Reward(
    id: '3',
    title: '+20 from shared',
    icon: Icons.share,
    color: Colors.green,
    date: 'Yesterday'
  ),
  Reward(
    id: '4',
    title: '+30 from liked',
    icon: Icons.favorite,
    color: Colors.pink,
    date: 'A week ago'
  ),
  Reward(
    id: '6',
    title: '+20 from sent report',
    icon: Icons.report,
    color: Colors.orange,
    date: '11 Aug'
  ),
  Reward(
    id: '7',
    title: '-300 Redeemed',
    icon: Icons.stars,
    color: Colors.cyan,
    date: '3 Jan',
    isOut: true
  ),
  Reward(
    id: '8',
    title: '+20 from sent report',
    icon: Icons.report,
    color: Colors.orange,
    date: '11 Aug'
  ),
  Reward(
    id: '9',
    title: '+30 from liked',
    icon: Icons.favorite,
    color: Colors.pink,
    date: 'A week ago'
  ),
  Reward(
    id: '10',
    title: '+100 from saved promo',
    icon: Icons.bookmark,
    color: Colors.teal,
    date: '5 hour ago'
  ),
];


final List<Reward> coinHistory = [
  Reward(
    id: '1',
    title: '+30 from liked',
    icon: Icons.favorite,
    color: Colors.pink,
    date: 'A week ago'
  ),
  Reward(
    id: '2',
    title: '-30000 Transfered to e-wallet',
    isOut: true,
    icon: Icons.motion_photos_on,
    color: Colors.amber,
    date: '3 Jan'
  ),
  Reward(
    id: '3',
    title: '+20 from shared',
    icon: Icons.share,
    color: Colors.green,
    date: 'Yesterday'
  ),
  Reward(
    id: '4',
    title: '+200 from gave rating',
    icon: Icons.stars_rounded,
    color: Colors.amber,
    date: '2 hour ago'
  ),
  Reward(
    id: '5',
    title: '+100 from saved promo',
    icon: Icons.bookmark,
    color: Colors.teal,
    date: '5 hour ago'
  ),
  Reward(
    id: '6',
    title: '+20 from sent report',
    icon: Icons.report,
    color: Colors.orange,
    date: '11 Aug'
  ),
  Reward(
    id: '7',
    title: '+100 from saved promo',
    icon: Icons.bookmark,
    color: Colors.teal,
    date: '5 hour ago'
  ),
  Reward(
    id: '8',
    title: '+20 from sent report',
    icon: Icons.report,
    color: Colors.orange,
    date: '11 Aug'
  ),
  Reward(
    id: '9',
    title: '+30 from liked',
    icon: Icons.favorite,
    color: Colors.pink,
    date: 'A week ago'
  ),
];

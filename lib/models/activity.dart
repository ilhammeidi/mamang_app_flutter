import 'package:flutter/material.dart';

class Activity {
  final String id;
  final String title;
  final String date;
  final IconData icon;
  final Color color;

  Activity({
    required this.id,
    required this.title,
    required this.date,
    required this.icon,
    required this.color,
  });
}

final List<Activity> activityList = [
  Activity(
    id: '1',
    title: '200 Points Rewarded',
    icon: Icons.stars_rounded,
    color: Colors.amber,
    date: '2 hour ago'
  ),
  Activity(
    id: '2',
    title: 'You saved #123456',
    icon: Icons.bookmark,
    color: Colors.teal,
    date: '5 hour ago'
  ),
  Activity(
    id: '3',
    title: 'You shared #123456',
    icon: Icons.share,
    color: Colors.green,
    date: 'Yesterday'
  ),
  Activity(
    id: '4',
    title: 'You liked a post',
    icon: Icons.favorite,
    color: Colors.pink,
    date: 'A week ago'
  ),
  Activity(
    id: '5',
    title: 'Login from Bandung',
    icon: Icons.person,
    color: Colors.grey,
    date: '12 Aug'
  ),
  Activity(
    id: '6',
    title: 'You sent a report',
    icon: Icons.report,
    color: Colors.orange,
    date: '11 Aug'
  ),
  Activity(
    id: '7',
    title: 'You commented on John Doe posts',
    icon: Icons.comment,
    color: Colors.cyan,
    date: '3 Jan'
  ),
  Activity(
    id: '8',
    title: 'Voucher Redeemed',
    icon: Icons.airplane_ticket_outlined,
    color: Colors.purple,
    date: '22 Sep'
  ),
  Activity(
    id: '9',
    title: 'Used 200 point to buy puzzle',
    icon: Icons.bubble_chart,
    color: Colors.amber,
    date: '1 Sep'
  ),
  Activity(
    id: '10',
    title: 'You crated new business',
    icon: Icons.all_inbox,
    color: Colors.teal,
    date: '2 Aug'
  ),
];

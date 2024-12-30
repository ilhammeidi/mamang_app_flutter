import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double price;
  final String date;
  final IconData icon;
  final Color color;

  Transaction({
    required this.id,
    required this.price,
    required this.title,
    required this.date,
    required this.icon,
    required this.color,
  });
}

final List<Transaction> transactionList = [
  Transaction(
    id: '1',
    title: 'Buy Gold Business',
    price: 24.88,
    icon: Icons.stars_rounded,
    date: '2 hour ago',
    color: Colors.amber
  ),
  Transaction(
    id: '2',
    title: 'Buy Diamond Business',
    price: 90.17,
    icon: Icons.diamond,
    date: '2 days ago',
    color: Colors.purple
  ),
  Transaction(
    id: '3',
    title: 'Buy Coins',
    price: 5.22,
    icon: Icons.motion_photos_on,
    date: '3 days ago',
    color: Colors.cyan
  ),
  Transaction(
    id: '4',
    title: 'Buy Coins',
    price: 2.22,
    icon: Icons.motion_photos_on,
    date: '3 days ago',
    color: Colors.cyan
  ),
  Transaction(
    id: '5',
    title: 'Buy Free Business',
    price: 0,
    icon: Icons.sell,
    date: '3 days ago',
    color: Colors.lightGreen
  ),
  Transaction(
    id: '6',
    title: 'Buy Basic Business',
    price: 7.10,
    icon: Icons.campaign,
    date: '3 days ago',
    color: Colors.blue
  ),
  Transaction(
    id: '7',
    title: 'Buy Gold Business',
    price: 24.88,
    icon: Icons.stars_rounded,
    date: '2 week ago',
    color: Colors.amber
  ),
  Transaction(
    id: '8',
    title: 'Buy Gold Business',
    price: 24.88,
    icon: Icons.stars_rounded,
    date: '2 week ago',
    color: Colors.amber
  ),
  Transaction(
    id: '9',
    title: 'Buy Diamond Business',
    price: 74.93,
    icon: Icons.diamond,
    date: '3 Week ago',
    color: Colors.purple
  ),
  Transaction(
    id: '10',
    title: 'Buy Basic Business',
    price: 7.10,
    icon: Icons.campaign,
    date: '1 Month ago',
    color: Colors.blue
  ),
];

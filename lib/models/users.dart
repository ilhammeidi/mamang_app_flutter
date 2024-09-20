import 'package:mamang_app_flutter/models/img_api.dart';

class User {
  final int id;
  final String name;
  final double distance;
  final String title;
  final String status;
  final String avatar;
  final double coin;
  final double point;

  User({
    required this.id,
    required this.name,
    required this.distance,
    required this.title,
    required this.status,
    required this.avatar,
    required this.coin,
    required this.point
  });
}

final List<User> userList = [
  User(
    id: 1,
    name: 'John Doe',
    distance: 4,
    title: 'regular',
    status: 'active',
    avatar: ImgApi.avatar[6],
    coin: 200,
    point: 20,
  ),
  User(
    id: 2,
    name: 'Jean Doe',
    distance: 1.5,
    title: 'premium',
    status: 'active',
    avatar: ImgApi.avatar[0],
    coin: 100,
    point: 200,
  ),
  User(
    id: 3,
    name: 'Jena Doe',
    distance: 5,
    title: 'VIP',
    status: 'non-active',
    avatar: ImgApi.avatar[1],
    coin: 20,
    point: 0,
  ),
  User(
    id: 4,
    name: 'James Doe',
    distance: 0.5,
    title: 'regular',
    status: 'active',
    avatar: ImgApi.avatar[7],
    coin: 100,
    point: 10,
  ),
  User(
    id: 5,
    name: 'Jack Doe',
    distance: 1,
    title: 'VIP',
    status: 'non-active',
    avatar: ImgApi.avatar[8],
    coin: 100,
    point: 20,
  ),
  User(
    id: 6,
    name: 'Jihan Doe',
    distance: 1,
    title: 'regular',
    status: 'active',
    avatar: ImgApi.avatar[2],
    coin: 0,
    point: 0,
  ),
  User(
    id: 7,
    name: 'Jinx Doe',
    distance: 10,
    title: 'premium',
    status: 'active',
    avatar: ImgApi.avatar[10],
    coin: 0,
    point: 20,
  ),
  User(
    id: 8,
    name: 'Jeni Doe',
    distance: 0.4,
    title: 'regular',
    status: 'active',
    avatar: ImgApi.avatar[3],
    coin: 200,
    point: 20,
  ),
  User(
    id: 9,
    name: 'Joan Doe',
    distance: 1.5,
    title: 'VIP',
    status: 'active',
    avatar: ImgApi.avatar[4],
    coin: 100,
    point: 120,
  ),
  User(
    id: 10,
    name: 'Jane Doe',
    distance: 0.3,
    title: 'premium',
    status: 'active',
    avatar: ImgApi.avatar[5],
    coin: 300,
    point: 500,
  ),
  User(
    id: 11,
    name: 'Joni Doe',
    distance: 1,
    title: 'regular',
    status: 'active',
    avatar: ImgApi.avatar[9],
    coin: 100,
    point: 1500,
  ),
];

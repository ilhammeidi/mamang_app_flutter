import 'package:mamang_app_flutter/models/img_api.dart';

class Puzzle {
  final int id;
  final String name;
  final bool liked;
  final String time;
  final String thumb;
  final String image;
  final String progress;

  Puzzle({
    required this.id,
    required this.name,
    required this.liked,
    required this.time,
    required this.thumb,
    required this.image,
    required this.progress
  });
}

final List<Puzzle> puzzleList = [
  Puzzle(
    id: 1,
    name: 'First-Time Customer Discounts',
    liked: true,
    time: '2 Days',
    thumb: ImgApi.photo[105],
    image: ImgApi.photo[3],
    progress: 'aci'
  ),
  Puzzle(
    id: 2,
    name: 'Leverage holidays and special occasions',
    liked: false,
    time: '01:12',
    thumb: ImgApi.photo[110],
    image: ImgApi.photo[5],
    progress: 'abe'
  ),
  Puzzle(
    id: 3,
    name: 'Volume Discounts',
    liked: true,
    time: '02:00',
    thumb: ImgApi.photo[120],
    image: ImgApi.photo[10],
    progress: 'bdfhi'
  ),
  Puzzle(
    id: 4,
    name: 'Flash Sales:',
    liked: false,
    time: '1 Day',
    thumb: ImgApi.photo[115],
    image: ImgApi.photo[22],
    progress: 'dghi'
  ),
  Puzzle(
    id: 5,
    name: 'Limited-time flash sales',
    liked: false,
    time: '01:22',
    thumb: ImgApi.photo[107],
    image: ImgApi.photo[54],
    progress: 'bcf'
  ),
];
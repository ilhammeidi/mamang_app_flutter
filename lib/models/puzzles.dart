import 'package:mamang_app_flutter/models/img_api.dart';

class Puzzle {
  final String id;
  final String name;
  final bool liked;
  final String time;
  final String thumb;
  final String image;
  final String progress;

  Puzzle({
    this.id = '0',
    this.name = '',
    this.liked = false,
    this.time = '',
    this.thumb = '',
    this.image = '',
    this.progress = ''
  });
}

final List<Puzzle> puzzleList = [
  Puzzle(
    id: '1',
    name: 'First-Time Customer Discounts',
    liked: true,
    time: '2 Days',
    thumb: ImgApi.photo[105],
    image: ImgApi.photo[3],
    progress: '123456789'
  ),
  Puzzle(
    id: '2',
    name: 'Leverage holidays and special occasions',
    liked: false,
    time: '01:12',
    thumb: ImgApi.photo[6],
    image: ImgApi.photo[5],
    progress: '123456789'
  ),
  Puzzle(
    id: '3',
    name: 'Volume Discounts',
    liked: true,
    time: '02:00',
    thumb: ImgApi.photo[120],
    image: ImgApi.photo[10],
    progress: '24689',
  ),
  Puzzle(
    id: '4',
    name: 'Flash Sales',
    liked: false,
    time: '2 Day',
    thumb: ImgApi.photo[67],
    image: ImgApi.photo[69],
    progress: '123456789'
  ),
  Puzzle(
    id: '5',
    name: 'Limited-time flash sales',
    liked: false,
    time: '01:22',
    thumb: ImgApi.photo[107],
    image: ImgApi.photo[54],
    progress: '236'
  ),
];
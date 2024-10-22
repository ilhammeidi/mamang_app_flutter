import 'package:mamang_app_flutter/models/img_api.dart';

class Rating {
  final String name;
  final String avatar;
  final String date;
  final String description;
  final int rating;

  Rating({
    required this.name,
    required this.avatar,
    required this.date,
    required this.description,
    required this.rating
  });
}

List<Rating> ratingList = [
  Rating(
    avatar: ImgApi.avatar[0],
    name: 'Jean Doe',
    date: 'Today',
    description: 'Phasellus id sapien in sapien iaculis congue.',
    rating: 5
  ),
  Rating(
    avatar: ImgApi.avatar[1],
    name: 'Jena Doe',
    date: '22 Aug',
    description: 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',
    rating: 4
  ),
  Rating(
    avatar: ImgApi.avatar[7],
    name: 'James Doe',
    date: '1 Apr',
    description: 'Aenean lectus. Pellentesque eget nunc.',
    rating: 5
  ),
  Rating(
    avatar: ImgApi.avatar[8],
    name: 'John Doe',
    date: '12 Feb',
    description: 'Phasellus id sapien in sapien iaculis congue.',
    rating: 1
  ),
  Rating(
    avatar: ImgApi.avatar[9],
    name: 'Jack Doe',
    date: '1 Feb',
    description: 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',
    rating: 2
  ),
  Rating(
    avatar: ImgApi.avatar[4],
    name: 'Jihan Doe',
    date: '10 Jan',
    description: 'Aenean lectus. Pellentesque eget nunc.',
    rating: 3
  ),
];
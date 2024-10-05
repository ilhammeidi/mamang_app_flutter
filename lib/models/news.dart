import 'package:mamang_app_flutter/models/img_api.dart';

class News {
  final String title;
  final String thumb;
  final String date;

  News({required this.title, required this.thumb, required this.date});
}

final List<News> newsList = [
  News(
    title: 'Overstock Sales Calendar: When to Shop to Save the Most',
    thumb: ImgApi.photo[52],
    date: '22 Mar 2024'
  ),
  News(
    title: 'Lovehoney Returns & Discreet Shipping',
    thumb: ImgApi.photo[100],
    date: '23 Mar 2024'
  ),
  News(
    title: 'Macy\'s Cyber Monday Guide',
    thumb: ImgApi.photo[58],
    date: '22 Mar 2024'
  ),
  News(
    title: 'Labor Day weekend is definitely the best time to shop',
    thumb: ImgApi.photo[75],
    date: '20 Mar 2024'
  ),
  News(
    title: 'Lovehoney Returns & Discreet Shipping',
    thumb: ImgApi.photo[6],
    date: '18 Mar 2024'
  )
];
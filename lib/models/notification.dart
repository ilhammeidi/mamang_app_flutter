import 'package:mamang_app_flutter/models/img_api.dart';

class NotificationModel {
  final String type;
  final String title;
  final String subtitle;
  final String date;
  final String? image;
  final bool isRead;

  NotificationModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.date,
    this.image,
    this.isRead = false,
  });
}

final List<NotificationModel> notifList = [
  NotificationModel(
    type: 'success',
    title: 'Duis at velit eu est',
    subtitle: 'Vestibulum sed magna at nunc commodo placerat',
    date: 'Today',
  ),
  NotificationModel(
    type: 'info',
    title: 'Quisque erat eros',
    subtitle: 'Nunc purus. Phasellus in felis',
    date: 'A week ago',
    image: ImgApi.photo[2],
  ),
  NotificationModel(
    type: 'warning',
    title: 'Pellentesque ultrices mattis odio',
    subtitle: 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem',
    date: '15 Apr'
  ),
  NotificationModel(
    type: 'error',
    title: 'Duis at velit eu est',
    subtitle: 'Vestibulum sed magna at nunc commodo placerat',
    date: '22 Jan',
    isRead: true,
  ),
  NotificationModel(
    type: 'message',
    title: 'From: James Doe',
    subtitle: 'Nunc purus. Phasellus in felis',
    date: 'A week ago',
    isRead: true,
  ),
  NotificationModel(
    type: 'info',
    title: 'Duis at velit eu est',
    subtitle: 'Vestibulum sed magna at nunc commodo placerat',
    date: '22 Jan',
    image: ImgApi.photo[90],
    isRead: true,
  ),
  NotificationModel(
    type: 'success',
    title: 'Nullam molestie nibh in lectus',
    subtitle: 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',
    date: 'Long time ago',
    isRead: true,
  ),
  NotificationModel(
    type: 'account',
    title: 'Pellentesque ultrices mattis odio',
    subtitle: 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem',
    date: '15 Apr',
    isRead: true,
  ),
];
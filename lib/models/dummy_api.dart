import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/models/img_api.dart';

User userDummy = User(
  id: 1,
  distance: 0,
  name: 'John Doe',
  title: 'premium',
  status: 'active',
  avatar: ImgApi.avatar[6],
  coin: 2000,
  point: 100
);

// Content
class ContentApi {
  static const title = 'Lorem ipsum';
  static const subtitle = 'Ut a lorem eu odio cursus laoreet.';
  static const sentences = 'Donec lacus sem, scelerisque sed ligula nec, iaculis porttitor mauris.';
  static const paragraph = 'Sed rutrum augue libero, id faucibus quam aliquet sed. Phasellus interdum orci quam, volutpat ornare eros rhoncus sed. Donec vestibulum leo a auctor convallis. In dignissim consectetur molestie. Vivamus interdum tempor dui, nec posuere augue consequat sit amet. Suspendisse quis semper quam. Nullam nec neque sem.';
  static const date = '19 Sep 2024';
}
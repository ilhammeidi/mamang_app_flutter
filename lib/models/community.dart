import 'package:mamang_app_flutter/models/img_api.dart';

class Community {
  String id;
  String name;
  String avatar;
  String desc;
  double totalMembers;

  Community({
    this.id = '0',
    this.name = '',
    this.avatar = '',
    this.desc = '',
    this.totalMembers = 0,
  });
}

List<Community> communityList = [
  Community(
    id: '0',
    avatar: ImgApi.photo[9],
    name: 'Food Group',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '1',
    avatar: ImgApi.photo[19],
    name: 'Ice Cream Lovers',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '2',
    avatar: ImgApi.photo[21],
    name: 'Loker',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '3',
    avatar: ImgApi.photo[40],
    name: 'Jaya Workshop',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '4',
    avatar: ImgApi.photo[59],
    name: 'UNIBI',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '5',
    avatar: ImgApi.photo[63],
    name: 'Fun Football',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '6',
    avatar: ImgApi.photo[23],
    name: 'Garage Community',
    desc: '',
    totalMembers: 100
  ),
  Community(
    id: '7',
    avatar: ImgApi.photo[102],
    name: 'Indonesia',
    desc: '',
    totalMembers: 100
  ),
];
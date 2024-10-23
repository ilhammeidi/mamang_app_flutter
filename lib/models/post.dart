import 'package:mamang_app_flutter/models/users.dart';

class Post {
  String id;
  int userId;
  String caption;
  String image;
  String location;
  double likes;
  double comments;
  double views;
  double duration;
  String timeFrom;
  String timeTo;

  Post({
    this.id = '0',
    this.userId = 0,
    this.caption = '',
    this.image = '',
    this.location = '',
    this.likes = 0,
    this.comments = 0,
    this.views = 0,
    this.duration = 0,
    this.timeFrom = '',
    this.timeTo = '',
  });
}

class Comment {
  String id;
  String name;
  String avatar;
  String comment;

  Comment({
    required this.id,
    required this.name,
    required this.avatar,
    required this.comment,
  });
}

List<Comment> commentList = [
  Comment(
    id: '1',
    avatar: userList[1].avatar,
    name: userList[1].name,
    comment: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
  ),
  Comment(
    id: '2',
    avatar: userList[2].avatar,
    name: userList[2].name,
    comment: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
  ),
  Comment(
    id: '3',
    avatar: userList[3].avatar,
    name: userList[3].name,
    comment: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
  ),
  Comment(
    id: '4',
    avatar: userList[4].avatar,
    name: userList[4].name,
    comment: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
  ),
  Comment(
    id: '5',
    avatar: userList[5].avatar,
    name: userList[5].name,
    comment: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
  ),
  Comment(
    id: '6',
    avatar: userList[6].avatar,
    name: userList[6].name,
    comment: 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
  ),
];

List<Post> postList = [
  Post(
    id: "1",
    userId: 1,
    caption: 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.',
    image: "nullhttps://res.cloudinary.com/doosabwhn/image/upload/v1729703292/post1_osmfxg.jpg",
    location: 'PO Box 83059',
    likes: 1,
    comments: 90,
    views: 716,
    timeFrom: '8:57',
    timeTo: '16:43',
    duration: 7
  ),
  Post(
    id: "2",
    userId: 11,
    caption: 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703292/post2_gcxx2r.jpg",
    location: 'Apt 751',
    likes: 67,
    comments: 71,
    views: 63,
    timeFrom: '10:07',
    timeTo: '23:33',
    duration: 10
  ),
  Post(
    id: "3",
    userId: 8,
    caption: 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam "null"a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703292/post3_gln5a4.jpg",
    location: 'PO Box 67767',
    likes: 64,
    comments: 15,
    views: 791,
    timeFrom: '23:49',
    timeTo: '6:07',
    duration: 11
  ),
  Post(
    id: "4",
    userId: 9,
    caption: 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703292/post4_dxuiy9.jpg",
    location: 'Suite 71',
    likes: 86,
    comments: 43,
    views: 620,
    timeFrom: '15:12',
    timeTo: '2:34',
    duration: 9
  ),
  Post(
    id: "5",
    userId: 9,
    caption: 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703293/post5_uvrkqu.jpg",
    location: 'Room 1731',
    likes: 45,
    comments: 36,
    views: 514,
    timeFrom: '18:29',
    timeTo: '1:31',
    duration: 4
  ),
  Post(
    id: "6",
    userId: 8,
    caption: 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam "null"a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703293/post6_brcmzm.jpg",
    location: '13th Floor',
    likes: 23,
    comments: 62,
    views: 847,
    timeFrom: '17:24',
    timeTo: '5:56',
    duration: 8
  ),
  Post(
    id: "7",
    userId: 1,
    caption: 'Phasellus in felis. Donec semper sapien a libero. Nam dui.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703293/post7_krd0bl.jpg",
    location: 'Apt 241',
    likes: 84,
    comments: 32,
    views: 957,
    timeFrom: '23:21',
    timeTo: '23:28',
    duration: 4
  ),
  Post(
    id: "8",
    userId: 2,
    caption: 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id "null"a ultrices aliquet.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703293/post8_jd4ucl.jpg",
    location: 'Suite 63',
    likes: 70,
    comments: 92,
    views: 932,
    timeFrom: '15:55',
    timeTo: '1:57',
    duration: 2
  ),
  Post(
    id: "9",
    userId: 10,
    caption: 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id "null"a ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703294/post9_rpmnmu.jpg",
    location: 'PO Box 32545',
    likes: 12,
    comments: 50,
    views: 914,
    timeFrom: '8:38',
    timeTo: '12:09',
    duration: 8
  ),
  Post(
    id: "10",
    userId: 1,
    caption: 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703294/post10_x7eor1.jpg",
    location: '7th Floor',
    likes: 15,
    comments: 80,
    views: 242,
    timeFrom: '13:09',
    timeTo: '23:52',
    duration: 6
  ),
  Post(
    id: "11",
    userId: 1,
    caption: 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703298/post11_yipxw2.jpg",
    location: 'Room 469',
    likes: 29,
    comments: 89,
    views: 844,
    timeFrom: '21:08',
    timeTo: '9:41',
    duration: 4
  ),
  Post(
    id: "12",
    userId: 2,
    caption: 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\n"null"a ut erat id mauris vulputate elementum. "null"am varius. "null"a facilisi.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703300/post12_zigjdd.jpg",
    location: 'Room 1528',
    likes: 67,
    comments: 68,
    views: 301,
    timeFrom: '12:06',
    timeTo: '6:08',
    duration: 8
  ),
  Post(
    id: "13",
    userId: 9,
    caption: 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703304/post13_rdy6hu.jpg",
    location: 'Room 109',
    likes: 4,
    comments: 29,
    views: 173,
    timeFrom: '4:47',
    timeTo: '16:56',
    duration: 1
  ),
  Post(
    id: "14",
    userId: 7,
    caption: 'Phasellus in felis. Donec semper sapien a libero. Nam dui.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703304/post14_dmqqk9.jpg",
    location: 'Room 69',
    likes: 94,
    comments: 62,
    views: 97,
    timeFrom: '21:01',
    timeTo: '14:35',
    duration: 10
  ),
  Post(
    id: "15",
    userId: 6,
    caption: 'Sed ante. Vivamus tortor. Duis mattis egestas metus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703299/post15_z1t56d.jpg",
    location: 'Suite 96',
    likes: 21,
    comments: 20,
    views: 927,
    timeFrom: '10:01',
    timeTo: '9:55',
    duration: 2
  ),
  Post(
    id: "16",
    userId: 8,
    caption: 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, "null"a. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703299/post16_zdi2v2.jpg",
    location: 'Room 1031',
    likes: 26,
    comments: 13,
    views: 547,
    timeFrom: '9:53',
    timeTo: '12:20',
    duration: 3
  ),
  Post(
    id: "17",
    userId: 6,
    caption: 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703299/post17_mfswk5.jpg",
    location: 'PO Box 22358',
    likes: 27,
    comments: 33,
    views: 761,
    timeFrom: '1:07',
    timeTo: '10:55',
    duration: 5
  ),
  Post(
    id: "18",
    userId: 6,
    caption: 'Proin leo odio, porttitor id, consequat in, consequat ut, "null"a. Sed accumsan felis. Ut at dolor quis odio consequat varius.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703300/post18_ljubbe.jpg",
    location: 'PO Box 80343',
    likes: 6,
    comments: 24,
    views: 323,
    timeFrom: '22:21',
    timeTo: '23:42',
    duration: 2
  ),
  Post(
    id: "19",
    userId: 9,
    caption: 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. "null"am molestie nibh in lectus.\n\nPellentesque at "null"a. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703300/post19_e9frvk.jpg",
    location: 'Room 1887',
    likes: 12,
    comments: 35,
    views: 598,
    timeFrom: '5:38',
    timeTo: '21:32',
    duration: 10
  ),
  Post(
    id: "20",
    userId: 9,
    caption: 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\n"null"am sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703300/post20_ngzibp.jpg",
    location: 'Suite 10',
    likes: 86,
    comments: 74,
    views: 266,
    timeFrom: '15:50',
    timeTo: '20:38',
    duration: 7
  ),
  Post(
    id: "21",
    userId: 6,
    caption: 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703260/post21_efl3lm.jpg",
    location: 'PO Box 53304',
    likes: 46,
    comments: 15,
    views: 913,
    timeFrom: '15:47',
    timeTo: '14:50',
    duration: 8
  ),
  Post(
    id: "22",
    userId: 3,
    caption: 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703259/post22_vf2lvs.jpg",
    location: 'Suite 85',
    likes: 10,
    comments: 36,
    views: 853,
    timeFrom: '20:48',
    timeTo: '5:08',
    duration: 3
  ),
  Post(
    id: "23",
    userId: 4,
    caption: 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703259/post23_wrftao.jpg",
    location: 'Suite 45',
    likes: 44,
    comments: 61,
    views: 229,
    timeFrom: '8:49',
    timeTo: '13:51',
    duration: 2
  ),
  Post(
    id: "24",
    userId: 4,
    caption: 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel "null"a eget eros elementum pellentesque.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703259/post24_e4xpss.jpg",
    location: 'Room 487',
    likes: 67,
    comments: 6,
    views: 668,
    timeFrom: '16:33',
    timeTo: '8:53',
    duration: 6
  ),
  Post(
    id: "25",
    userId: 11,
    caption: 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel "null"a eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, "null"a. Nunc purus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703259/post25_naoowr.jpg",
    location: 'Suite 84',
    likes: 40,
    comments: 8,
    views: 522,
    timeFrom: '7:43',
    timeTo: '20:02',
    duration: 9
  ),
  Post(
    id: "26",
    userId: 10,
    caption: 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. "null"a tellus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703259/post26_ummike.jpg",
    location: 'PO Box 36097',
    likes: 74,
    comments: 64,
    views: 242,
    timeFrom: '13:34',
    timeTo: '1:53',
    duration: 6
  ),
  Post(
    id: "27",
    userId: 4,
    caption: '"null"am porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. "null"am orci pede, venenatis non, sodales sed, tincidunt eu, felis.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703258/post27_wj8lei.jpg",
    location: 'Suite 16',
    likes: 29,
    comments: 66,
    views: 614,
    timeFrom: '10:41',
    timeTo: '20:59',
    duration: 4
  ),
  Post(
    id: "28",
    userId: 2,
    caption: 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. "null"a nisl. Nunc nisl.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703258/post28_lohuo8.jpg",
    location: 'Apt 674',
    likes: 37,
    comments: 61,
    views: 128,
    timeFrom: '5:26',
    timeTo: '9:11',
    duration: 9
  ),
  Post(
    id: "29",
    userId: 9,
    caption: 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel "null"a eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, "null"a. Nunc purus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703258/post29_fnfjmo.jpg",
    location: 'Suite 13',
    likes: 8,
    comments: 16,
    views: 150,
    timeFrom: '7:14',
    timeTo: '6:29',
    duration: 3
  ),
  Post(
    id: "30",
    userId: 10,
    caption: 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703257/post30_fspsr3.jpg",
    location: 'Apt 1449',
    likes: 65,
    comments: 28,
    views: 948,
    timeFrom: '6:38',
    timeTo: '23:53',
    duration: 11
  ),
  Post(
    id: "31",
    userId: 9,
    caption: 'In congue. Etiam justo. Etiam pretium iaculis justo.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703256/post31_xldxkq.jpg",
    location: '1st Floor',
    likes: 68,
    comments: 50,
    views: 29,
    timeFrom: '18:29',
    timeTo: '12:19',
    duration: 10
  ),
  Post(
    id: "32",
    userId: 2,
    caption: 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703258/post32_ag3mmv.jpg",
    location: 'Apt 1507',
    likes: 91,
    comments: 48,
    views: 43,
    timeFrom: '10:48',
    timeTo: '22:04',
    duration: 1
  ),
  Post(
    id: "33",
    userId: 3,
    caption: 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703258/post33_cqonig.jpg",
    location: 'Room 1433',
    likes: 9,
    comments: 75,
    views: 719,
    timeFrom: '3:28',
    timeTo: '3:46',
    duration: 3
  ),
  Post(
    id: "34",
    userId: 11,
    caption: 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. "null"am orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703258/post34_j7q8cr.jpg",
    location: 'Room 33',
    likes: 43,
    comments: 92,
    views: 905,
    timeFrom: '9:21',
    timeTo: '19:49',
    duration: 10
  ),
  Post(
    id: "35",
    userId: 7,
    caption: 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703257/post35_tkngte.jpg",
    location: 'Room 532',
    likes: 58,
    comments: 46,
    views: 697,
    timeFrom: '18:59',
    timeTo: '0:51',
    duration: 8
  ),
  Post(
    id: "36",
    userId: 8,
    caption: 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703257/post36_tfvbrl.jpg",
    location: 'Apt 992',
    likes: 47,
    comments: 58,
    views: 243,
    timeFrom: '10:30',
    timeTo: '6:05',
    duration: 2
  ),
  Post(
    id: "37",
    userId: 2,
    caption: 'Fusce consequat. "null"a nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703257/post37_xa73e5.jpg",
    location: '9th Floor',
    likes: 98,
    comments: 84,
    views: 792,
    timeFrom: '11:45',
    timeTo: '1:04',
    duration: 8
  ),
  Post(
    id: "38",
    userId: 6,
    caption: 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. "null"a neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703256/post38_kuc8km.jpg",
    location: 'Suite 15',
    likes: 96,
    comments: 88,
    views: 331,
    timeFrom: '20:28',
    timeTo: '13:16',
    duration: 7
  ),
  Post(
    id: "39",
    userId: 2,
    caption: 'Maecenas ut massa quis augue luctus tincidunt. "null"a mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703260/post39_wvy2na.jpg",
    location: 'PO Box 93356',
    likes: 86,
    comments: 72,
    views: 142,
    timeFrom: '12:07',
    timeTo: '5:18',
    duration: 2
  ),
  Post(
    id: "40",
    userId: 4,
    caption: 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. "null"am molestie nibh in lectus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703260/post40_qqjlqk.jpg",
    location: 'PO Box 62165',
    likes: 41,
    comments: 53,
    views: 374,
    timeFrom: '2:32',
    timeTo: '12:12',
    duration: 11
  ),
  Post(
    id: "41",
    userId: 1,
    caption: 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703314/post51_f4xtyo.jpg",
    location: 'PO Box 47462',
    likes: 9,
    comments: 87,
    views: 985,
    timeFrom: '12:10',
    timeTo: '19:35',
    duration: 5
  ),
  Post(
    id: "42",
    userId: 3,
    caption: '"null"am sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703314/post52_zbjain.jpg",
    location: 'Apt 697',
    likes: 87,
    comments: 79,
    views: 989,
    timeFrom: '18:14',
    timeTo: '14:28',
    duration: 6
  ),
  Post(
    id: "43",
    userId: 8,
    caption: 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703315/post53_is3a0y.jpg",
    location: 'PO Box 43578',
    likes: 11,
    comments: 89,
    views: 977,
    timeFrom: '3:10',
    timeTo: '23:04',
    duration: 2
  ),
  Post(
    id: "44",
    userId: 7,
    caption: 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703312/post54_ivmvsl.jpg",
    location: 'Room 847',
    likes: 37,
    comments: 9,
    views: 862,
    timeFrom: '14:23',
    timeTo: '7:31',
    duration: 2
  ),
  Post(
    id: "45",
    userId: 11,
    caption: 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703313/post55_s83wop.jpg",
    location: 'Suite 66',
    likes: 95,
    comments: 39,
    views: 360,
    timeFrom: '14:58',
    timeTo: '13:15',
    duration: 12
  ),
  Post(
    id: "46",
    userId: 11,
    caption: 'Phasellus sit amet erat. "null"a tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. "null"a ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703313/post56_kubdzo.jpg",
    location: 'Suite 94',
    likes: 82,
    comments: 90,
    views: 219,
    timeFrom: '0:29',
    timeTo: '4:02',
    duration: 6
  ),
  Post(
    id: "47",
    userId: 9,
    caption: 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703313/post57_ofr8lr.jpg",
    location: 'Room 1910',
    likes: 41,
    comments: 40,
    views: 445,
    timeFrom: '1:23',
    timeTo: '11:01',
    duration: 4
  ),
  Post(
    id: "48",
    userId: 5,
    caption: 'Phasellus sit amet erat. "null"a tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. "null"a ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729707620/post58_fbxasj.jpg",
    location: 'Suite 48',
    likes: 97,
    comments: 51,
    views: 116,
    timeFrom: '23:37',
    timeTo: '5:17',
    duration: 7
  ),
  Post(
    id: "49",
    userId: 9,
    caption: 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729707619/post59_yf6b0r.jpg",
    location: '6th Floor',
    likes: 38,
    comments: 37,
    views: 315,
    timeFrom: '18:19',
    timeTo: '2:46',
    duration: 1
  ),
  Post(
    id: "50",
    userId: 2,
    caption: 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
    image: "https://res.cloudinary.com/doosabwhn/image/upload/v1729703314/post60_te8clg.jpg",
    location: 'PO Box 23221',
    likes: 38,
    comments: 27,
    views: 14,
    timeFrom: '1:10',
    timeTo: '18:49',
    duration: 12
  )
];
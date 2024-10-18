import 'package:mamang_app_flutter/models/img_api.dart';

class Chat{
  final String avatar;
  final String name;
  final List<MessageItem> messages;

  Chat({
    required this.avatar,
    required this.name,
    required this.messages
  });
}

class MessageItem {
  final String message;
  final String date;
  final bool isMe;

  MessageItem({
    required this.message,
    required this.date,
    required this.isMe,
  });
}

final List<Chat> chatListPersonal = [
  Chat(
    avatar: ImgApi.avatar[1],
    name: 'Jean Doe',
    messages: message1,
  ),
  Chat(
    avatar: ImgApi.avatar[2],
    name: 'Jena Doe',
    messages: message2,
  ),
  Chat(
    avatar: ImgApi.avatar[8],
    name: 'Jim Doe',
    messages: message3,
  ),
  Chat(
    avatar: ImgApi.avatar[9],
    name: 'Jack Doe',
    messages: message1,
  ),
  Chat(
    avatar: ImgApi.avatar[4],
    name: 'Jihan Doe',
    messages: message2,
  ),
  Chat(
    avatar: ImgApi.avatar[7],
    name: 'James Doe',
    messages: message3,
  )
];

final List<Chat> chatListGroup = [
  Chat(
    avatar: ImgApi.photo[9],
    name: 'Food Group',
    messages: message1,
  ),
  Chat(
    avatar: ImgApi.photo[19],
    name: 'Ice Cream Lovers',
    messages: message2,
  ),
  Chat(
    avatar: ImgApi.photo[21],
    name: 'Loker',
    messages: message3,
  ),
  Chat(
    avatar: ImgApi.photo[40],
    name: 'Jaya Workshop',
    messages: message1,
  ),
  Chat(
    avatar: ImgApi.photo[59],
    name: 'UNIBI',
    messages: message2,
  ),
  Chat(
    avatar: ImgApi.photo[63],
    name: 'Fun Football',
    messages: message3,
  )
];

/// EXAMPLE MESSAGES
final List<MessageItem> message1 = [
  MessageItem(
    message: 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',
    date: 'Just now',
    isMe: false
  ),
  MessageItem(
    message: 'optimize plug-and-play applications',
    date: 'Just now',
    isMe: true
  ),
  MessageItem(
    message: 'Nullam molestie nibh in lectus. Pellentesque at nulla.',
    date: '2 hours ago',
    isMe: false
  ),
  MessageItem(
    message: '9860 Hoffman Place',
    date: 'yesterday',
    isMe: false
  ),
];

final List<MessageItem> message2 = [
  MessageItem(
    message: 'Nullam molestie nibh in lectus. Pellentesque at nulla.',
    date: 'Yesterday',
    isMe: true
  ),
  MessageItem(
    message: 'monetize viral interfaces',
    date: 'Yesterday',
    isMe: true
  ),
  MessageItem(
    message: '824 Dakota Hill',
    date: '2 days ago',
    isMe: false
  ),
  MessageItem(
    message: 'seize leading-edge channels',
    date: '2 days ago',
    isMe: false
  ),
  MessageItem(
    message: 'optimize real-time portals',
    date: 'Last week',
    isMe: true
  ),
  MessageItem(
    message: 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',
    date: '1 Mar',
    isMe: false
  ),
];

final List<MessageItem> message3 = [
  MessageItem(
    message: 'expedite sticky networks',
    date: '12 Aug',
    isMe: true
  ),
  MessageItem(
    message: 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate',
    date: '12 Aug',
    isMe: false
  ),
  MessageItem(
    message: 'Quisque ut erat. Curabitur gravida nisi at nibh.',
    date: '1 Jan',
    isMe: false
  ),
  MessageItem(
    message: 'Quisque id justo sit amet sapien dignissim vestibulum.',
    date: '1 Jan',
    isMe: false
  ),
  MessageItem(
    message: 'Suspendisse ornare consequat lectus.',
    date: '1 Jan',
    isMe: true
  ),
  MessageItem(
    message: 'engage visionary e-commerce',
    date: '1 Jan',
    isMe: true
  ),
];
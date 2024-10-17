import 'package:mamang_app_flutter/models/img_api.dart';

class Event {
  String id;
  String title;
  String desc;
  String thumb;
  String clue1;
  String clue2;
  String clue3;
  String date;
  String category;
  int point;
  bool liked;

  Event({
    this.id = '0',
    this.title = '',
    this.desc = '',
    this.thumb = '',
    this.clue1 = '',
    this.clue2 = '',
    this.clue3 = '',
    this.date = '', 
    this.category = '',
    this.point = 0,
    this.liked = false
  });
}

final List<Event> eventList = [
  Event(
    id: '1',
    title: '60-Minutes of All You Can Play Games',
    desc: 'Get ready for a whole new level of fun! With new and refreshed games, an interactive dance floor, live shows, awesome new prizes, and new food (including a Grown-Up menu)',
    thumb: ImgApi.photo[101],
    clue1: 'One 60 Minute All You Can Play Games Pass',
    clue2: 'Not valid for birthday parties, group events or online ordering.',
    clue3: 'One large 1-topping pizza',
    date: '12 May 2024',
    category: 'food',
    point: 200,
    liked: false
  ),
  Event(
    id: '2',
    title: 'Two Hours of Bowling and Shoe Rentals',
    desc: 'Upscale bowling inside a luxury bowling alley with glow-in-the-dark lanes, a spacious sports bar, and entertaining arcades.',
    thumb: ImgApi.photo[102],
    clue1: '👉 Choose between two-, four-, or six-person options',
    clue2: '⭐ Each voucher good for one lane',
    clue3: '✅ Gather friends or take a date to this upscale bowling alley',
    date: '11 Dec 2024',
    category: 'services',
    point: 50,
    liked: true
  ),
  Event(
    id: '3',
    title: 'Thrill of a Lifetime: Tandem Skydive Jump',
    desc: 'Leap over a mile above Lake Michigan\'s south shore strapped to a USPA-certified instructor for stunning views of the Chicago Skyline',
    thumb: ImgApi.photo[103],
    clue1: '🪙 Video/Pictures not included but can be purchased at the time of jump.',
    clue2: '🛒 All Groupon reviews are from people',
    clue3: '⚠️ No booking required. Present Groupon on arrival.',
    date: '22 Nov 2024',
    category: 'automotive',
    point: 200,
    liked: true
  ),
  Event(
    id: '4',
    title: '60-Minutes of All You Can Play Games',
    desc: 'Get ready for a whole new level of fun! With new and refreshed games, an interactive dance floor, live shows, awesome new prizes, and new food (including a Grown-Up menu)',
    thumb: ImgApi.photo[104],
    clue1: '⌚ One 60 Minute All You Can Play Games Pass',
    clue2: '📅 Not valid for birthday parties, group events or online ordering.',
    clue3: '🍕 One large 1-topping pizza',
    date: '12 May 2024',
    category: 'property',
    point: 200,
    liked: false
  ),
  Event(
    id: '5',
    title: 'Spend on Food and Drink',
    desc: 'Welcome to a place that serves mouthwatering dishes and immerses you in rich culture. ',
    thumb: ImgApi.photo[105],
    clue1: '🧑 Limit 1 per person, may buy 2 additional as gift(s). May be repurchased every 60 days.',
    clue2: '🚫 No booking required. Present Groupon on arrival.',
    clue3: '🚪 Limit 1 per visit. Limit 1 per table.',
    date: '27 Sept 2024',
    category: 'education',
    point: 100,
    liked: true
  ),
  Event(
    id: '6',
    title: 'Choose Your World of Deals!',
    desc: 'Looking for the perfect gift to amaze your beloved ones or friends? Look no further! Groupon presents an exclusive opportunity for you to gift the joy of choice. With our Groupon Gift Card, your loved ones will embark on a journey of discovery and delight',
    thumb: ImgApi.photo[106],
    clue1: '🌍 Make their special day unforgettable.',
    clue2: '💁‍♀️ Help them celebrate their achievements.',
    clue3: '🎖️ Reward your team with something special.',
    date: '31 Oct 2024',
    category: 'sport',
    point: 500,
    liked: true
  ),
  Event(
    id: '7',
    title: 'Stay in 4-Star Radisson Blu Aqua Hotel',
    desc: 'Radisson Blu Aqua Hotel is an ideal base for travelers visiting the Chi-town, amply supported by world-class amenities. Select options include breakfast.',
    thumb: ImgApi.photo[107],
    clue1: '👨‍👩‍👧‍👦 Guest Rooms come with complimentary.',
    clue2: '🏢 The hotel offers an indoor and outdoor pool and an outdoor track.',
    clue3: '🛍️ Go on a shopping spree along the Magnificent Mile.',
    date: '2 Nov 2024',
    category: 'holiday',
    point: 150,
    liked: true
  ),
  Event(
    id: '8',
    title: 'Get Fit and Feel Fabulous at Blink Fitness',
    desc: 'During the year of unlimited membership, customers can enjoy full a spectrum of the Blink Fitness gyms’ amenities.',
    thumb: ImgApi.photo[108],
    clue1: '💪 The friendliest staff in fitness!',
    clue2: '💰 40 pairs of dumbbells up to 90 pounds',
    clue3: '💎 All of the perks included in the Single Gym Access Option',
    date: '20 Dec 2024',
    category: 'souvenir',
    point: 50,
    liked: false
  ),
  Event(
    id: '9',
    title: 'Synthetic, Full Synthetic, or High Milage Oil Change with Filter',
    desc: 'When you come in for an oil change, we do more than pour oil. We provide high-quality Valvoline oil plus powerful services to optimize your vehicle’s engine and keep you on the road longer. Get ready to experience a better oil change.',
    thumb: ImgApi.photo[109],
    clue1: '🚗 After your oil change, submit your invoice to receive your rebate!',
    clue2: '✔️ For most gas-fueled passenger cars and light-duty trucks',
    clue3: '🛢️ Formulated to protect engines with over 75,000 miles',
    date: '21 Dec 2024',
    category: 'food',
    point: 100,
    liked: true
  ),
  Event(
    id: '10',
    title: 'Immerse in Spine-Tingling History',
    desc: 'Learn about cruel torture devices from medieval times and explore our interactive exhibits including a ghost-hunting experience',
    thumb: ImgApi.photo[110],
    clue1: '🚫 Exhibition not recommended for children under 18 without an adult.',
    clue2: '🐕 Service dogs are allowed.',
    clue3: '👨‍🦼‍➡️ The museum is wheelchair and stroller accessible.',
    date: '21 Dec 2024',
    category: 'services',
    point: 50,
    liked: false
  ),
  Event(
    id: '11',
    title: '60-Minutes of All You Can Play Games',
    desc: 'Get ready for a whole new level of fun! With new and refreshed games, an interactive dance floor, live shows, awesome new prizes, and new food (including a Grown-Up menu)',
    thumb: ImgApi.photo[111],
    clue1: '⌚ One 60 Minute All You Can Play Games Pass',
    clue2: '🚫 Not valid for birthday parties, group events or online ordering.',
    clue3: '🍕 One large 1-topping pizza',
    date: '12 May 2024',
    category: 'automotive',
    point: 200,
    liked: false
  ),
  Event(
    id: '12',
    title: 'Two Hours of Bowling and Shoe Rentals',
    desc: 'Upscale bowling inside a luxury bowling alley with glow-in-the-dark lanes, a spacious sports bar, and entertaining arcades.',
    thumb: ImgApi.photo[112],
    clue1: '👉 Choose between two-, four-, or six-person options',
    clue2: '🎫 Each voucher good for one lane',
    clue3: '🎎 Gather friends or take a date to this upscale bowling alley',
    date: '11 Dec 2024',
    category: 'property',
    point: 50,
    liked: true
  ),
  Event(
    id: '13',
    title: 'Thrill of a Lifetime: Tandem Skydive Jump',
    desc: 'Leap over a mile above Lake Michigan\'s south shore strapped to a USPA-certified instructor for stunning views of the Chicago Skyline',
    thumb: ImgApi.photo[113],
    clue1: '📽️ Video/Pictures not included but can be purchased at the time of jump.',
    clue2: '🎫 All Groupon reviews are from people',
    clue3: '✍️ No booking required. Present Groupon on arrival.',
    date: '22 Nov 2024',
    category: 'education',
    point: 200,
    liked: true
  ),
  Event(
    id: '14',
    title: '60-Minutes of All You Can Play Games',
    desc: 'Get ready for a whole new level of fun! With new and refreshed games, an interactive dance floor, live shows, awesome new prizes, and new food (including a Grown-Up menu)',
    thumb: ImgApi.photo[114],
    clue1: '⏲️ One 60 Minute All You Can Play Games Pass',
    clue2: '🥳 Not valid for birthday parties, group events or online ordering.',
    clue3: '🍕 One large 1-topping pizza',
    date: '12 May 2024',
    category: 'sport',
    point: 200,
    liked: false
  ),
  Event(
    id: '15',
    title: 'Spend on Food and Drink',
    desc: 'Welcome to a place that serves mouthwatering dishes and immerses you in rich culture. ',
    thumb: ImgApi.photo[115],
    clue1: '🙍 Limit 1 per person, may buy 2 additional as gift(s). May be repurchased every 60 days.',
    clue2: '📝 No booking required. Present Groupon on arrival.',
    clue3: '💻 Limit 1 per visit. Limit 1 per table.',
    date: '27 Sept 2024',
    category: 'holiday',
    point: 100,
    liked: true
  ),
  Event(
    id: '16',
    title: 'Choose Your World of Deals!',
    desc: 'Looking for the perfect gift to amaze your beloved ones or friends? Look no further! Groupon presents an exclusive opportunity for you to gift the joy of choice. With our Groupon Gift Card, your loved ones will embark on a journey of discovery and delight',
    thumb: ImgApi.photo[116],
    clue1: '🎂 Make their special day unforgettable.',
    clue2: '🙌 Help them celebrate their achievements.',
    clue3: '🏆 Reward your team with something special.',
    date: '31 Oct 2024',
    category: 'souvenir',
    point: 500,
    liked: true
  ),
  Event(
    id: '17',
    title: 'Stay in 4-Star Radisson Blu Aqua Hotel',
    desc: 'Radisson Blu Aqua Hotel is an ideal base for travelers visiting the Chi-town, amply supported by world-class amenities. Select options include breakfast.',
    thumb: ImgApi.photo[117],
    clue1: '🙍 Guest Rooms come with complimentary.',
    clue2: '🏠The hotel offers an indoor and outdoor pool and an outdoor track.',
    clue3: '🛒 Go on a shopping spree along the Magnificent Mile.',
    date: '2 Nov 2024',
    category: 'food',
    point: 150,
    liked: true
  ),
  Event(
    id: '18',
    title: 'Get Fit and Feel Fabulous at Blink Fitness',
    desc: 'During the year of unlimited membership, customers can enjoy full a spectrum of the Blink Fitness gyms’ amenities.',
    thumb: ImgApi.photo[118],
    clue1: '⛹️ The friendliest staff in fitness!',
    clue2: '🕶️ 40 pairs of dumbbells up to 90 pounds',
    clue3: '✨ All of the perks included in the Single Gym Access Option',
    date: '20 Dec 2024',
    category: 'services',
    point: 50,
    liked: false
  ),
  Event(
    id: '19',
    title: 'Synthetic, Full Synthetic, or High Milage Oil Change with Filter',
    desc: 'When you come in for an oil change, we do more than pour oil. We provide high-quality Valvoline oil plus powerful services to optimize your vehicle’s engine and keep you on the road longer. Get ready to experience a better oil change.',
    thumb: ImgApi.photo[119],
    clue1: '🔥 After your oil change, submit your invoice to receive your rebate!',
    clue2: '🚗 For most gas-fueled passenger cars and light-duty trucks',
    clue3: '🧪 Formulated to protect engines with over 75,000 miles',
    date: '21 Dec 2024',
    category: 'automotive',
    point: 100,
    liked: true
  ),
  Event(
    id: '20',
    title: 'Immerse in Spine-Tingling History',
    desc: 'Learn about cruel torture devices from medieval times and explore our interactive exhibits including a ghost-hunting experience',
    thumb: ImgApi.photo[120],
    clue1: '🤾‍♂️ Exhibition not recommended for children under 18 without an adult.',
    clue2: '🐶 Service dogs are allowed.',
    clue3: '🏛️ The museum is wheelchair and stroller accessible.',
    date: '21 Dec 2024',
    category: 'property',
    point: 50,
    liked: false
  )
];
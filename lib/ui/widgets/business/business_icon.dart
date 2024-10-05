import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class BusinessIcon extends StatelessWidget {
  const BusinessIcon({super.key, required this.content, required this.color});

  final Widget content;
  final String color;

  @override
  Widget build(BuildContext context) {
    LinearGradient bgColor(type) {
      switch(type) {
        case 'vip':
          return LinearGradient(
            colors: <Color>[Colors.purpleAccent.shade100, Colors.purpleAccent, Colors.purpleAccent.shade700],
            stops: const [0.25, 0.5, 1],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          );
        case 'pro':
          return LinearGradient(
            colors: <Color>[Colors.amberAccent, Colors.orange.shade400, Colors.deepOrange],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          );
        case 'basic':
          return LinearGradient(
            colors: <Color>[Colors.lightBlueAccent.shade100, Colors.lightBlueAccent, Colors.lightBlueAccent.shade700],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          );
        default:
          return LinearGradient(
            colors: <Color>[Colors.lightGreen.shade200, Colors.lightGreenAccent.shade700, Colors.lightGreen],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          );
      }
    }

    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      width: 80, 
      height: 80, 
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        gradient: bgColor(color)
      ),
      child: content
    );
  }
}

class VipIcon extends StatelessWidget {
  const VipIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 14;
    const double spacing = 4;

    return BusinessIcon(
      color: 'vip',
      content: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.chat, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.person, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.star, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
        const SizedBox(height: spacing),
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.location_on, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.verified, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.image, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
        const SizedBox(height: spacing),
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.mail, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.sell, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.extension, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ])
      ])
    );
  }
}

class ProIcon extends StatelessWidget {
  const ProIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30;
    const double spacing = 4;

    return BusinessIcon(
      color: 'pro',
      content: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.verified, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.extension, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
        const SizedBox(height: spacing),
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.location_on, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.image, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
      ])
    );
  }
}

class BasicIcon extends StatelessWidget {
  const BasicIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30;
    const double spacing = 4;

    return BusinessIcon(
      color: 'basic',
      content: Column(children: [
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.chat, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.sell, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
        const SizedBox(height: spacing),
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.location_on, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.image, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
      ])
    );
  }
}

class FreeIcon extends StatelessWidget {
  const FreeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30;
    const double spacing = 4;

    return BusinessIcon(
      color: 'free',
      content: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(Icons.sell, size: iconSize, color: Colors.white.withOpacity(0.75)),
        const SizedBox(height: spacing),
        Row(children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.location_on, size: iconSize, color: Colors.white.withOpacity(0.75)),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.image, size: iconSize, color: Colors.white.withOpacity(0.75)),
          )
        ]),
      ])
    );
  }
}


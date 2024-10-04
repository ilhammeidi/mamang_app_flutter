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
            colors: <Color>[Colors.purpleAccent.shade200, Colors.purpleAccent, Colors.purple.shade800],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          );
        case 'pro':
          return LinearGradient(
            colors: <Color>[Colors.lightBlueAccent.shade200, Colors.lightBlueAccent, Colors.lightBlue.shade800],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          );
        case 'basic':
          return LinearGradient(
            colors: <Color>[Colors.lightGreen.shade200, Colors.lightGreen, Colors.lightGreen.shade800],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          );
        default:
          return LinearGradient(
            colors: <Color>[Colors.grey.shade200, Colors.grey, Colors.grey.shade800],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          );
      }
    }

    return Container(
      width: 256,
      height: 256,
      padding: EdgeInsets.all(spacingUnit(2)),
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
    const double iconSize = 16;
    const double spacing = 4;

    return BusinessIcon(
      color: 'vip',
      content: Column(children: [
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
    const double iconSize = 32;
    const double spacing = 4;

    return BusinessIcon(
      color: 'pro',
      content: Column(children: [
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
    const double iconSize = 32;
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
    const double iconSize = 32;
    const double spacing = 4;

    return BusinessIcon(
      color: 'basic',
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


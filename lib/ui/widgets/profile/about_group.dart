import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/title_icon_card.dart';

class AboutGroup extends StatelessWidget {
  const AboutGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(children: [
      TitleIconCard(
        icon: Icons.info_outline,
        title: 'Description',
        flat: true,
        desc: 'Pellentesque scelerisque purus nibh, sit amet vestibulum nulla consectetur at',
        content: ListView(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(Icons.business_outlined, color: colorScheme.onSurface),
              ),
              title: Text('Industry', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('Food, Creative, Culinary', style: ThemeText.subtitle2,),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(Icons.calendar_month, color: ThemePalette.primaryMain),
              ),
              title: Text('Created', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('22 Mar 2024', style: ThemeText.subtitle2,),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(Icons.phone_android_outlined, color: ThemePalette.secondaryMain),
              ),
              title: Text('Contact', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('(+62)8765432190', style: ThemeText.subtitle2),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(Icons.location_on, color: ThemePalette.tertiaryMain),
              ),
              title: Text('Location', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('Chicendo Street no.105 Block A/5A - Barcelona, Spain', style: ThemeText.subtitle2,),
            ),
          ]
        )
      ),
      SizedBox(height: spacingUnit(4)),
      TitleIconCard(
        icon: Icons.list,
        title: 'Rules',
        flat: true,
        content: ListView(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            const ListTile(
              leading: Text('1', style: ThemeText.subtitle,),
              title: Text('We also welcome written recipes and cooking and baking questions'),
            ),
            SizedBox(height: spacingUnit(1)),
            const ListTile(
              leading: Text('2', style: ThemeText.subtitle,),
              title: Text(' Please stop posting that is not related to food or you will be banned from the group'),
            ),
            SizedBox(height: spacingUnit(1)),
            const ListTile(
              leading: Text('3', style: ThemeText.subtitle,),
              title: Text('Other website link recipes will only be awarded if they are original to the posted image'),
            ),
            SizedBox(height: spacingUnit(1)),
          ]
        )
      ),
      SizedBox(height: spacingUnit(4)),
      TitleIconCard(
        icon: Icons.comment,
        title: 'Social Media',
        flat: true,
        content: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(0),
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(FontAwesomeIcons.x, color: colorScheme.onSurface),
              ),
              title: Text('X (Twitter)', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('@icecream_lovers', style: ThemeText.subtitle2,),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(FontAwesomeIcons.instagram, color: Colors.purple[300]),
              ),
              title: Text('Instagram', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('@ic_lovers', style: ThemeText.subtitle2,),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: const Icon(FontAwesomeIcons.youtube, color: Colors.red),
              ),
              title: Text('YouTube', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('https://www.youtube.com/@iclovers', style: ThemeText.subtitle2,),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: Icon(FontAwesomeIcons.facebook, color: Colors.indigo[400]),
              ),
              title: Text('Facebook', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('facebook.com/groups/1234567/', style: ThemeText.subtitle2),
            ),
            SizedBox(height: spacingUnit(1)),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                radius: 18,
                child: const Icon(FontAwesomeIcons.linkedin, color: Colors.blue),
              ),
              title: Text('Linkedin', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
              subtitle: const Text('https://www.linkedin.com/groups/1234567/', style: ThemeText.subtitle2),
            ),
          ]
        )
      )
    ]);
  }
}
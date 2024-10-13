import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(spacingUnit(2)), children: const [
      VSpace(),
      Text('If you need help with anything related to being a Promotor on this App, please get in touch by selecting a topic below.', style: ThemeText.subtitle2),
      VSpace(),
      PaperCard(content: Padding(padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.lightGreen),
          title:Text('+62 81234 5678 90'),
          subtitle: Text('WhatsApp'),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      )),
      VSpaceShort(),
      PaperCard(content: Padding(padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(Icons.phone, color: Colors.cyan),
          title:Text('+62 81234 5678 90'),
          subtitle: Text('Phone'),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      )),
      VSpaceShort(),
      PaperCard(content: Padding(padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(Icons.email, color: Colors.teal),
          title:Text('support@mail.com'),
          subtitle: Text('Email'),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      )),
      VSpaceShort(),
      PaperCard(content: Padding(padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(Icons.location_on, color: Colors.red),
          title:Text('Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522'),
          subtitle: Text('Headquarter Address'),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      )),
      VSpaceShort(),
      PaperCard(content: Padding(padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
          title:Text('@appsocialmedia'),
          subtitle: Text('Instagram'),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      )),
    ]);
  }
}
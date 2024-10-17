import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/faq.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class FaqList extends StatefulWidget {
  const FaqList({super.key});

  @override
  State<FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  final List<Faq> faqData = [
    Faq(
      expandedValue: 'The first address on the page will be the default address when you check out, but you can also select any of the other addresses or add a new one at checkout. If you’re trying to add a new address, but are receiving an error message, here are some helpful tips for',
      headerValue: 'Updating Your Account Information',
    ),
    Faq(
      expandedValue: 'Surprise someone special with the gift of experiences with a Groupon Gift Card! Here\'s a quick guide to walk you through the process of purchasing, personalizing, and sending your gift card',
      headerValue: 'Gift cards - how to buy and give?',
    ),
    Faq(
      expandedValue: 'To redeem your gift card, you\'ll need a Groupon account.  If you haven\'t already, creating an account is quick and easy during the redemption process.',
      headerValue: 'How to redeem a gift card?',
    ),
    Faq(
      expandedValue: 'We design every deal page to give you all the information you\'ll need before purchasing, in distinct sections so you know where to find it. Here\'s a tour of those different sections to help you make the most of your Groupon shopping experience.',
      headerValue: 'Finding Deal Details',
    ),
    Faq(
      expandedValue: 'If you can\'t find what you\'re looking for, or you still have questions, it\'s best to check with the business directly. You can find the merchant\'s website or contact information at the bottom of the deal page.',
      headerValue: 'Questions About a Business or Deal',
    ),
    Faq(
      expandedValue: 'On a computer, you can find our deal categories to the left of the search bar—just select the category that interests you to see offers. On the mobile app, simpy tap the Categories icon at the bottom of the page.',
      headerValue: 'How to Leave a Review Through Our Surveys?',
    ),
    Faq(
      expandedValue: 'You can find your Groupon Credits balance by visiting the Account page on a computer or the My Stuff menu on mobile. From here, you can select Groupon Credits to view your',
      headerValue: 'Where to Find Groupon Credits in Your Account?',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.85),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Frequently Asks and Questions'),
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientSecondaryDark : ThemePalette.gradientSecondaryLight
        ),
        child: ListView(
          children: [
            /// BANNER
            Padding(
              padding: EdgeInsets.only(top: spacingUnit(5), bottom: spacingUnit(2), left: spacingUnit(2), right: spacingUnit(2)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image.asset('assets/images/question.png', height: 120),
                SizedBox(width: spacingUnit(2)),
                const Expanded(child: Text('How can we help you?', style: ThemeText.title,))
              ]),
            ),

            /// CONTENTS
            Container(
              padding: EdgeInsets.all(spacingUnit(3)),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                children: [
                  /// FAQ LIST
                  ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        faqData[index].isExpanded = isExpanded;
                      });
                    },
                    children: faqData.asMap().entries.map<ExpansionPanel>((entry) {
                      Faq item = entry.value;
                      int index = entry.key;
                              
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                faqData[index].isExpanded = !faqData[index].isExpanded;
                              });
                            },
                            child: ListTile(
                              title: Text(item.headerValue, style: ThemeText.subtitle2,),
                            ),
                          );
                        },
                        body: Padding(
                          padding: EdgeInsets.only(
                            left: spacingUnit(2),
                            right: spacingUnit(2),
                            bottom: spacingUnit(2),
                          ),
                          child: Text(item.expandedValue),
                        ),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  ),
                  const VSpace(),

                  /// CONTACT BUTTON
                  Container(
                    padding: EdgeInsets.all(spacingUnit(1)),
                    decoration: BoxDecoration(
                      borderRadius: ThemeRadius.small,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Column(children: [
                      const Text('Still no luck? We can help!', style: ThemeText.subtitle,),
                      const SizedBox(height: 8),
                      const Text('Contact us and we’ll get back to you as soon as possible.', textAlign: TextAlign.center, style: ThemeText.paragraph,),
                      const VSpaceShort(),
                      FilledButton(
                        onPressed: () {
                          Get.toNamed('/contact');
                        },
                        style: ThemeButton.primary,
                        child: const Text('Contact Us'),
                      )
                    ],)
                  ),
                  const VSpaceBig(),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/expanded_section.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String _paymenMethod = '';

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.all(spacingUnit(1)),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        /// CREDIT CARD
        PaperCard(
          flat: true,
          content: ListTile(
            leading: Icon(Icons.credit_card, size: 36, color: colorScheme.onPrimaryContainer),
            title: const Text('Credit Card', style: ThemeText.subtitle),
            subtitle: const Text('Payment with credit card', style: ThemeText.paragraph),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 24, color: colorScheme.onSurfaceVariant),
          )
        ),
        SizedBox(height: spacingUnit(1)),

        /// E-WALLET
        PaymentExpanded(
          title: 'E-Wallet',
          subtitle: 'Choose your e-wallet platform',
          icon: Icons.credit_card,
          isExpanded: _paymenMethod == 'ewallet',
          onTap: () {
            setState(() {
              _paymenMethod = 'ewallet';
            });
          },
          child: Container(
            child: Text('Detail'),
          ),
        ),
        SizedBox(height: spacingUnit(1)),

        /// VIRTUAL ACCOUNT
        PaymentExpanded(
          title: 'Virtual Account',
          subtitle: 'Choose virtual account bank',
          icon: Icons.contacts,
          isExpanded: _paymenMethod == 'vac',
          onTap: () {
            setState(() {
              _paymenMethod = 'vac';
            });
          },
          child: Container(
            child: Text('Detail'),
          ),
        ),
        SizedBox(height: spacingUnit(1)),

        /// TRANSFER BANK
        PaymentExpanded(
          title: 'Bank Transfer',
          subtitle: 'Choose bank for transfer method',
          icon: Icons.account_balance,
          isExpanded: _paymenMethod == 'transfer',
          onTap: () {
            setState(() {
              _paymenMethod = 'transfer';
            });
          },
          child: Container(
            child: Text('Detail'),
          ),
        ),
        SizedBox(height: spacingUnit(1)),
      ]
    );
  }
}

class PaymentExpanded extends StatefulWidget {
  const PaymentExpanded({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
    required this.isExpanded,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;
  final bool isExpanded;
  final Function onTap;

  @override
  State<PaymentExpanded> createState() => _PaymentExpandedState();
}

class _PaymentExpandedState extends State<PaymentExpanded> with SingleTickerProviderStateMixin {
  bool _rotateIcon = false;
  
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        widget.onTap();

        setState(() {
          _rotateIcon = !_rotateIcon;
        });
        if(_rotateIcon) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: PaperCard(
        flat: true,
        colouredBorder: widget.isExpanded,
        content: Column(
          children: [
            ListTile(
              leading: Icon(widget.icon, size: 36, color: colorScheme.onPrimaryContainer),
              title: Text(widget.title, style: ThemeText.subtitle),
              subtitle: Text(widget.subtitle, style: ThemeText.paragraph),
              trailing: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.25).animate(_controller),
                child: Icon(Icons.arrow_forward_ios_outlined, size: 24, color: colorScheme.onSurfaceVariant)
              ),
            ),
            ExpandedSection(
              expand: widget.isExpanded,
              child: widget.child
            )
          ],
        )
      ),
    );
  }
}
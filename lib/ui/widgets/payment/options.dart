import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/expanded_section.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/bank_list.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/wallet_list.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key, required this.paymentMethod, required this.setPaymentMethod});

  final String paymentMethod;
  final Function(String) setPaymentMethod;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: spacingUnit(2)),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        /// CREDIT CARD
        InkWell(
          onTap: () {
            widget.setPaymentMethod('credit-card');
          },
          child: PaperCard(
            flat: true,
            colouredBorder: widget.paymentMethod == 'credit-card',
            content: ListTile(
              leading: Icon(Icons.credit_card, size: 36, color: colorScheme.onPrimaryContainer),
              title: const Text('Credit Card', style: ThemeText.subtitle),
              subtitle: const Text('Payment with credit card', style: ThemeText.paragraph),
              trailing: widget.paymentMethod == 'credit-card' ?
                Icon(Icons.check_circle, color: ThemePalette.primaryMain)
                : Icon(Icons.circle_outlined, color: colorScheme.outline),
            )
          ),
        ),
        SizedBox(height: spacingUnit(2)),

        /// E-WALLET
        PaymentExpanded(
          title: 'E-Wallet',
          subtitle: 'Choose your e-wallet platform',
          icon: Icons.wallet,
          isExpanded: widget.paymentMethod == 'ewallet',
          onTap: () {
            widget.setPaymentMethod('ewallet');
          },
          child: const WalletList()
        ),
        SizedBox(height: spacingUnit(2)),

        /// VIRTUAL ACCOUNT
        PaymentExpanded(
          title: 'Virtual Account',
          subtitle: 'Choose virtual account bank',
          icon: Icons.contacts,
          isExpanded: widget.paymentMethod == 'vac',
          onTap: () {
            widget.setPaymentMethod('vac');
          },
          child: const BankList()
        ),
        SizedBox(height: spacingUnit(2)),

        /// TRANSFER BANK
        PaymentExpanded(
          title: 'Bank Transfer',
          subtitle: 'Choose bank for transfer method',
          icon: Icons.account_balance,
          isExpanded: widget.paymentMethod == 'transfer',
          onTap: () {
            widget.setPaymentMethod('transfer');
          },
          child: const BankList()
        ),
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
  final Function() onTap;

  @override
  State<PaymentExpanded> createState() => _PaymentExpandedState();
}

class _PaymentExpandedState extends State<PaymentExpanded> with SingleTickerProviderStateMixin {
  late AnimationController rotateController;
  late Animation<double> animation; 

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runRotateCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100)
    );
    animation = CurvedAnimation(
      parent: rotateController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runRotateCheck() {
    if(widget.isExpanded) {
      rotateController.forward();
    }
    else {
      rotateController.reverse();
    }
  }

  @override
  void didUpdateWidget(PaymentExpanded oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runRotateCheck();
  }

  @override
  void dispose() {
    rotateController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: widget.onTap,
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
                turns: Tween(begin: 0.0, end: 0.25).animate(animation),
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
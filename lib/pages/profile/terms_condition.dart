import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    var markdown = """
These Exoscale Services Terms and Conditions govern the Order(s) entered
into between Client and Supplier for the provision of IaaS Cloud
Computing Services. Supplier and Client are hereinafter referred to
individually as a "**Party**" and collectively, as the "**Parties**".

Applicable starting January 16th, 2019
[Previous version](https://github.com/exoscale/terms/blob/master/terms-previous.markdown)
[Compare](https://github.com/exoscale/terms/commits/master)

&nbsp;

## 1. Definitions

"**Agreement**" means any Order and these Terms and Conditions
collectively.

"**Affiliate**" means an entity that, now or in the future, directly or
indirectly Controls, is Controlled by or is under common Control with a
Party. For purposes of the foregoing, "**Control**" shall mean the
ownership of more than fifty percent (50%) of the (i) voting rights of
said entity or (ii) ownership interest in said entity.

&nbsp;

## 2. The Services

*Client may* submit the Order(s) via the Website (after having accepted
on the Website to be bound by these Terms and Conditions) or by
executing the Order and these Terms and Conditions and returning them to
the Supplier by mail, fax or email. The submission of that certain
Order(s) shall constitute an offer to buy the Services. Supplier may
accept that offer at its sole discretion (at which time both Client and
Supplier are legally bound) by way of (i) a message sent via the Website
or by mail, fax or email, thereby acknowledging receipt and acceptance
of the Order; or (ii) delivery of the Services.

&nbsp;

## 3. Fees and Payment Modalities

### 3.1 Service Fees


Supplier shall charge the Services Fees to Client as detailed in the
Order(s). Supplier shall be *entitled* to increase its Service Fees upon
a forty-five (45) day prior written notice to Client.

### 3.2 Invoicing and Payment

Unless otherwise agreed between the Parties in writing, billing for the
Services shall *commence on* the Service Commencement Time. Supplier
shall invoice all Service Fees in accordance with the frequency, method,
payment terms and currency set out in the Order and in any case in
advance except for charges that are dependent on usage which shall be
billed in arrears. In the case of period billing any partial period
shall be pro-rated except otherwise noted on order.

### 3.3 Overdue Charges

Any amount due but not received by Supplier will accrue interest from
thirty (30) days after the date of invoice to the date of payment at the
Interest Rate (pro-rated on a daily basis). Furthermore, Supplier shall
have the right to set-off any amounts due hereunder which are not paid
when due against any amounts owed to Client by Supplier pursuant to
these Terms and Conditions or any other agreement between the Parties.
In case any amount due is not received by Supplier within sixty (60)
days after the date of invoice, the Supplier shall be entitled to stop
providing the Services to the Client.

&nbsp;

## 4. Service Level Agreement (SLA)

### 4.1 Service Availability Targets

Supplier shall use commercially reasonable efforts to make the Services
available 24 hours a day, 7 days a week, with an overall 99.95% annual
availability for the virtual machine (i.e. 365 days minus 4hours20min),
except for:

- Planned downtime and maintenance events;

- Force Majeure Events;

- Unavailability of the Website;

- Failures or malfunctions in any Client software, equipment or
technology; and/or

- If Client is in breach of these Terms and Conditions, including but
not limited to its payment obligations and the use of Services.

### 4.2 Incident Management Service Levels

Supplier targets to respond to incidents within the maximum following
time frame as of receipt of notice of incident within fifteen (15)
minutes.
    """;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Terms and Conditions'),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(spacingUnit(2)),
        children: [
          MarkdownBody(
            shrinkWrap: true,
            selectable: true,
            data: markdown,
            onTapLink: (text, url, title){
              debugPrint('text: $text url: $url');
            },
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(fontSize: 24), 
            ),
          ),
          const VSpaceBig(),
        ]
      )
    );
  }
}
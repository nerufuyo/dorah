import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});
  static const routeName = '/ticket-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(
        appBarTitle: 'My Tickets',
        isInfoShow: true,
        ontapped: () {},
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Center(
          child: customText(
            customTextValue: 'You don\'t have any tickets',
            customTextStyle: body2,
          ),
        ),
      ),
    );
  }
}

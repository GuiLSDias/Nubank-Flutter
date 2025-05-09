import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank/utils/colors_standard.dart';

class RequestCreditCard extends StatefulWidget {
  const RequestCreditCard({super.key});

  @override
  State<RequestCreditCard> createState() => _RequestCreditCardState();
}

class _RequestCreditCardState extends State<RequestCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.fromLTRB(16, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _requestCheveron(),
          const SizedBox(height: 12),
          _requestCard(),
        ],
      ),
    );
  }

  _requestCheveron() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(MdiIcons.creditCard, color: Colors.black),
        SizedBox(height: 8),
        Text(
          "Cartão de crédito",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Peça seu cartão de crédito sem anuidade e tenha mais controle da sua vida financeira',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _requestCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        'Pedir cartão',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

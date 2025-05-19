import 'package:flutter/material.dart';
import 'package:nubank/pages/home/model/ConfigurationAccount.dart';

class FindOutMorePage extends StatefulWidget {
  const FindOutMorePage({super.key});

  @override
  State<FindOutMorePage> createState() => _FindOutMorePageState();
}

class _FindOutMorePageState extends State<FindOutMorePage> {
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
          _findOutMore(),
          const SizedBox(height: 8),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [_findOutMoreCard(), _findOutMorePortability()],
            ),
          ),
        ],
      ),
    );
  }

  _findOutMore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          'Descubra mais',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _findOutMoreCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.only(left: 20, right: 10, top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'lib/assets/phone.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Portabilidade de salário',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sua liberdade financeira começa\ncom você escolhendo...',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: backgroundColor, // cor roxa
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text(
              'Conhecer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _findOutMorePortability() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.only(left: 20, right: 10, top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'lib/assets/phone.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Portabilidade de salário',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sua liberdade financeira começa\ncom você escolhendo...',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: backgroundColor, // cor roxa
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text(
              'Conhecer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

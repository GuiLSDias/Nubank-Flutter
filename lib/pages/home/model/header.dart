import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank/utils/colors_standard.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_profile(), _options()],
          ),
          const SizedBox(height: 32),
          _wellcome(),
        ],
      ),
    );
  }

  _profile() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: secondaryColor,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(MdiIcons.accountCircleOutline),
        ),
      ),
    );
  }

  _options() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(MdiIcons.eyeOutline, color: Colors.white),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(MdiIcons.helpCircleOutline, color: Colors.white),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person_add_alt_1_outlined, color: Colors.white),
        ),
      ],
    );
  }

  _wellcome() {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 20),
      child: const Text(
        'Ola, Dev Outlier',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

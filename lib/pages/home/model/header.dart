import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank/controllers/controller_home_page.dart';
import 'package:nubank/controllers/theme_controller.dart';
import 'package:nubank/pages/home/model/ConfigurationAccount.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    super.initState();
    _loadThemeColors();
  }

  void _loadThemeColors() async {
    final primary = await loadColor(
      'primaryColor',
      defaultColor: backgroundColor,
    );
    final secondary = await loadColor(
      'secondaryColor',
      defaultColor: secondaryColor,
    );

    setState(() {
      backgroundColor = primary;
      secondaryColor = secondary;
    });
  }

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
        margin: const EdgeInsets.only(left: 20, top: 45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: backgroundColor,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(MdiIcons.accountOutline, color: Colors.white),
        ),
      ),
    );
  }

  _options() {
    return Row(
      children: [
        GetBuilder<ControllerHomePage>(
          init: ControllerHomePage(),
          builder: (controllerHomePage) {
            return IconButton(
              onPressed: () => controllerHomePage.showValue(),
              icon: Icon(
                controllerHomePage.eyesValeu
                    ? MdiIcons.eyeOutline
                    : MdiIcons.eyeOff,
                color: Colors.white,
              ),
            );
          },
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(MdiIcons.helpCircleOutline, color: Colors.white),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person_add_alt_1_outlined, color: Colors.white),
        ),

        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Configurationaccount()),
            );
          },
          icon: Icon(MdiIcons.cogOutline, color: Colors.white),
        ),
      ],
    );
  }

  _wellcome() {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 20),
      child: const Text(
        'Ola, ...',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

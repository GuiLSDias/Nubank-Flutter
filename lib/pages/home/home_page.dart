import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank/controllers/theme_controller.dart';
import 'package:nubank/pages/home/account/account.dart';
import 'package:nubank/pages/home/creditsCard/my_credit_card.dart';
import 'package:nubank/pages/home/creditsCard/request_credit_card.dart';
import 'package:nubank/pages/home/model/ConfigurationAccount.dart';
import 'package:nubank/pages/home/model/header.dart';
import 'package:nubank/pages/home/more/find_out_more_page.dart';
import 'package:nubank/pages/home/notification/notification_page.dart';

import 'actions/menu_itens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          color: secondaryColor,
          child: Column(
            children: const [
              Header(),
              AccountNubank(),
              MenuItens(),
              MyCreditCard(),
              NotificationsPage(),
              Divider(),
              RequestCreditCard(),
              Divider(),
              FindOutMorePage(),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      child: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      preferredSize: const Size.fromHeight(0),
    );
  }
}

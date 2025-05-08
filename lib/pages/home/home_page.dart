import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank/pages/account/account.dart';
import 'package:nubank/pages/home/model/header.dart';

import '../actions/menu_itens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: const [Header(), AccountNubank(), MenuItens()],
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

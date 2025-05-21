import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nubank/controllers/themeHelpers.dart';
import 'package:nubank/pages/home/model/ConfigurationAccount.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Color? primaryColor;

  @override
  void initState() {
    super.initState();
    _loadThemeColors();
  }

  void _loadThemeColors() async {
    final primary = await ThemeHelper.getPrimaryColor();
    if (mounted) {
      setState(() {
        primaryColor = primary;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      scrollDirection: Axis.horizontal,
      child: Row(children: [_income(), _lifeNubank()]),
    );
  }

  _income() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.1,

      margin: const EdgeInsets.only(left: 20, right: 10, top: 20),
      padding:
          MediaQuery.of(context).size.width > 500
              ? const EdgeInsets.all(24)
              : const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Seu ',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            TextSpan(
              text: 'Informe de rendimentos ',
              style: TextStyle(
                color: backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '2025 já está disponível!',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  _lifeNubank() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.1,

      margin: const EdgeInsets.only(left: 20, right: 10, top: 20),
      padding:
          MediaQuery.of(context).size.width > 500
              ? const EdgeInsets.all(24)
              : const EdgeInsets.all(19),

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Conheça o ',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            TextSpan(
              text: 'Nubank Vida ',
              style: TextStyle(
                color: backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'um seguro simples e que cabe no seu bolso!',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

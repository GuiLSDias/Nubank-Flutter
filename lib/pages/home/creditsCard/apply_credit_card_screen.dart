import 'package:flutter/material.dart';
import 'package:nubank/utils/colors_standard.dart';

class ApplyCreditCardScreen extends StatefulWidget {
  const ApplyCreditCardScreen({super.key});

  @override
  State<ApplyCreditCardScreen> createState() => _ApplyCreditCardScreenState();
}

class _ApplyCreditCardScreenState extends State<ApplyCreditCardScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedir cartão de crédito'),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Complete abaixo para pedir',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),

            // Nome completo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome completo',
                ),
              ),
            ),

            SizedBox(height: 20),

            // CPF
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'CPF',
                ),
              ),
            ),

            SizedBox(height: 20),

            // Email
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            SizedBox(height: 20),

            // Confirmar Email
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Confirme seu email',
                ),
              ),
            ),

            SizedBox(height: 20),

            // Checkbox com label
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.purple;
                      }
                      return Colors.grey;
                    }),
                  ),
                  Expanded(child: Text("Aceito os termos de uso")),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  // Ação ao clicar no botão
                  print('Solicitação de cartão enviada!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'Enviar solicitação',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

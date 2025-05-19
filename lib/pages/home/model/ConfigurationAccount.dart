import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Configurationaccount extends StatefulWidget {
  const Configurationaccount({super.key});

  @override
  State<Configurationaccount> createState() => _ConfigurationaccountState();
}

class _ConfigurationaccountState extends State<Configurationaccount> {
  Color _primaryColor = const Color.fromRGBO(155, 59, 218, 1);
  Color _secondaryColor = const Color.fromRGBO(240, 241, 245, 1);

  void _showColorPicker(
    Color currentColor,
    void Function(Color) onColorPicked,
  ) {
    Color selectedColor = currentColor;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Escolha uma cor'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: currentColor,
                onColorChanged: (color) => selectedColor = color,
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                child: const Text('Aplicar'),
                onPressed: () {
                  onColorPicked(selectedColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: _primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          secondary: _secondaryColor,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configuração de Tema'),
          backgroundColor: _primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                title: const Text('Cor Primária'),
                trailing: CircleAvatar(backgroundColor: _primaryColor),
                onTap:
                    () => _showColorPicker(_primaryColor, (color) {
                      setState(() => _primaryColor = color);
                    }),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Cor Secundária'),
                trailing: CircleAvatar(backgroundColor: _secondaryColor),
                onTap:
                    () => _showColorPicker(_secondaryColor, (color) {
                      setState(() => _secondaryColor = color);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

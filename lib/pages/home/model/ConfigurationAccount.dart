import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank/utils/colors_standard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configurationaccount extends StatefulWidget {
  const Configurationaccount({super.key});

  @override
  State<Configurationaccount> createState() => _ConfigurationaccountState();
}

Color backgroundColor = const Color.fromRGBO(155, 59, 218, 1);
Color secondaryColor = const Color.fromRGBO(240, 241, 245, 1);

class _ConfigurationaccountState extends State<Configurationaccount> {
  //Color _secondaryColor = const Color.fromRGBO(240, 241, 245, 1);
  Color _foregroundColor = Colors.white;

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
      _foregroundColor =
          backgroundColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white;
    });
  }

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
              child: ColorPicker(
                pickerColor: currentColor,
                onColorChanged: (color) {
                  selectedColor = color;
                },
                enableAlpha: false,
                displayThumbColor: true,
                paletteType: PaletteType.hsv, // Similar ao da imagem
                labelTypes: const [], // Sem labels adicionais
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
        primaryColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: backgroundColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configuração de Tema'),
          backgroundColor: backgroundColor,
          foregroundColor: _foregroundColor,
        ),
        body: Container(
          color: secondaryColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                title: const Text('Cor Primária'),
                trailing: CircleAvatar(child: Icon(MdiIcons.palette)),
                onTap:
                    () => _showColorPicker(backgroundColor, (color) {
                      setState(() {
                        backgroundColor = color;
                        // Update foreground color dynamically
                        _foregroundColor =
                            backgroundColor.computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white;
                      });
                      saveColor('primaryColo', color);
                    }),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Cor Secundária'),
                trailing: CircleAvatar(child: Icon(MdiIcons.palette)),
                onTap:
                    () => _showColorPicker(secondaryColor, (color) {
                      setState(() => secondaryColor = color);
                      saveColor('secondaryColor', color);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveColor(String key, Color color) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, color.value);
  }

  Future<Color> loadColor(String key, {required Color defaultColor}) async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt(key);
    return colorValue != null ? Color(colorValue) : defaultColor;
  }
}

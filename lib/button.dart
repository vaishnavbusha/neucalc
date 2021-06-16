import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Neubutton extends StatelessWidget {
  final String symbol;
  final Color color;
  final Function buttononclick;
  Neubutton(
      {required this.symbol, required this.color, required this.buttononclick});
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      duration: Duration(milliseconds: 10),
      provideHapticFeedback: false,
      onPressed: () {
        buttononclick(symbol);
      },
      style: NeumorphicStyle(
        shadowLightColor: Colors.transparent,
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.circle(),
        lightSource: LightSource.topRight,
        depth: 9,
      ),
      child: Container(
        child: Center(
            child: Text(
          symbol,
          textScaleFactor: 2,
          style: GoogleFonts.montserrat(textStyle: TextStyle(color: color)),
        )),
        width: 50,
        height: 50,
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.IsDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}

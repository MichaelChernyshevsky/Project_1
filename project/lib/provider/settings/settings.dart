import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsProvider extends ChangeNotifier {
  bool chousecolor = false;
  void changeColor() {
    chousecolor = !chousecolor;
  }
}

class ColorDark {
  Color text = Colors.white;
  Colors text_2 = HexColor('#4E4E50') as Colors;
  Colors backgroungMain = HexColor('#1A1A1D') as Colors;
  Colors backgroungAdd = HexColor('#C3073F') as Colors;
  Colors icon = HexColor('#950740') as Colors;
  Colors another = HexColor('#1A1A1D') as Colors;
}

class ColorLight {
  Color text = Colors.black;
  Colors text_2 = HexColor('#8E8D8A') as Colors;
  Colors backgroungMain = HexColor('#D8C3A5') as Colors;
  Colors backgroungAdd = HexColor('#EAE7DC') as Colors;
  Colors icon = HexColor('#E85A4F') as Colors;
  Colors another = HexColor('#E98074') as Colors;
}

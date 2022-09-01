import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


  TextStyle mystyle(double size,[Color? color,FontWeight fw = FontWeight.w700]){
   return GoogleFonts.montserrat(
     fontSize: size,
     color: color,
     fontWeight: fw
   );
 }










//error: The parameter 'color' can't have a value of 'null' because of its type, but the implicit default value is 'null'.
// (missing_default_value_for_parameter at [floom] lib\variables.dart:5)
// https://stackoverflow.com/questions/71148952/flutter-dart-the-parameter-colour-cant-have-a-value-of-null-because-of-its

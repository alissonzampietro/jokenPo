import 'package:flutter/material.dart';
import 'package:joken_po/Game.dart';

void main() {
 /*
 * Defining material app as main object
 * */
  runApp(MaterialApp(
    home: Game(),
    debugShowCheckedModeBanner: false,
    title: 'Joken Po',
  ));
}
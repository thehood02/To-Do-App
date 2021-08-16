import 'package:flutter/material.dart';
import 'button_layout.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Demo App',
            style: TextStyle(color: Color(0xFFAD00FF)),
          ),
          backgroundColor: Color(0xFF031442),
        ),
        body: SizedBox.expand(
            child: Container(
                color: Color(0xFF070337),
                child: Column(children: [
                  ButtonLayout('Daily'),
                  ButtonLayout('Regular'),
                  ButtonLayout('Projects'),
                  ButtonLayout('Resources'),
                  ButtonLayout('Trash Can'),
                ]))));
  }
}

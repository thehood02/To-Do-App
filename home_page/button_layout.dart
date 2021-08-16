import 'package:flutter/material.dart';
import '../categories/daily_tasks/daily_tasks.dart';

class ButtonLayout extends StatelessWidget {
  String _text;

  ButtonLayout(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
      width: double.infinity,
      height: 95,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0000BE),
            const Color(0xFFE300E3),
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: TextButton(
        child: Text(
          _text,
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DailyTasks()),
          );
        },
      ),
    );
  }
}

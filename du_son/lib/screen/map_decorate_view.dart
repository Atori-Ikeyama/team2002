import 'package:flutter/material.dart';

class MapDecorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            const Color(0xffd3e1a5).withOpacity(0.2),
            const Color(0xffe4a972).withOpacity(0.2),
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
    ));
  }
}

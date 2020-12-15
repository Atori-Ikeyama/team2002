import 'package:flutter/material.dart';

class MapDecorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      body: stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  //const Color(0xff5360c6).withOpacity(0.2),
                  //const Color(0xffa459c8).withOpacity(0.2),
                  const Color(0xffd3e1a5).withOpacity(0.2),
                  const Color(0xffe4a972).withOpacity(0.2),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}

import 'package:flutter/material.dart';

class FlexBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          Expanded(
            // fit: FlexFit.tight,
            // flex: 3,
            child: Container(
                height: 200,
                child: Image.asset(
                  'assets/images/Favourite (2).png',
                )),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
                height: 200,
                child: Image.asset('assets/images/Favourite (2).png')),
          ),
          Flexible(
            fit: FlexFit.tight,
           
            child: Container(
                height: 200,
                child: Image.asset('assets/images/Favourite (2).png')),
          )
        ],
      ),
    );
  }
}

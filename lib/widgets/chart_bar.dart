import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double samount;
  final double spctoftotal;

  ChartBar(this.label, this.samount, this.spctoftotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return Column(
          children: <Widget>[
            Container(
                height: constraint.maxHeight * 0.10,
                child: FittedBox(child: Text(label))),
            SizedBox(
              height: constraint.maxHeight * 0.04,
            ),
            Container(
              height: constraint.maxHeight * 0.7,
              width: 15,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.orangeAccent, width: 2.0),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: spctoftotal,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.04,
            ),
            Container(
              height: constraint.maxHeight * 0.10,
              child: FittedBox(
                child: Text('\$${samount.toStringAsFixed(0)}'),
              ),
            ),
          ],
        );
      },
    );
  }
}

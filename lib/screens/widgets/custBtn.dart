import 'package:calc_drako/constants/colors.dart';
import 'package:calc_drako/provider/calc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustBtn extends StatelessWidget {
  const CustBtn({
    super.key,
    required this.label,
    this.clr = Colors.white,
  });

  final String label;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CalcProvider>(context, listen: false).setValue(label);
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: CustColors.priColor2,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: clr,
            ),
          ),
        ),
      ),
    );
  }
}

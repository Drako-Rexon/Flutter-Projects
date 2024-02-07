import 'package:calc_drako/constants/colors.dart';
import 'package:calc_drako/data/btnList.dart';
import 'package:calc_drako/provider/calc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Consumer<CalcProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldCalc(
                ctrl: provider.compController,
              ),
            ),
            const Spacer(),
            Container(
              height: h * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: CustColors.priColor1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) => buttonList[index]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(4, (index) => buttonList[index + 4]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(4, (index) => buttonList[index + 8]),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    3, (index) => buttonList[index + 12]),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    3, (index) => buttonList[index + 16]),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<CalcProvider>(context, listen: false)
                                .setValue("=");
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              alignment: Alignment.center,
                              height: 120,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: CustColors.fnBtnClr),
                              child: const Text(
                                "=",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class TextFieldCalc extends StatelessWidget {
  TextFieldCalc({super.key, required this.ctrl});
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      decoration: const InputDecoration(
        fillColor: CustColors.priColor1,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
      ),
      style: const TextStyle(fontSize: 30),
      readOnly: true,
      showCursor: true,
      autofocus: true,
    );
  }
}

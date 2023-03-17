import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tip_time_provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var subtotal = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: context.watch<TipTimeProvider>().costController,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Column(
              children: context
                  .read<TipTimeProvider>()
                  .radioGroupValues
                  .entries
                  .map((e) => ListTile(
                        leading: Radio(
                          value: e.key,
                          groupValue:
                              context.watch<TipTimeProvider>().getSelectedRadio,
                          onChanged: (newValue) {
                            context
                                .read<TipTimeProvider>()
                                .setSelectedRadio(newValue);
                          },
                        ),
                        title: Text("${e.value}"),
                      ))
                  .toList()),
          Theme(
            data: ThemeData(
              primarySwatch: Colors.blue, //color principal
              switchTheme: SwitchThemeData(
                //color del switch cuando está activo
                thumbColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 89, 0),
                ),
                trackColor: MaterialStateProperty.all<Color>(Colors.grey),
                //color del switch cuando está inactivo
                overlayColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(32, 255, 89, 0),
                ),
              ),
            ),
            child: SwitchListTile(
              secondary: Icon(Icons.credit_card),
              title: Text("Round up tip"),
              value: context.watch<TipTimeProvider>().isSelected,
              onChanged: (newVal) {
                context.read<TipTimeProvider>().setIsSelected(newVal);
              },
            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            color: Color.fromARGB(255, 255, 89, 0),
            child: Text("CALCULATE"),
            onPressed: () {
              context.read<TipTimeProvider>().tipCalculation();
            },
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Subtotal: \$${context.watch<TipTimeProvider>().costController.text}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  "Tip: \$${context.watch<TipTimeProvider>().tipAmount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  "Total: \$${(context.watch<TipTimeProvider>().tipAmount + double.parse(context.watch<TipTimeProvider>().costController.text)).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 89, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

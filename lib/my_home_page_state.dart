//  //
//  Import LIBRARIES
//  Import FILES
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//  PARTS
//  SIGNALS

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({super.key});

  @override
  _MyHomePageStateState createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextEditingController Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp('[A-Z]'),
            ),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your text',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          printCurrentValues();
          updateValues();
        },
        tooltip: 'Update',
        child: const Icon(Icons.update),
      ),
    );
  }

  void printCurrentValues() {
    debugPrint('Current text: ${myController.text}');
    debugPrint('Current selection: ${myController.selection}');
  }

  void updateValues() {
    myController.text = 'New text value';
    myController.selection = TextSelection.fromPosition(
      TextPosition(offset: myController.text.length),
    );
  }
}

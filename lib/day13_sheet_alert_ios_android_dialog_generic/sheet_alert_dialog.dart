import 'package:flutter/material.dart';

class SheetAlertDialog extends StatefulWidget {
  const SheetAlertDialog({super.key});

  @override
  State<SheetAlertDialog> createState() => _SheetAlertDialogState();
}

class _SheetAlertDialogState extends State<SheetAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _showModalSheet();
              },
              child: Text('showModalSheet'))
        ],
      )),
    );
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: Center(
                child: Text('Modal Sayfası'),
              ));
        });
  }
}

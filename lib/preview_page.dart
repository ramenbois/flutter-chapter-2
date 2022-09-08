import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final ThemeData? themeData;

  const PreviewPage({Key? key, this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData ?? Theme.of(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preview Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('An awesome button!'),
          ),
        ),
      ),
    );
  }
}

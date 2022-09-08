import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'preview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple.shade100,
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
          bodyText2: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  void _moveToPreviewPage(BuildContext context, ThemeData themeData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PreviewPage(
        themeData: themeData,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Theme Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Theme Preview:'),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () => _moveToPreviewPage(
                    context,
                    ThemeData(
                      primarySwatch: Colors.red,
                      scaffoldBackgroundColor: Colors.pink.shade100,
                    )),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    const Text('Red Theme'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () => _moveToPreviewPage(
                    context,
                    ThemeData(
                      primarySwatch: Colors.green,
                      scaffoldBackgroundColor: Colors.lime.shade100,
                      elevatedButtonTheme: ElevatedButtonThemeData(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.indigo.shade400,
                          ),
                          shape: MaterialStateProperty.all(
                            const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 10),
                    const Text('Green Theme'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chapter_2/person_card.dart';

import 'list_person_page.dart';
import 'person.dart';
import 'post_page.dart';
import 'services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Person? person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            person != null
                ? PersonCard(person: person!)
                : const Text('no data'),
            ElevatedButton(
                onPressed: () async {
                  Person? result = await Services.getUserById(2);

                  if (result != null) {
                    setState(() {
                      person = result;
                    });
                  }
                },
                child: const Text('GET')),
            ElevatedButton(
                onPressed: () async {
                  Person? result = await Services.createUser(
                    'John',
                    'Doe',
                    'johndoe@gmail.com',
                  );

                  if (result != null) {
                    setState(() {
                      person = result;
                    });
                  }
                },
                child: const Text('POST')),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PostPage(),
              )),
              child: const Text('Ke Post Page'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListPersonPae(),
              )),
              child: const Text('Daftar Person'),
            ),
          ],
        ),
      ),
    );
  }
}

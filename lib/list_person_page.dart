import 'package:flutter/material.dart';

import 'person.dart';
import 'person_card.dart';

class ListPersonPae extends StatelessWidget {
  const ListPersonPae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Person?>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Person?>? persons = snapshot.data;

            return SingleChildScrollView(
              child: Column(
                children: persons!
                    .map((person) => PersonCard(
                          person: person!,
                        ))
                    .toList(),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

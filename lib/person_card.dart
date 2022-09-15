import 'package:flutter/material.dart';

import 'person.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('ID: ${person.id}'),
        title: Text(
          'Nama: ${person.name}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Email: ${person.email}',
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../lib/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final firestore = FirebaseFirestore.instance;

  final seedFile = File('scripts/seed_data.json');
  Map<String, dynamic> seed;
  if (await seedFile.exists()) {
    print('Loading seed data from scripts/seed_data.json');
    seed = jsonDecode(await seedFile.readAsString()) as Map<String, dynamic>;
  } else {
    print('No seed file found — using embedded sample data');
    seed = {
      "users": [
        {"id": "user1", "name": "Alice", "email": "alice@example.com"},
        {"id": "user2", "name": "Bob", "email": "bob@example.com"}
      ],
      "posts": [
        {"id": "post1", "authorId": "user1", "title": "Hello", "body": "First post"},
        {"id": "post2", "authorId": "user2", "title": "Hi", "body": "Second post"}
      ]
    };
  }

  for (final entry in seed.entries) {
    final collection = entry.key;
    final items = (entry.value as List).cast<Map<String, dynamic>>();
    print('Seeding collection: $collection (${items.length} documents)');
    // Firestore batch limit is 500; split if needed
    const batchSize = 400;
    for (var i = 0; i < items.length; i += batchSize) {
      final batch = firestore.batch();
      final chunk = items.sublist(i, (i + batchSize).clamp(0, items.length));
      for (final doc in chunk) {
        final id = doc['id']?.toString();
        final docData = Map<String, dynamic>.from(doc)..remove('id');
        final ref = id == null
            ? firestore.collection(collection).doc()
            : firestore.collection(collection).doc(id);
        batch.set(ref, docData);
      }
      await batch.commit();
      print('  Committed ${chunk.length} docs to $collection');
    }
  }

  print('Seeding finished.');
}

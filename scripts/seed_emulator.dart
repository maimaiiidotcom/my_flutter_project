import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../lib/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final host = Platform.environment['FIRESTORE_EMULATOR_HOST'] ?? 'localhost:8080';
  final parts = host.split(':');
  final emulatorHost = parts[0];
  final emulatorPort = parts.length > 1 ? int.tryParse(parts[1]) ?? 8080 : 8080;

  final firestore = FirebaseFirestore.instance;
  firestore.useFirestoreEmulator(emulatorHost, emulatorPort);
  print('Connected to Firestore emulator at $emulatorHost:$emulatorPort');

  final seedFile = File('scripts/seed_data.json');
  Map<String, dynamic> seed;
  if (await seedFile.exists()) {
    print('Loading seed data from scripts/seed_data.json');
    seed = jsonDecode(await seedFile.readAsString()) as Map<String, dynamic>;
  } else {
    print('No seed file found — using embedded sample data');
    seed = {
      "users": [
        {"id": "emu_user1", "name": "EmuAlice"},
        {"id": "emu_user2", "name": "EmuBob"}
      ]
    };
  }

  for (final entry in seed.entries) {
    final collection = entry.key;
    final items = (entry.value as List).cast<Map<String, dynamic>>();
    print('Seeding emulator collection: $collection (${items.length} documents)');
    final batch = firestore.batch();
    for (final doc in items) {
      final id = doc['id']?.toString();
      final docData = Map<String, dynamic>.from(doc)..remove('id');
      final ref = id == null
          ? firestore.collection(collection).doc()
          : firestore.collection(collection).doc(id);
      batch.set(ref, docData);
    }
    await batch.commit();
    print('  Committed ${items.length} docs to $collection (emulator)');
  }

  print('Emulator seeding finished.');
}

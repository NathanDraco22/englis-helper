import 'package:english_helper/app/presentation/home_view.dart';
import 'package:english_helper/data/services/hive_db/hive_db_services.dart';
import 'package:english_helper/domain/repositories/vocabulary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Map>("vocabulary");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => VocabularyRepo(HiveDBServices()),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const HomeView(),
        theme: ThemeData.dark(useMaterial3:  true),
      ),
    );
  }
}

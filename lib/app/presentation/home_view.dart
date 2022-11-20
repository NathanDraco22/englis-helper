import 'package:english_helper/app/logic/voc_cubit/vocabulary_cubit.dart';
import 'package:english_helper/app/widgets/creation_alert.dart';
import 'package:english_helper/domain/repositories/vocabulary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/vocabulary.dart';
import '../widgets/paginated.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VocabularyCubit(RepositoryProvider.of<VocabularyRepo>(context)),
      child: Scaffold(
        appBar: AppBar(
          actions: const [IconAddButton()],
          title: const Text("RM Vocabulary"),
        ),
        body: const VocabularyTable(),
      
      ),
    );
  }
}

class IconAddButton extends StatelessWidget {
  const IconAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final result =  showDialog<Vocabulary>(
          context: context, 
          builder: (context) => const CreationAlert(),
        );
        result.then((value) {
          if (value == null) return;
          context.read<VocabularyCubit>().createVocabulary(value);
        });
        
      }, 
      icon: const Icon(Icons.add, color: Colors.green,),
     
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/vocabulary.dart';
import '../logic/voc_cubit/vocabulary_cubit.dart';


class VocabularyTable extends StatelessWidget {
  const VocabularyTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<VocabularyCubit>(context);
    cubit.getAllVocabularies();
    return BlocBuilder<VocabularyCubit, VocabularyState>(
      buildWhen: (previous, current) {
        final types = <Type>[VocabularyLoadingState , VocabularyLoadedState];
        return types.any((element) => element == current.runtimeType );
      },
      builder: (context, state) {
        if(state is VocabularyInitial) return Container();
        if(state is VocabularyLoadingState ){
           return const Center(child: CircularProgressIndicator(),);
        }
        state as VocabularyLoadedState;
        return SingleChildScrollView(
          child: PaginatedDataTable(
            dataRowHeight: 48,
            source: VocabularySource(state.vocabularies, cubit),
            columns: const [
              DataColumn(label: Text("Word")),
              DataColumn(label: Text("Pronounce")),
              DataColumn(label: Text("Meaning")),
              DataColumn(label: Text("Mind")),
            ],
          ),
        );
      },
    );
  }
}

class VocabularySource extends DataTableSource {
  final List<Vocabulary> vocabularies;
  final VocabularyCubit vocabularyCubit;

  VocabularySource(this.vocabularies, this.vocabularyCubit);

  @override
  DataRow? getRow(int index) {
    final model = vocabularies[index];
    return DataRow(
      onLongPress: () {
        vocabularyCubit.deleteVocabulary(model);
      },
      cells: [
      DataCell(Text(model.word)),
      DataCell(Text(model.pronounce)),
      DataCell(Text(model.meaning)),
      DataCell(SizedBox(width: 200,child: Text(model.mind, maxLines: 3))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vocabularies.length;

  @override
  int get selectedRowCount => 0;
}

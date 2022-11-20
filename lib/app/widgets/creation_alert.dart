import 'package:english_helper/domain/models/vocabulary.dart';
import 'package:flutter/material.dart';



class CreationAlert extends StatelessWidget {
  const CreationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Vocabulary.fromDefault();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: AlertDialog(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
        title: const Text("Create New Word"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: ()=> Navigator.pop(context), 
            child: const Text("Close")
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.green),
            onPressed: (){
              if(formKey.currentState?.validate() == false)return;
              Navigator.pop(context,model);
            }, 
            child: const Text("Agregar")
          ),
    
        ],
        content: SizedBox(
          width: 250,
          height: 450,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFields(title: "Word",onChange: (value) => model.word = value,),
                  CustomFields(title: "Pronounce",onChange: (value) => model.pronounce = value,),
                  CustomFields(title: "Meaning",onChange: (value) => model.meaning = value,),
                  CustomFields(title: "Mind",onChange: (value) => model.mind = value, maxLines: 4,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomFields extends StatelessWidget {
  const CustomFields({super.key, required this.title, this.onChange,  this.maxLines = 1});

  final String title;
  final void Function(String value)? onChange;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) return "required";
        if (value.length < 2) return "Required";
        return null;
      },
      decoration: InputDecoration(
        labelText: title,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20)),
        border: const OutlineInputBorder()
      ),
      onChanged: onChange,
    );
  }
}


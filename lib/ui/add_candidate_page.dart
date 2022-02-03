import 'package:election_system/utils/candidate.dart';
import 'package:flutter/material.dart';


class AddCandidatePage extends StatelessWidget {
   AddCandidatePage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  Candidate? candidate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add a candidate"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(),
                  hintText: "Candidate name"
                ),
                controller: nameController,
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  if (nameController.text.trim().isNotEmpty && nameController.text.trim().length >1){
                    candidate = Candidate(name: nameController.text, votes: 0);
                  }

                    Navigator.pop(context, candidate);
                },
                child: const Text("Add Candidate")
            )
          ],
        ),
      ),
    );
  }
}

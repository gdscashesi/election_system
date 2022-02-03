import 'package:election_system/ui/add_candidate_page.dart';
import 'package:election_system/ui/election_results.dart';
import 'package:election_system/ui/remove_candidate_page.dart';
import 'package:election_system/utils/candidate.dart';
import 'package:election_system/utils/helpers.dart';
import "package:flutter/material.dart";


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Candidate> candidates = [];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Election system"),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> ElectionResults(list: candidates)
                      )
                  );
                },
                icon: const Icon(Icons.list_alt)
            ),


            IconButton(
                onPressed: () async{

                  List<Candidate> result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> RemoveCandidatePage(list: candidates)
                      )
                  );

                  setState(() {

                  candidates = [];
                  candidates = result;

                  });
                },
                icon: const Icon(Icons.person_remove)
            ),
          ],
        ),

        body: Column(
          children: [
            const Text("Candidates", style: TextStyle(fontSize: 20),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: candidates.isNotEmpty ?
              ListView.separated(
                separatorBuilder: (context,index){
                  return const Divider(
                    endIndent: 60,
                    indent: 60,
                  );
                },
                itemCount: candidates.length,
                  itemBuilder: (context,index) {
                    return ListTile(
                      title: Text(candidates[index].name),
                      leading: Container(
                        color: Colors.red,
                        child: IconButton(
                          icon:const Icon(Icons.remove),
                          onPressed: (){
                            candidates[index].decreaseVote();
                          },
                        ),
                      ),
                      trailing: Container(
                        color: Colors.green,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: (){
                            candidates[index].increaseVote();
                          },
                        ),
                      ),
                    );
                  }
              ) :
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("No candidates in this election"),
                    OutlinedButton.icon(
                  onPressed: ()async{
                    Candidate? newCandidate = await Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>  AddCandidatePage()
                        )
                    );

                    bool result = false;
                    if (newCandidate != null){
                      setState(() {
                        result = addCandidate(candidates, newCandidate);
                        showSnack(Colors.green, "Candidate added successful", context);

                      });
                    }

                    if (!result){
                      showSnack(Colors.red, "We couldn't add the candidate", context);
                    }
                  },
                        icon: const Icon(Icons.add),
                        label: const Text("Add the first candidate")
                    )
                  ],
                ),
              ),
            )
          ],
        ),


        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()async {
            Candidate? newCandidate = await Navigator.push(context,
                MaterialPageRoute(builder: (context)=>  AddCandidatePage()
                )
            );

            bool result = false;
            if (newCandidate != null){
              setState(() {
                result = addCandidate(candidates, newCandidate);
                showSnack(Colors.green, "Candidate added successful", context);

              });
            }

            if (!result){
              showSnack(Colors.red, "We couldn't add the candidate", context);
            }

            // showSnack()

          },
        ),
      ),
    );
  }
}

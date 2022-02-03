import 'package:election_system/utils/candidate.dart';
import 'package:election_system/utils/helpers.dart';
import "package:flutter/material.dart";


class RemoveCandidatePage extends StatefulWidget {
  List<Candidate> list;
   RemoveCandidatePage({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _RemoveCandidatePageState createState() => _RemoveCandidatePageState();
}

class _RemoveCandidatePageState extends State<RemoveCandidatePage> {
  late List<Candidate> currentList;
  @override
  void initState() {
    super.initState();
    currentList = widget.list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context, currentList);
          },
        ),
        title: const Text("Remove Candidates"),
        centerTitle: true,
      ),
      body: currentList.isNotEmpty ?
      ListView.builder(
        itemCount: currentList.length,
          itemBuilder: (context,index){
        return ListTile(
          title: Text(currentList.elementAt(index).name),
          onTap: () async{
            await showDialog(context: context, builder: (context){
              return AlertDialog(
                content: Text("Are you sure you want to remove ${currentList.elementAt(index).name}"),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text("No")
                  ),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          removeCandidate(currentList, currentList[index].name);

                        });
                         Navigator.pop(context);
                      },
                      child: const Text("Yes")
                  ),
                ],
              );
            });
          },
        );
      }) :
          const Center(
            child: Text("There are no candidates to remove"),
          )
      ,
    );
  }





}

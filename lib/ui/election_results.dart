import 'package:election_system/utils/candidate.dart';
import 'package:flutter/material.dart';


class ElectionResults extends StatefulWidget {
  List<Candidate> list;
  ElectionResults({
    Key? key,
    required this.list
  }) : super(key: key);

  @override
  State<ElectionResults> createState() => _ElectionResultsState();
}

class _ElectionResultsState extends State<ElectionResults> {
  late List<Candidate> sortedList;

  @override
  void initState() {
    super.initState();
    sortedList = widget.list;

    sortedList.sort((first,second){
      return second.votes.compareTo(first.votes);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Election Results"),
      ),
      body: widget.list.isNotEmpty ?
      ListView.builder(
        itemCount: sortedList.length,
          itemBuilder: (context,index){
          return ListTile(
            tileColor: index == 0 ? Colors.greenAccent : null,
            title: Text(sortedList[index].name),
            subtitle: Text(sortedList.elementAt(index).votes.toString()),
            trailing: index == 0 ? const Text("ELECTED") : index == 1 ? const Text("First runner up") : null,
          );
      }) :
          const Center(
            child: const Text("No Candidates to rank"),
          )
      ,
    );
  }
}

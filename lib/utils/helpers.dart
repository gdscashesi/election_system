
import 'package:election_system/utils/candidate.dart';
import 'package:flutter/material.dart';

bool addCandidate(List<Candidate> candidateList, newCandidate) {

  if(candidateList.isEmpty){
    candidateList.add(newCandidate);
    return true;
  }
  for (Candidate current in candidateList) {
    if (current == newCandidate) {
      return false;
    }
    candidateList.add(newCandidate);
    resetVoteCount(candidateList);
  }

  return true;
}



bool removeCandidate(List<Candidate> candidateList, String name) {
  int index = candidateList.indexWhere((candidate) => candidate.name == name);
//  bool result = candidateList.removeWhere((candidate) => candidate.name == name);

  //find them
  if (index == -1) {
    return false;
  }
  //remove them
  candidateList.removeAt(index);
  return true;
}



void resetVoteCount(List<Candidate> candidateList) {
  for (var candidate in candidateList) {
    candidate.votes = 0;
  }
}


void showSnack(MaterialColor color, String message, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
        backgroundColor: color,
      )
  );
}



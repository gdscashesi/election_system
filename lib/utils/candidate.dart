class Candidate {
  String name;
  late int votes;
  // int _votes;

  Candidate({required this.name, required this.votes}) {
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Candidate && name == other.name;
  }

  void increaseVote(){
    votes++;
  }

  void decreaseVote(){
    if (votes >0){
      votes--;
    }
  }

  @override
  String toString() {
    return "$name => $votes";
  }
// Candidate(this.name, this._votes) {
// votes = _votes;
// }
}

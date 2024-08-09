public interface ICasesSelector extends IApplicationSObjectSelector {
  List<Case> selectById(Set<Id> idSet);
  Case selectById(Id recordId);
  Case selectByNumber(String caseNumber);
}
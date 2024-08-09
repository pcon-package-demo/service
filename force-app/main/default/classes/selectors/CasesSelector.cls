public with sharing class CasesSelector extends ApplicationSObjectSelector implements ICasesSelector {
  public static ICasesSelector newInstance() {
    return (ICasesSelector) Application.Selector.newInstance(Case.SObjectType);
  }

  public Schema.sObjectType getSObjectType() {
    return Case.SObjectType;
  }

  public override List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Case.Id,
      Case.Description,
      Case.Subject,
      Case.CaseNumber,
      Case.InternalStatus__c
    };
  }

  private List<Schema.SObjectField> getAdditionalSObjectFieldList() {
    return new List<Schema.SObjectField>();
  }

  public List<Case> selectById(Set<Id> idSet) {
    return (List<Case>) selectSObjectsById(
      idSet == null ? new Set<Id>() : idSet
    );
  }

  public Case selectById(Id recordId) {
    List<Case> records = selectById(new Set<Id>{ recordId });
    return records.isEmpty() ? null : records.get(0);
  }

  public Case selectByNumber(String caseNumber) {
    fflib_QueryFactory qf = newQueryFactory();

    for (FieldSet fs : sObjectFieldSetList) {
      qf.selectFieldSet(fs);
    }

    qf.setCondition(Case.CaseNumber + ' = :caseNumber');
    return Database.query(qf.toSOQL());
  }
}
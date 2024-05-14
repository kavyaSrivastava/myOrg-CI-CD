public class ActionTestWithSObject {
 
 @InvocableMethod(label='Action Test With sObject' description='Given a list of sObjects (Accounts), increase employee count by one and return account ID' category='Account')
 
 public static List<String> getAccountNames(List<ConvertLeadActionRequest> objects) {
 
  List<String> accountIds = new List<String>();
 
  for (ConvertLeadActionRequest a : objects) {
  // Account retrievedAccount = [SELECT Id, NumberOfEmployees FROM Account WHERE Name =:a.Name LIMIT 1];
   //retrievedAccount.NumberOfEmployees += 1;
   //update retrievedAccount;
  // accountIds.add(retrievedAccount.Id);
  }
 
  return accountIds;
 }
     public class ConvertLeadActionRequest {
    @InvocableVariable(required=true)
    public ID leadId;

    @InvocableVariable(required=true)
    public String convertedStatus;

    @InvocableVariable
    public ID accountId;

    @InvocableVariable
    public ID contactId;

    @InvocableVariable
    public Boolean overWriteLeadSource;

    @InvocableVariable
    public Boolean createOpportunity;

    @InvocableVariable
    public String opportunityName;

    @InvocableVariable
    public ID ownerId;

    @InvocableVariable
    public Boolean sendEmailToOwner;
  }
}
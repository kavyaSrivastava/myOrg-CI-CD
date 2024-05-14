public with sharing class LwcTaskController {
    @AuraEnabled(Cacheable=true)
    
    public static List<Contact> contactRecord(Id accountId){
    try {
    List<Contact> contactList=[select Id,LastName,Phone,AccountId from Contact
    where AccountId=:accountId];
    return contactList;
    } catch (Exception e) {
    throw new AuraHandledException(e.getMessage());
    }
    }
    @AuraEnabled
    public static List<Contact> updateContact(Id ContactId,String
    Acname,string Phone){
    try {
    List<Contact> contactList=[select LastName,id,Phone,AccountId from Contact
    where Id=:ContactId];
    for(Contact contactRecord : contactList)
    {
    if(ContactId!=null && Acname!=null && Phone!=null)
    {
    contactRecord.LastName=Acname;
    contactRecord.Phone=Phone;
    }
    else if(ContactId!=null && Phone!=null && Acname==null)
    {
    contactRecord.Phone=Phone;
    }
    else if(ContactId!=null && Acname!=null && Phone==null)
    {
    contactRecord.Lastname=Acname;
    }
    }
    if(!contactList.isEmpty() && contactList.size()>0)
    {
    update contactList;
    return contactList;
    }
    return contactList;
    } catch (Exception e) {
    throw new AuraHandledException(e.getMessage());
    }
    
    }
    @AuraEnabled
    public static string deleteAccount(Id ContactId){
    try {
    List<Contact> contactList=[select LastName,id,Phone,AccountId from Contact
    where Id=:ContactId];
    if(!contactList.isEmpty() && contactList.size()>0)
    {
    delete contactList;
    return 'success';
    }
    return 'fail';
    } catch (Exception e) {
    throw new AuraHandledException(e.getMessage());
    }
    }
    }
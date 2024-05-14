public with sharing class FetchingContactsFromOrg {
    @auraEnabled(cacheable =True)
    public static List<Contact> FetchingContactsFromOrgMeth(String text) {
        String str ='%'+text+'%';
        List<Contact> conList = [SELECT ID, Email FROM Contact WHERE Email LIKE :str];
        return conList;

    }
}
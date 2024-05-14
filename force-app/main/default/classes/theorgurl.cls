public with sharing class theorgurl {

    @AuraEnabled
    public static String fetchit(){
        string urler = URL.getSalesforceBaseUrl().toString();
        return (urler);
    }
}
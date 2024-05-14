public class A6Q17HC {
    public static void meth(List<Contact> conl){
        for(Contact c: conl){
            if(c.SAME_COUNTRY_AS_USER_COMPANY__c==true){
                c.adderror('err');
            }
        }
        
    }
}
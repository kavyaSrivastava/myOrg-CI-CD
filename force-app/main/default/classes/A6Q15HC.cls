public class A6Q15HC {
    public static void meth(List<Contact> cl){
        for(contact c:cl){
            List<Contact> con = [SELECT ID FROM CONTACT WHERE AccountId =: c.AccountId AND account.Allow_multiple__c=false];
            if(con.size()>=1){
                c.adderror('cant allow multiple');
   }
        }
    }

}
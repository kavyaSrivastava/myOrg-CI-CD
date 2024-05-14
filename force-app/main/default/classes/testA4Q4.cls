@istest
public class testA4Q4 {
    @testsetup
    public static void testsetup(){
        account acc=new account();
        acc.name='ashi';
        acc.Location__c='A';
        insert acc;
        Order_Location__c oloc=new Order_Location__c();
        oloc.Travel_Location__c ='B';
        insert oloc;
        Order_Location__c oloc0=new Order_Location__c();
        oloc.Travel_Location__c ='A';
        insert oloc0;
        Order_Location__c oloc1=new Order_Location__c();
        oloc.Travel_Location__c ='c';
        insert oloc1;
        Order_Location__c oloc2=new Order_Location__c();
        oloc.Travel_Location__c ='D';
        insert oloc2;
        Order_Location__c oloc3=new Order_Location__c();
        oloc.Travel_Location__c ='E';
        insert oloc3;
        Order_Location__c oloc4=new Order_Location__c();
        oloc.Travel_Location__c ='F';
        insert oloc4;
       
        
    }
    @istest
    public static void testDistance(){
        Locationcal.orLoc();
        Order_Location__c oloc=[select id,Travel_Location__c,Total_Distance__c from Order_Location__c where Travel_Location__c='B'];
        system.assertEquals(10,oloc.Total_Distance__c);
    }

}
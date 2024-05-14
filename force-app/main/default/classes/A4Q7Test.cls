@istest
public class A4Q7Test {
    @istest
    public static void acc20(){
     List<Account> accl= [SELECT NAME FROM ACCOUNT ];
        Account20.insert20();
      System.assertEquals(20, accl.size());
    }

}
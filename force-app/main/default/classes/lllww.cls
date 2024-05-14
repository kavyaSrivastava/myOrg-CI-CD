public class lllww {
    public static void meth(List<Account> accl){
        List<Account> accll = [SELECT Id, Name FROM Account LIMIT 1];
         System.debug(accll[0]);
        delete accll[0];
       
        undelete accll[0];
        System.debug(accll[0]);
    }
}
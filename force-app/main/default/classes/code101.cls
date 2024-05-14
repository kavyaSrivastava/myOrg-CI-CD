public class code101 {
    public static void methFirst(List<Account> accl){
        Account acc = [SELECT Id,Name from Account Limit 1];
        delete acc;
        
    }

}
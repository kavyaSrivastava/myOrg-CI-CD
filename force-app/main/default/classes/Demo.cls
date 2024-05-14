public class Demo {
    public static void meth(List<Account> accl){
        Set<String> accids = new Set<String>();
        for(Account a :accl){
            accids.add(a.id);
        }
       List<Contact> conl= [Select id from contact where AccountId=:accids]; 
        delete(conl);
    }
}
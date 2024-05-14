public class ReverseOrder {
    public static List<String> ro(){
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Name FROM Account];
        List<String> ll = new List<String>();
        
        system.debug(accList);
        for(Account acc: accList){
           String s= (String) acc.Name;
            ll.add(s.reverse());
        }
        return ll;
    }

}
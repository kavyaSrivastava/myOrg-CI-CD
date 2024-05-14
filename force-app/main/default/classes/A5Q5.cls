public class A5Q5 {
    public static void meth(){
        LIst<Account> accl = [SELECT Id,Name, (SELECT ID FROM Opportunities WHERE StageName ='Closed Won') FROM Account];
        for(Account a : accl){
            if(a.Opportunities.size()>2){
                System.debug(a.Name);
            }
        }
    }

}
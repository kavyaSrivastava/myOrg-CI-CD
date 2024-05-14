public class AlphaOrder {
    public static List<Account> AlphabeticalOrder(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Name FROM Account ORDER BY Name ASC];
       /* for(Account a : accList){
            System.debug(a);
        }*/
        return accList;
    }

}
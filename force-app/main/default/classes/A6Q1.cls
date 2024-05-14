public class A6Q1 {
    public static void coninsert(List<Account> aclist){
        List<Contact> conl = new List<Contact>();
        for( Account ac: aclist){
            for(integer i=0;i< ac.NumberOfEmployees;i++){
                Contact con = new Contact();
                con.LastName = 'Default'+i;
                con.AccountId = ac.Id;
                conl.add(con);
            }
        }
        insert conl;
        
    }
}
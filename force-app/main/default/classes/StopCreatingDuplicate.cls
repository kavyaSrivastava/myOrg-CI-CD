public class StopCreatingDuplicate {
    public static void meth(Map<Id, Contact> newcontact){
        List<Contact> conl = [select id,Email, Phone from Contact];
        List<Contact> conlist = newcontact.values();
        for(Contact cc:conlist){
             for(Contact c:conl){
            if(cc.email== c.Email && cc.phone == c.phone){
                cc.adderror('xxx');
            }
        }
        
        }
       
        
    }
    public static void meth1(List<Contact> conlist){
                List<Contact> conl = [select id,Email, Phone from Contact];
        Map<String,Contact> emap = new map<string,contact>();
        
        Map<String,Contact> phonemap = new map<string,contact>();
        for(contact c: conl){
            emap.put(c.email,c);
            phonemap.put(c.phone,c);
        }
        for(contact cc: conlist){
            if(emap.containsKey(cc.email) && phonemap.containsKey(cc.Phone)){
                cc.adderror('xyxyx');
            }
        }

    }
}
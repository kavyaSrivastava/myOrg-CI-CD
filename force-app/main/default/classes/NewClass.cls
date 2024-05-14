@restresource(urlMapping='/newPost/*')
global class NewClass {
    @httppost
    global static string meth(String name, String rating){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        insert acc;
        return name;
        
    }
    @httpget
     global static List<Account> meth1(){
      return([SELECT Name,Rating,Id FROM Account Limit 5]);
        
    }
}
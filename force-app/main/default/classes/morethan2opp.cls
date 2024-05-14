public class morethan2opp {
    
    public static void displayAcc(){
        list<Opportunity> opp=[Select id, Account.Name,StageName From Opportunity where Account.Name!=null and StageName='Closed Won'];
        list<String> accid=new list<String>();
        for(Opportunity op:opp){
            accid.add(op.Account.Name);
        }
        Map<String,Integer> m1 = new Map<String,Integer>();
         for(String acc:accid){
             if(m1.containsKey(acc)){
                 m1.put(acc,m1.get(acc)+1);
             }
             else{
                  m1.put(acc,1);
             }
        }
        for(String key: m1.keySet()){
            if(m1.get(key)>2){
                System.debug(key);
            }
            
        }
    }
}
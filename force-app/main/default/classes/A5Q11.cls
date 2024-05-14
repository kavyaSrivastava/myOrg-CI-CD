public class A5Q11 {
    public static void getallAcc(){
        Date s = Date.newInstance(2023, 01, 31);
        Date e = Date.newInstance(2023, 02, 28);
        List<Opportunity> opp = [SELECT Account.Name FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate>=: s AND CloseDate <= : e];
        Map<String,Integer> m1 = new Map<String,Integer>();
        for(Opportunity f: opp){
            if(m1.containsKey(f.Account.Name)){
                m1.put(f.Account.Name,m1.get(f.Account.Name)+1);
            }
            else{
                m1.put(f.Account.Name,1);
            }}
            for(String key : m1.keySet()){
                if(m1.get(key)>10){
                    System.debug(key);
                }
            }
        }
        
    }
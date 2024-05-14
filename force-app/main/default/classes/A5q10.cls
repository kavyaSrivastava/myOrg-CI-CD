public class A5q10 {
    public static void getUsers(){
        List<User> us = [SELECT Id, Name FROM User];
        Date s = Date.newInstance(2023, 02, 01);
        Date e = Date.newInstance(2023, 4, 28);
        List<Lead> ld = [SELECT OwnerId ,Id FROM Lead WHERE OwnerId in : us AND  CreatedDate >= : s And CreatedDate <= : e ];
        Map<String,Integer> map1 = new Map<String,Integer>();
        for(Lead l:ld){
            if(map1.containsKey(l.OwnerId)){
                map1.put(l.OwnerId, map1.get(l.OwnerId)+1);
            }
            else{
                map1.put(l.OwnerId,1);
            }
            
        }
        for(String key: map1.keySet()){
            if(map1.get(key)>20){
                System.debug(key);
            }
        }
    }

}
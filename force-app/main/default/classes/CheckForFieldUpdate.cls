public class CheckForFieldUpdate {
    public static boolean checkMethod(Map<string, object> map1, Map<string, object> map2){
        Boolean shouldUpdate = false;
        for(String fieldName: map1.keySet()) {
            //for(String fieldName2 : map2.keySet()){
                if(fieldName == 'Name' && map1.get(fieldName) != map2.get(fieldName) ) {
                  shouldUpdate = true;  
                    //System.debug('inside if');
                }
            else if(fieldName != 'Name' && map1.get(fieldName) != map2.get(fieldName) ){
                 shouldUpdate = false; 
            }
         
            
        }
          System.debug(shouldUpdate);
        return shouldUpdate;
    }
}
public class BST1Q8 {
     public static void meth(){
        List<Song__c> sf = [SELECT Name from Song__c Where Favorite__c= true];
          List<Song__c> snf = [SELECT Name from Song__c Where Favorite__c!= true];
         for(Song__c s : sf){
             System.debug(s.Name);
     }
         for(Song__c s : snf){
              System.debug(s.Name);
         }
  }
}
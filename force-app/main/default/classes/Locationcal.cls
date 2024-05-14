public class Locationcal {
    public static void orLoc(){
        Integer AB =10;
        Integer BC = 20;
        Integer CD = 38;
        Integer DE =83;
        Integer EF = 73;
        Account acc = [SELECT Id,Location__c, Name FROM Account WHERE Location__c = 'A' OR Location__c = 'F'];
        List<Order_Location__c> olL = [SELECT Id, Travel_Location__c FROM Order_Location__c];
        List<Order_Location__c> olList = new List<Order_Location__c>();
        for(Order_Location__c ol:olL){
        if(acc.Location__c == 'A'){
            if(ol.Travel_Location__c == 'A'){ol.Total_Distance__c = 0;}
            else if(ol.Travel_Location__c == 'B'){ol.Total_Distance__c = AB;}
            else  if(ol.Travel_Location__c == 'C'){ol.Total_Distance__c = AB+BC;}
            else if(ol.Travel_Location__c == 'D'){ol.Total_Distance__c = AB+BC+CD;}
            else  if(ol.Travel_Location__c == 'E'){ol.Total_Distance__c = AB+BC+CD+DE;}
            else if(ol.Travel_Location__c == 'F'){ol.Total_Distance__c = AB+BC+CD+DE+EF;}
        }
        else if(acc.Location__c == 'F'){
            if(ol.Travel_Location__c == 'F'){ol.Total_Distance__c = 0;}
            else if(ol.Travel_Location__c == 'E'){ol.Total_Distance__c = AB;}
            else  if(ol.Travel_Location__c == 'D'){ol.Total_Distance__c = AB+BC;}
            else if(ol.Travel_Location__c == 'C'){ol.Total_Distance__c = AB+BC+CD;}
            else  if(ol.Travel_Location__c == 'B'){ol.Total_Distance__c = AB+BC+CD+DE;}
            else if(ol.Travel_Location__c == 'A'){ol.Total_Distance__c = AB+BC+CD+DE+EF;}
        }
            olList.add(ol);
        }
        update olList;
  }
    
}
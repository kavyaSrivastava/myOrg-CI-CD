public class FieldDuplicateTriggerHandler {
 public static void beforeUpdate(Map<Id, Contact> newMap , Map<id, Contact> oldMap, List<Contact> triggernew){
    List <Contact> conl = new List<Contact> ();
    for(Contact c : triggernew){
        //system.debug('triggernew=='+ triggernew);
        if(newMap.get(c.id).ksCAorg__PAN_Number__c != oldMap.get(c.id).ksCAorg__PAN_Number__c || newMap.get(c.id).ksCAorg__Aadhar_Number__c != oldMap.get(c.id).ksCAorg__Aadhar_Number__c ){
            conl.add(c);
           
        }
    }
    // system.debug('conl=='+ conl);
     List<Contact> conlist =  processafterInsert(conl);
    // system.debug('conlist=='+ conlist);
    // List<Id> newIds = new List<Id>();
    // for(contact c1 : triggernew){
    //     if(conlist.size()>0){
    //         for(contact c2 :conlist){
    //             if(c1.id == c2.id){
    //               c1.ksCAorg__Duplicate__c = c2.ksCAorg__Duplicate__c;
    //             }
               
    //         }
    //     }
    //     else{
    //         c1.ksCAorg__Duplicate__c = '';
    //     }
    //     newIds.add(c1.id);       
    }
   // List<Contact> ccon = processAfterUpdate(newIds);
    //update ccon;
 }
 public static List<Contact> processAfterUpdate(List<Id> newIds){
    List <Contact> conlist1 = [SELECT id,ksCAorg__Duplicate__c, ksCAorg__Aadhar_Number__c, ksCAorg__PAN_Number__c from contact where ksCAorg__Duplicate__c != null AND id NOT IN: newIds ];
    List <Contact> conlist2 = processafterInsert(conlist1);
   return conlist2;
}
 public static List<Contact> processafterInsert(List<Contact> newRecList){
    Map<String, Contact> mapPANAadharVsId = new Map<String, Contact>();
    Map<String, Contact> mapPANVsId = new Map<String, Contact>();
    Map<String, Contact> mapAadharVsId = new Map<String, Contact>();
    set<id> ids = new SET<Id>();
    List<Contact> duplicateIdFoundrec = new List<contact> ();
    List<Contact> conlist = new List<Contact>();
    for(Contact con : newRecList){
        
        String keyP =  con.ksCAorg__PAN_Number__c;
        String keyA =  con.ksCAorg__Aadhar_Number__c;
        if(con.ksCAorg__PAN_Number__c != null && con.ksCAorg__Aadhar_Number__c!=null){
            String keyPA =  con.ksCAorg__PAN_Number__c + '*' + con.ksCAorg__Aadhar_Number__c;
            if(mapPANAadharVsId.containsKey(keyPA)){ 
                Contact c = new contact(id = con.id);
                c.ksCAorg__Duplicate__c = 'PAN/Aadhar Duplicate';
                conlist.add(con);
                
            }
            else{
                mapPANAadharVsId.put(keyPA, con);
            }
        }
        
        if(con.ksCAorg__PAN_Number__c != null ) {
            
            if(mapPANVsId.containsKey(keyP)){
                Contact c = new contact(id = con.id);
                c.ksCAorg__Duplicate__c = 'PAN Duplicate';
                conlist.add(con);
                //mapPANAadharVsId.put(key, con); 
            } 
            else{
                mapPANVsId.put(keyP, con);                      
            }
        }
        
        if(con.ksCAorg__Aadhar_Number__c != null){
            if(mapAadharVsId.containsKey(keyA)){
                Contact c = new contact(id = con.id);
                c.ksCAorg__Duplicate__c = 'Aadhar Duplicate';
                conlist.add(con);                      
            }else{
                mapAadharVsId.put(keyA,con); 
            }
        }
        ids.add(con.id);
    }
    
    duplicateIdFoundrec = [SELECT id,ksCAorg__Duplicate__c, ksCAorg__Aadhar_Number__c, ksCAorg__PAN_Number__c from contact where (ksCAorg__Aadhar_Number__c =: mapAadharVsId.keySet()  OR ksCAorg__PAN_Number__c =: mapPANVsId.keySet())AND id NOT IN: Ids];
  
    for(Contact rec:duplicateIdFoundrec ){
        String key = rec.ksCAorg__PAN_Number__c+ '*' +rec.ksCAorg__Aadhar_Number__c;
        String keyP = rec.ksCAorg__PAN_Number__c;
        String keyA = rec.ksCAorg__Aadhar_Number__c;
        if(mapPANAadharVsId.containsKey(key)  ){
            Contact c = new Contact();
            c.Id = mapPANAadharVsId.get(key).Id;
            c.ksCAorg__Duplicate__c = 'PAN/Aadhar Duplicate';
            conlist.add(c);
            mapPANAadharVsId.remove(key);
            mapPANVsId.remove(keyP);
            mapAadharVsId.remove(keyA);
            
        }else if(mapPANVsId.containsKey(keyP)){
            Contact c = new contact();
            c.Id = mapPANVsId.get(keyP).Id;
            c.ksCAorg__Duplicate__c = 'PAN Duplicate';
            conlist.add(c);
            mapPANVsId.remove(keyP);
            // mapAadharVsId.remove(keyA);
        }else if(mapAadharVsId.containsKey(keyA)){
            Contact c = new contact();
            c.Id = mapAadharVsId.get(keyA).Id;
            c.ksCAorg__Duplicate__c = 'Aadhar Duplicate';
            conlist.add(c);
            // mapPANVsId.remove(keyP);
            mapAadharVsId.remove(keyA);
        }              
    }
    List<Contact> updateList = new List<Contact>();
    List<id> duplicateList = new List<id>();
    
    map<id, contact> mapUpdateRec = new Map<id, Contact>();
    System.debug(conlist);
    for(contact c :conlist){
        if(!mapUpdateRec.containsKey(c.id)){
            mapUpdateRec.put(c.id, c);
        }else{
            String cold = mapUpdateRec.get(c.id).ksCAorg__Duplicate__c;
            if(cold != c.ksCAorg__Duplicate__c && c.ksCAorg__Duplicate__c == 'PAN/Aadhar Duplicate'){
                mapUpdateRec.put(c.id, c);
                
            } 
            else  if(cold != c.ksCAorg__Duplicate__c && c.ksCAorg__Duplicate__c != 'PAN/Aadhar Duplicate' && cold != 'PAN/Aadhar Duplicate'){
                mapUpdateRec.get(c.id).ksCAorg__Duplicate__c = 'PAN/Aadhar Duplicate';
                mapUpdateRec.put(c.id, mapUpdateRec.get(c.id));
                
            }
            
        }
    }
    System.debug('line 115==' + mapUpdateRec);
    for(Contact c : mapUpdateRec.Values()){
        updateList.add(c);
    }
    System.debug('updateList==' + updateList);
    return updateList;


 }
 public static void processBeforeInsert(List<Contact> conlist){
    List<String> PanIds = new List<String> ();
    List<String> AadgarIds = new List<String> ();

    for(Contact con : conlist){
        
        // con.ksCAorg__PAN_Number__c?.PanIds.add(con.ksCAorg__PAN_Number__c));
        // con.ksCAorg__Aadhar_Number__c?.AadgarIds.add(con.ksCAorg__Aadhar_Number__c); //safe navigation operator
        if(con.ksCAorg__PAN_Number__c != null){
            PanIds.add(con.ksCAorg__PAN_Number__c);
        }
        if(con.ksCAorg__Aadhar_Number__c != null){
            AadgarIds.add(con.ksCAorg__Aadhar_Number__c);
        }
    }

    List<Contact> duplicateConList = [SELECT id, ksCAorg__PAN_Number__c, ksCAorg__Aadhar_Number__c, ksCAorg__Duplicate__c from Contact where ksCAorg__PAN_Number__c in: PanIds OR ksCAorg__Aadhar_Number__c In: AadgarIds];
    for(Contact c : conlist){
        for(Contact c2 : duplicateConList){
            if(c.ksCAorg__PAN_Number__c != null && c.ksCAorg__Aadhar_Number__c != null){
                if(c2.ksCAorg__PAN_Number__c == c.ksCAorg__PAN_Number__c && c2.ksCAorg__Aadhar_Number__c == c.ksCAorg__Aadhar_Number__c){
                    c.ksCAorg__Duplicate__c = 'PAN/Aadhar Duplicate';
                    break;
                }
            }
            if(c.ksCAorg__PAN_Number__c != null){
                if(c2.ksCAorg__PAN_Number__c == c.ksCAorg__PAN_Number__c ){
                    c.ksCAorg__Duplicate__c = 'PAN Duplicate';
                }
            }
            if(c.ksCAorg__Aadhar_Number__c!= null){
                if(c2.ksCAorg__Aadhar_Number__c == c.ksCAorg__Aadhar_Number__c){
                    c.ksCAorg__Duplicate__c = 'Aadhar Duplicate';
                }
            }
        }
    }

 }
}
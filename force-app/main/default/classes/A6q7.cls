public class A6q7 {
    public static void oppcontactrole(List<Opportunity> OppList){
       list<Contact> conList=[SELECT ID,AccountId, LastNAME FROM CONTACT];
            List<opportunityContactRole> ocrList=  new list<OpportunityContactRole>();
             
            
            for(Opportunity op: OppList){
                 
                        for(Contact con: conList){
                            if(con.AccountId==op.AccountId){
                            //ocrList.add(new OpportunityContactRole(ContactId=opp.Primary_Contact__c,OpportunityId=opp.Id,Role='Decision Maker',IsPrimary=true))
                        	OpportunityContactRole ocr= new OpportunityContactRole();
                            ocr.ContactId=con.id;
                            ocr.OpportunityId=op.id;
                            //ocr.IsPrimary=true;
                            //ocr.Role='Decision Maker';
                            ocrList.add(ocr);
                            }
                        }
                    
                
            }
            insert ocrList;
       }
       // catch(Exception e){
        //    system.debug('Error Messege ===> '+e.getMessage()+''+'Line Number====>'+e.getLineNumber());
        
   // }
}
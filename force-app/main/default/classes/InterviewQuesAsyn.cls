global class InterviewQuesAsyn implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select Id,Campaign_Success_Rate__c, (SELECT Id,CampaignMember_Status__c From CampaignMembers) From campaign');
        //SELECT CampaignId, CampaignMember_Status__c, Count(Id) From CampaignMember Group By CampaignId, CampaignMember_Status__c
    }
    global void execute(Database.BatchableContext bc, List<Campaign> scope){
        List<Campaign> campl = new List<Campaign>();
       // system.debug(scope);
       // system.debug(campl[0].campaignMembers.Size());
        for(Campaign c: scope){
            Decimal a = 0;
            if(c.campaignmembers.size()>0){
              for(CampaignMember cm:c.CampaignMembers){
                
                if(cm.CampaignMember_Status__c == 'Successful'){
                    a++;
                    
                }
               
            }
                 system.debug(a);
            system.debug(c.campaignMembers.Size());
            c.Campaign_Success_Rate__c = (a/c.CampaignMembers.Size())*100;
                campl.add(c);
        }   
            }
           
        map<id,campaign> map1 = new map<id,campaign>();
        map1.putAll(campl);
        if(map1.size()>0){
         update map1.values();
           }
       
    }
 public void finish(Database.BatchableContext bc){
        
    }
}
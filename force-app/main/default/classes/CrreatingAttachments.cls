public class CrreatingAttachments {
     public static void addAttachments(){
        List<Account> acList = [SELECT Id FROM Account];
        List<Attachment> attList = [SELECT Id, parentId FROM Attachment WHERE parentId IN : acList];
        Set<Id> acId = new Set<Id>();
        for(Attachment a : attList){
            acId.add(a.parentId);
        }
        List<Contact> conList = [SELECT Id FROM Contact WHERE AccountId IN : acId];
        for(Attachment at : attList){
            for(Contact con : conList){
                if(at.parentId == con.AccountId){
                    Attachment atc = new Attachment();
                    atc.body = at.body;
                    atc.Name = at.Name;
                    atc.ParentId = con.Id;
                }
            }
        }
    }


}
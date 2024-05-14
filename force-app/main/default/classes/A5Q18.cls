/*blic class A5Q18 {
    public static void meth(){
        List<Account> accl = [SELECT Id,Name FROM Account where Account.Name='Pyramid Construction Inc.'];
        List<Attachment> attl = [SELECT Id from Attachment where ParentId=:accl[0].Id];
        System.debug(attl);
        List<Contact> conl = [SELECT id,Name from contact where AccountId =: accl[0].Id];
        System.debug(conl);
        if(attl.size()>2){
            for(integer i = attl.size();i>0;i--){
                database.delete(attl[i]);
            }
        }
        
        if(conl.size()>2){
            for(integer i = conl.size();i>0;i++){
                database.delete(conl[i]);
            }
        }
    }
    public static void meth2(){
        List<Account> accl = [SELECT Id,Name FROM Account where Account.Name='Pyramid Construction Inc.'];
        List<Attachment> attl1= [ SELECT Id from Attachment where ParentId=:accl[0].Id];
        List<Contact> conl2= [SELECT id from contact where AccountId =: accl[0].Id];
        System.debug(attl1);
        if(attl1.size()==1 && conl2.size()==1){
            Attachment fileAttachment = [SELECT Id,Body, Name, Description,ParentId FROM Attachment WHERE Id=:attl1[0].Id];


    Attachment newFile = fileAttachment.clone();
    newFile.ParentId = conl2[0].Id;
    insert newFile;
        }
                     }
      
    
                     

}*/
 public class A5Q18 {
    public static void delConAtt(){
        List<Account> accList=[Select id from account where name='Pyramid Construction Inc.'];
         List<Attachment> attdelList=new List<Attachment>();
              List<contact> condelList=new List<contact>();
        for(account acc:accList){
           List<Attachment> attList=[Select id from attachment where parentid=:acc.id]; 
            System.debug(attList);
           List<contact> conList=[Select id from contact where accountid=:acc.id];
if(attList.size()>1 ){
                for(integer i=0;i<attList.size()-1;i++){
                    attdelList.add(attList[i]);
                }
            }
                if(conList.size()>1){
                for(integer i=0;i<conList.size()-1;i++){
                    condelList.add(conList[i]);
                }
            }
            database.delete(attdelList);
           database.delete(condelList);
              if (attList.size() == 1 || conList.size() ==  1){
   
    attList[0].ParentId = conList[0].Id;
    
    
    update attList[0];
    
    System.debug('Attachment copied to Contact');
}
        }
    
    }
}
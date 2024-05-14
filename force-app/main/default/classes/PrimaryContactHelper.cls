public class PrimaryContactHelper {
    public static void makingContactPrimary(List<Account> accl){
        Set<Id> contactId = new Set<Id>();
        for(Account acc : accl){
            contactId.add(acc.Primary_Contact__c);
        }
        List<Contact> conList = [SELECT Id, IsPrimary__c FROM Contact Where Id in:contactId];
        for(Contact c: conList){
            if(c.IsPrimary__c == false){
                c.IsPrimary__c = true;
            }
           /* else if(c.IsPrimary__c == true){
               break;
            }
             c.addError('This contact is already primary' );*/
        }
        update conlist;
    }
    public static void updatingContactsPrimaryField(List<Account> newaccl, List<Account> oldaccl){
        Set<Id> oldContactId = new Set<Id>();
        Set<Id> newContactId = new Set<Id>();
        for(Account acc: oldaccl){
            oldContactId.add(acc.Primary_Contact__c);
        }
        for(Account acc: newaccl){
            newContactId.add(acc.Primary_Contact__c);
            
        }
         List<Contact> conListNew = [SELECT Id, IsPrimary__c FROM Contact Where Id in:newContactId];
         List<Contact> conListOld = [SELECT Id, IsPrimary__c FROM Contact Where Id in:oldContactId];
        
         for(Contact c: conListOld){
            if(c.IsPrimary__c == true){
                c.IsPrimary__c = false;
            }
         }
         for(Contact c: conListNew){
            if(c.IsPrimary__c == false){
                c.IsPrimary__c = true;
            }
           /* else if(c.IsPrimary__c == true){
               break;
            }
             c.addError('This contact is already primary' );*/
        }
          
        update conListNew;
        update conListOld;
        
        
    }
    public static void deletinggContactsPrimaryField(List<Account> newacclist){
        Set<Id> newContactId = new Set<Id>();

        for(Account acc: newacclist){
            newContactId.add(acc.Primary_Contact__c);
            
        }

        List<Contact> conListNew = [SELECT Id, IsPrimary__c FROM Contact Where Id in:newContactId];

        for(Contact c: conListNew){
            // if(c.IsPrimary__c == true){
                c.IsPrimary__c = false;
            // }
        }
        update conListNew;
    }



}
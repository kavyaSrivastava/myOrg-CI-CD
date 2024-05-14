@istest
public class TestDataFactory {
    public static GoogleCred__c createGoogleCred(){
         GoogleCred__c cred = new GoogleCred__c();
         cred.Name = 'Creden';
         cred.key__c= '475333313485-nuoshc06plebhmth01bfeedd5o4o04c3.apps.googleusercontent.com';
         cred.secert__c = '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';
         cred.redirect_uri__c = 'https://cloudanalogy620-dev-ed--c.develop.vf.force.com/apex/authorizationPage';
         cred.authUrl__c = 'https://accounts.google.com/o/oauth2/auth';
         cred.scope__c= ' https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.readonly';
         cred.tokenUrl__c='https://oauth2.googleapis.com/token';
         cred.endPointForFiles__c= 'https://www.googleapis.com/drive/v2/files';
         cred.endPointToupload__c= 'https://www.googleapis.com/upload/drive/v2/files?uploadType=multipart';
        return cred;
    }
    
     public static GoogleApiInt__c createGoogleApiInt(){
         GoogleApiInt__c accesst = new GoogleApiInt__c();
          accesst.name = 'token1';
         return accesst;
     }
         

}
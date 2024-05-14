@isTest
global class CalloutClassTest {
     @testSetup static void setup() {
        //GoogleCred__c cred = new GoogleCred__c();
         //cred.Name = 'Creden';
         //cred.key__c= '475333313485-nuoshc06plebhmth01bfeedd5o4o04c3.apps.googleusercontent.com';
         //cred.secert__c = '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';
         //cred.redirect_uri__c = 'https://cloudanalogy620-dev-ed--c.develop.vf.force.com/apex/authorizationPage';
         //cred.authUrl__c = 'https://accounts.google.com/o/oauth2/auth';
         //cred.scope__c= ' https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.readonly';
         //cred.tokenUrl__c='https://oauth2.googleapis.com/token';
         //cred.endPointForFiles__c= 'https://www.googleapis.com/drive/v2/files';
         //cred.endPointToupload__c= 'https://www.googleapis.com/upload/drive/v2/files?uploadType=multipart';
         GoogleCred__c cred = TestDataFactory.createGoogleCred();
         
         
         if(cred != null){
             insert cred;
         }
         GoogleApiInt__c acc = TestDataFactory.createGoogleApiInt();
        
         insert acc;

    }

     @isTest static void testCallout() {
         
        System.test.startTest();
        String actualValue = GetAuthService.createAuthURL();
        System.test.stopTest();
        
        String expectedValue = 'https://accounts.google.com/o/oauth2/auth?client_id=475333313485-nuoshc06plebhmth01bfeedd5o4o04c3.apps.googleusercontent.com&response_type=code&scope=https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.readonly&redirect_uri=https%3A%2F%2Fcloudanalogy620-dev-ed--c.develop.vf.force.com%2Fapex%2FauthorizationPage&access_type=offline&prompt=consent';
        System.assertEquals(actualValue, expectedValue);
       
    }
    @isTest public static void testAccessToken(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String code = '4/0AZEOvhVO4ZND9qenETB35w0iSXnYQOmuQ-F0co1rC1yw0SWar5FkxIvpstXlovDlzudDdg';
        test.startTest();
        Boolean actualValue = GetAuthService.getAccessToken(code);
        test.stopTest();
        System.assertEquals(actualValue, true);
     
        
    }
    
    @isTest static void testGetCallOut(){
         Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
         test.startTest();
        List<Object> actualValue = GetAuthService.makeGetCallout();
        test.stopTest();
        list<object> expectedData = new list<object>();
        expectedData.add('Kavya');
        system.assertEquals(expectedData[0], actualValue[0]);
       // List<Object> listData ='["items": [{"kind": "drive#file","mimeType": "application/vnd.google-apps.spreadsheet","exportLinks": {"application/x-vnd.oasis.opendocument.spreadsheet": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=ods","text/tab-separated-values": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=tsv","application/pdf": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=pdf","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=xlsx","text/csv": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=csv","application/zip": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=zip","application/vnd.oasis.opendocument.spreadsheet": "https://docs.google.com/spreadsheets/export?id=1v7MCkGqyj_QmDJg_qfkw47ct8ChiTwJ0n4guI2z8dWw&exportFormat=ods"}]';

       
    }
     @isTest static void testUploadFile(){
     
         Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
         test.startTest();
         String filename='File1';
         String filetype='pdf';
         String filecontent='xyz';
         GetAuthService.UploadFile(filename,  filetype, filecontent);
         test.stopTest();
     }
    
   @isTest public static void testAccessToken1(){
       try{
         
         Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String code = '4/0AZEOvhVO4ZND9qenETB35w0iSXnYQOmuQ-F0co1rC1yw0SWar5FkxIvpstXlovDlzudDdg';
        GoogleApiInt__c c = [SELECT Name FROM GoogleApiInt__c Limit 1];
        delete c;
        test.startTest();
        
        Boolean actualValue = GetAuthService.getAccessToken(code);
        test.stopTest();
        //system.debug(actualValue);
        System.assertEquals(actualValue, true);
       }
       catch (Exception e){
           System.debug('Error occured '+e.getLineNumber());
       }
     
        
    }
  @isTest static void testUploadFile2(){
     
      try{
            // Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
     test.startTest();
          String filename='';
         String filetype='pdf';
         String filecontent='xyz';
         GetAuthService.UploadFile(filename, filetype, filecontent);
         test.stopTest();
        // System.assertEquals(200, actual);
      }  
      catch(Exception e){
          System.debug('Error occured '+e.getLineNumber());
      }
     
  }  
     
    @isTest static void coveringAuthURLException() {
         try{
             
         
          GoogleCred__c creds = [SELECT Name, Id FROM  GoogleCred__c Limit 1];
          delete creds;
          System.test.startTest();
          String actualValue = GetAuthService.createAuthURL();
          System.test.stopTest();
          String expectedValue = 'https://accounts.google.com/o/oauth2/auth?client_id=475333313485-nuoshc06plebhmth01bfeedd5o4o04c3.apps.googleusercontent.com&response_type=code&scope=https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.readonly&redirect_uri=https%3A%2F%2Fcloudanalogy620-dev-ed--c.develop.vf.force.com%2Fapex%2FauthorizationPage&access_type=offline&prompt=consent';
          System.assertEquals(actualValue, expectedValue);
         }
         catch(Exception e){
             System.debug('Error occured '+e.getLineNumber());
         }
       // System.assertEquals(200, res.getStatusCode());
    }
    
    @isTest static void testCallout1() {
        
        try{
              test.startTest();
        List<Object> actualValue = GetAuthService.makeGetCallout();
        test.stopTest();
        list<object> expectedData = new list<object>();
        expectedData.add('Kavya');
        system.assertEquals(expectedData[0], actualValue[0]);
        }
        catch(Exception e){
            System.debug('Error occured at'+e.getLineNumber());
        }
       
    }
}
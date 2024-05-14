public with sharing class GetAuthService {
   public static GoogleCred__c credentials = GoogleCred__c.getOrgDefaults();
   @AuraEnabled
   public static string createAuthURL(){
    try {
        String key = EncodingUtil.urlEncode(credentials.key__c,'UTF-8');
        String uri = EncodingUtil.urlEncode(credentials.redirect_uri__c,'UTF-8');
        String authuri = '';
        authuri = credentials.authUrl__c+'?'+
                'client_id='+key+
                '&response_type=code'+
                '&scope='+credentials.scope__c +
                '&redirect_uri='+uri+
                '&access_type=offline'+
                   '&prompt=consent';
        
         return authuri;
        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static boolean getAccessToken(String code){
        try {
            if(String.isNotBlank(Code)){

             
                HttpRequest req = new HttpRequest();
                req.setMethod('POST');
                req.setEndpoint(credentials.tokenUrl__c);
                req.setHeader('content-type', 'application/x-www-form-urlencoded');
        
                String messageBody = 'code='+code+'&client_id='+credentials.key__c+
                                    '&client_secret='+credentials.secert__c+
                                    '&redirect_uri='+credentials.redirect_uri__c+
                                    '&grant_type=authorization_code';

                req.setHeader('Content-length', String.valueOf(messageBody.length()));
                req.setBody(messageBody);
                req.setTimeout(60*1000);
                //system.debug('messageBody:'+messageBody);
        
                Http callout = new Http();
                String responseText;
                HttpResponse response = callout.send(req);
                responseText = response.getBody();
                //system.debug('responseText:'+responseText);
                if(response.getStatusCode()==200){
                    Map<String,object> responseMap =(Map<String,object>)JSON.deserializeUntyped(responseText) ;  
                    String token =  String.valueOf(responseMap.get('access_token'));
                    String refreshtoken = String.valueOf(responseMap.get('refresh_token'));
                    System.debug('refreshtoken = '+refreshtoken);
                    system.debug('token:'+token);
                    GoogleApiInt__c integrationdetail = [SELECT Name, AccessKey__c, RefreshToken__c from GoogleApiInt__c ];
                    //System.debug(integrationdetail);
                    integrationdetail.AccessKey__c =token;
                    integrationdetail.RefreshToken__c = refreshtoken;
                    update integrationdetail;
                    return true;
                }
            }
          return false;
        }
        catch (Exception e) {
            system.debug(e.getMessage());
            system.debug(e.getLineNumber());
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static list<Object> makeGetCallout(){
        try {
            GoogleApiInt__c integrationdetail = GoogleApiInt__c.getOrgDefaults();
            Datetime lastmodifiedAt = integrationdetail.LastModifiedDate;
            String refreshToken = integrationdetail.RefreshToken__c;
            String accesstoken = integrationdetail.AccessKey__c;
        
           //System.debug(accesstoken);
           
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            //request.setEndpoint('https://www.googleapis.com/drive/v2/files');
            request.setEndpoint(credentials.endPointForFiles__c);
            request.setHeader('Authorization', 'Bearer ' +accesstoken);
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            //system.debug('Response code recieved is>>>>>> '+response.getStatusCode());
            //system.debug('before deserialization==>>' +response.getBody());
            Map<String, Object> driveFiles = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('after deserialization==>>' +driveFiles);
            list<Object> data = (list<Object>)driveFiles.get('items');
            //System.debug(data);
           
            if(lastmodifiedAt<Datetime.now().addMinutes(-50)){
                accesstoken = updateAccesTokenWithRefreshToken();
             
            }
            return data;
           
        }
        catch (Exception e){
            system.debug(e.getMessage());
            system.debug(e.getLineNumber());
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void UploadFile(String filename, String filetype, String filecontent, String fileSize) {

        try{
            GoogleApiInt__c integrationdetail = GoogleApiInt__c.getOrgDefaults();
            String accesstoken = integrationdetail.AccessKey__c;
            if(String.isNotBlank(filename) && String.isNotBlank(filetype) &&String.isNotBlank(filecontent)){
              String boundary = '----------9889464542212';
              String delimiter = '\r\n--' + boundary + '\r\n';
              String close_delim = '\r\n--' + boundary + '--';
              String bodyEncoded = filecontent;
              String body = delimiter + 'Content-Type: application/json\r\n\r\n' + '{ "title" : "' + filename + '",' + ' "mimeType" : "' + filetype + '" }' + delimiter + 'Content-Type: ' + filetype + '\r\n' + 'Content-Transfer-Encoding: base64\r\n' + '\r\n' + bodyEncoded + close_delim;
              Http http = new Http();
              HttpRequest req = new HttpRequest();
               // req.setEndpoint('https://www.googleapis.com/upload/drive/v2/files?uploadType=multipart');
                req.setEndpoint(credentials.endPointToupload__c);
                req.setHeader('Authorization', 'Bearer ' + accessToken);
                req.setHeader('Content-Type', 'multipart/mixed; boundary="' + boundary + '"');
                req.setHeader('Content-length', String.valueOf(body.length()));
                //system.debug('body.length() '+body.length());
                //system.debug('body>>'+body);
                req.setBody(body);
                req.setMethod('POST');
                req.setTimeout(60 * 1000);
                HttpResponse resp = http.send(req);
                //system.debug('resp'+resp);
             }
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string updateAccesTokenWithRefreshToken(){
        try {
            GoogleApiInt__c integrationdetail = GoogleApiInt__c.getOrgDefaults();
           // Datetime lastmodifiedAt = integrationdetail.LastModifiedDate;
            String refreshToken = integrationdetail.RefreshToken__c;
           // String accesstoken = integrationdetail.AccessKey__c;
            HttpRequest req2 = new HttpRequest();
            req2.setEndpoint(credentials.tokenUrl__c);
            req2.setHeader('content-type', 'application/x-www-form-urlencoded');
            String messageBody = 'client_id=' + credentials.key__c + '&client_secret=' + credentials.secert__c + '&refresh_token=' + refreshToken + '&redirect_uri=' +credentials.redirect_uri__c+ '&grant_type=refresh_token';
            req2.setHeader('Content-length', String.valueOf(messageBody.length()));
            req2.setBody(messageBody);
            req2.setMethod('POST');
            req2.setTimeout(60 * 1000);
            Http h2 = new Http();
            String resp2;
            HttpResponse res2 = h2.send(req2);
            //system.debug('status code of response is'+res2.getStatusCode());
            resp2 = res2.getBody();
            system.debug('resp-->>'+resp2);
            if(res2.getStatusCode()==200){
                Map<String,object> responseMap =(Map<String,object>)JSON.deserializeUntyped(resp2) ;  
                String token =  String.valueOf(responseMap.get('access_token'));
                
                integrationdetail.AccessKey__c= token;
                update integrationdetail;
                return token;
            }
            return null;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled
    public static String  uploadDataGreaterThan4MB(String fileName, String base64Data, String contentType, String startingChunk, String endingChunk, String fileSize, String location){
        
        try{
             GoogleApiInt__c integrationdetail = GoogleApiInt__c.getOrgDefaults();
             String accesstoken = integrationdetail.AccessKey__c;
            
//--------------------------------------- Using resumable API --------------------------------------------------------------------------------------------------
           if(String.isNotBlank(fileSize) && String.isNotBlank(location) && String.isNotBlank(base64Data) && String.isNotBlank(startingChunk) && String.isNotBlank(endingChunk) ){
                Http http1 = new Http();
                 String body = EncodingUtil.urlDecode(base64Data , 'UTF-8');
                 Blob body1 = EncodingUtil.base64Decode(body);
                 Integer sizeOffile1 = body1.size()-1;
                 sizeOffile1 = sizeOffile1+Integer.ValueOf(startingChunk);
                 System.debug('sizeoffileupdated==='  + sizeOffile1);
                 HttpRequest reqNew = new HttpRequest();
                 reqNew.setEndpoint(location);
                 reqNew.setMethod('PUT');
                
                 reqNew.setHeader('Content-Length', String.valueOf(sizeOffile1));
                 reqNew.setHeader('Content-Range', 'bytes' +startingChunk+ '-' + String.valueOf(sizeOffile1) + '/' + fileSize );
                 reqNew.setBodyAsBlob(body1);
                 HttpResponse responseofFile = http1.send(reqNew);
                 System.debug('responseofFile ======'+responseofFile);
                 
                 if(responseofFile.getStatusCode()==308){
                    String bod = responseofFile.getBody();
                    System.debug('BODY==='+ bod);
                    String str1 = responseofFile.getHeader('Range');
                    List<String> lastSendByte = str1.split('-',2);
                    //System.debug('UpperLimit===' +lastSendByte[1]);
                    String nextChunk = lastSendByte[1];
                    return nextChunk;
                }
           }
           return null;
      }
        catch(Exception e){
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string getLocationURI( String fileName, String contentType){
        try {
                GoogleApiInt__c integrationdetail = GoogleApiInt__c.getOrgDefaults();
                String accesstoken = integrationdetail.AccessKey__c;
                Http http = new Http();
                String body='{"name":"'+fileName+'", "mimeType" : "'+contentType+'"}';
                HttpRequest req = new HttpRequest();
                req.setEndpoint('https://www.googleapis.com/upload/drive/v3/files?uploadType=resumable');
                req.setBody(body);
                req.setHeader('Authorization', 'Bearer ' + accessToken);
                req.setHeader('Content-Type', 'application/json;charset=UTF-8');
                req.setMethod('POST'); 
                req.setHeader('Content-length', String.valueOf(body.length()));
                HttpResponse resp = http.send(req);
               // System.debug(resp.getHeader('Location'));
                String resumableLocation = resp.getHeader('Location');
                return resumableLocation;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}
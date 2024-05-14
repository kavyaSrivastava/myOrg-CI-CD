public class UPloadingDataGreaterThan4MB {

     public static GoogleCred__c credentials = GoogleCred__c.getOrgDefaults();
     public static void uploadDataGreaterThan(){
        GoogleApiInt__c integrationdetail = GoogleApiInt__c.getOrgDefaults();
        String accesstoken = integrationdetail.AccessKey__c;
       // if(String.isNotBlank(filename) && String.isNotBlank(filetype) &&String.isNotBlank(filecontent)){
           Http http = new Http();
           HttpRequest req = new HttpRequest();
            req.setEndpoint(' https://www.googleapis.com/upload/drive/v3/files?uploadType=resumable');
         req.setmethod('POST');
         String body ='';
             req.setHeader('Content-Length', String.valueOf(body.length()));
            req.setHeader('Authorization', 'Bearer ' + accessToken);
            //req.setHeader('X-Upload-Content-Type', 'application/octet-stream');
           req.setHeader('Content-Type', 'application/json; charset=UTF-8');
            //req.setHeader('Content-length', String.valueOf(body.length()));
            HttpResponse resp = http.send(req);
            System.debug('resp'+resp);
            System.debug(resp.getHeader('X-GUploader-UploadID'));
       // }

    }
}
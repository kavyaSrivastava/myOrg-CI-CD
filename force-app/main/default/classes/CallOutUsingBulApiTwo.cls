public without sharing class CallOutUsingBulApiTwo {
    public static void callOutUsingBulApiMethTwo() {
        String temp = userInfo.getSessionId().substring(15);
        HttpRequest Request = new HttpRequest();
        Request.setMethod('POST');
        Request.setEndpoint(URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query');
        Request.setHeader('content-type', 'application/json');
        Request.setHeader('Authorization', 'Bearer ' + temp);
        String str_body = '{ ' +
            '"operation": "query",' +
            '"query": "select  Name, Id, ownerId, Industry from Account Order By Industry",' +
            '"contentType" : "CSV",' +
            '"lineEnding" : "CRLF"' +
            '}';
        Request.setBody(str_body);
        Http http1 = new Http();
        HttpResponse Response = http1.send(Request);
        System.debug('Response at 18===>  '+ Response);
        System.debug('status code===>  '+ Response.getStatusCode());
        system.debug(Response.getBody());
        Map < String, Object > Map_response = (Map < String, Object > ) Json.deserializeUntyped(Response.getBody());
        String str_jobId = (String) Map_response.get('id');
        String str_bodycontent = Response.getBody();
        System.debug(str_jobId);
        /* if(str_jobId != null){
        //methodTwo(str_jobId);
        return str_jobId;

         }
         else{
         return null;
         }*/
        for(Integer i = 0; i<100000; i++){
            
        }
        methodTwo(str_bodycontent);
      }
    
    public static void methodTwo(String res ) {
        // String str_jobId = callOutUsingBulApiMethTwo();
        try{
            //String str_jobId = callOutUsingBulApiMethTwo();
            String temp = userInfo.getSessionId().substring(15);
            Map < String, Object > Map_response = (Map < String, Object > ) Json.deserializeUntyped(res);
            String str_jobId = (String) Map_response.get('id');
            String urlgenerated = URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query/' + str_jobId + '/results?maxRecords=50';
            //System.debug(res);
            
            //String str_jobId = '7502w00000TAXpIAA';
            System.debug(str_jobId);
            HttpRequest DataReq = new HttpRequest();
            
            system.debug(urlgenerated);
            DataReq.setMethod('GET');
            
            DataReq.setEndpoint(urlgenerated);
            DataReq.setHeader('content-type', 'application/json');
            DataReq.setHeader('Authorization', 'Bearer ' + temp);
            Http Http2 = new Http();
            for(Integer i = 0; i<500000; i++){
                
            }
            system.debug(urlgenerated);
            
            HttpResponse DataRes = Http2.send(DataReq);
            System.debug('ln38'+DataRes.getBody());
            String str_CSVBody = (String) DataRes.getBody();
            String str_locator = (String) DataRes.getHeader('Sforce-Locator');
            System.debug(DataRes);
            System.debug(DataRes.getStatusCode());
            system.debug('line67==>  ' +str_locator);
            meth3(str_jobId, str_locator);
        }catch(Exception ex){
            system.debug('ln45' +ex.getMessage() );
        }
    }
    public static void meth3(String str_jobId , String str_locator) {
        
        // String str_jobId = callOutUsingBulApiMethTwo();
        //String str_locator = methodTwo();
        /*for(Integer i = 0; i<100000; i++){

         }*/
        String temp = userInfo.getSessionId().substring(15);
        System.debug('line 80'+ str_locator);
        System.debug('line 81'+ str_jobId);
        HttpRequest DataReq2 = new HttpRequest();
        
        DataReq2.setMethod('GET');
        DataReq2.setEndpoint(URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query/' + str_jobId + '/results?locator=' +EncodingUtil.urlEncode(str_locator, 'UTF-8') +'&maxRecords=50');
        DataReq2.setHeader('content-type', 'application/json');
        // DataReq2.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+’/services/data/v50.0/jobs/query/’+jobId+’/results?locator=str_locator &maxRecords=5000′);
        DataReq2.setHeader('Authorization', 'Bearer ' + temp);
        Http http3 = new Http();
        HttpResponse DataRes2 = http3.send(DataReq2);
        String str_CSVBody = (String) DataRes2.getBody();
        str_locator = (String) DataRes2.getHeader('Sforce-Locator');
        System.debug(DataRes2.getBody());
        
        System.debug(str_locator);
        if (DataRes2.getStatusCode() == 400) {
            
            //String errorMessage = 'Error: ' + DataRes2.getStatus() + ' ' + DataRes2.getStatusText();
            // System.debug('Error Message: ' + errorMessage);
            System.debug('Response Body: ' + DataRes2.getBody());
            // Handle the error message appropriately
            
        }
        List<String> responseHeaders = DataRes2.getHeaderKeys();
        /* for(STring head : responseHeaders){
             system.debug(head);
        }*/
        System.debug(responseHeaders);
        
        if(responseHeaders.contains('Done')||responseHeaders.contains('Sforce-Locator') ){
            System.debug('yes');
        }
        
        if (responseHeaders.contains('done')) {
            // This is the last set of records
            System.debug('last set');
            system.debug('done ===>' +DataRes2.getHeader('done'));
            
        }
        if(DataRes2.getHeader('Sforce-Locator')!= NULL){
            System.debug('str_locator'+ str_locator);
            meth3(str_jobId, str_locator);
        }
        
      }
    
}
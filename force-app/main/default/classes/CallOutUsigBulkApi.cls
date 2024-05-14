public class CallOutUsigBulkApi {
  public static void makePostCallOut() {
   /* HttpRequest Request = new HttpRequest();
    Request.setMethod('POST');
    System.debug(URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query');
    System.debug(userInfo.getSessionId().substring(15));
    Request.setEndpoint(URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query');
    Request.setHeader('Accept', 'application/json');
    //req.setHeader('Accept', 'application/json');
    Request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    //Request.setHeader('content-type', 'application/json' );
    Request.setHeader('Authorization', 'Bearer ' + userInfo.getSessionId());
    String str_body = '{' + '"operation": "query",' + '"query": "select  Name, Id from contact ",' + '"contentType" : "CSV",' + '"lineEnding" :"CRLF"' + '}';
    System.debug(str_body);
    Request.setBody(str_body);
    Http http1 = new Http();
    HttpResponse Response = http1.send(Request);
    system.debug(Response.getBody());*/
    
    HttpRequest Request= new HttpRequest();
Request.setMethod('POST');
Request.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+'/services/data/v50.0/jobs/query');
Request.setHeader('content-type', 'application/json' );

Request.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId());
String str_body = '{ '+
'"operation": "query",'+
'"query": "select  LastName, Id from Contact ",'+
 '"contentType" : "CSV",'+
  '"lineEnding" : "CRLF"'+
 '}';
 Request.setBody(str_body );
Http http1 = new Http();
HttpResponse Response= http1.send(Request);
      System.debug(Response);
    Map < String, Object > Map_response = (Map < String, Object > ) Json.deserializeUntyped(Response.getBody());
    String str_jobId = (String) Map_response.get('id');
      System.debug(str_jobId);
      
   /* HttpRequest DataReq = new HttpRequest();
    DataReq.setMethod('GET');
    //DataReq.setEndpoint(URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query/' + str_jobId + '/results?maxRecords=5000');
    DataReq.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+'/services/data/v50.0/jobs/query/'+str_jobId +'/results?maxRecords=5000');
    DataReq.setHeader('content-type', 'text/csv');
    DataReq.setHeader('Accept', 'application/json');

    DataReq.setHeader('Authorization', 'Bearer ' + userInfo.getSessionId());
    Http Http2 = new Http();
    HttpResponse DataRes = Http2.send(DataReq);
    String str_CSVBody = (String) DataRes.getBody();
    String str_locator = (String) DataRes.getHeader('Sforce-Locator');
    System.debug(DataRes.getBody());*/
      HttpRequest DataReq = new HttpRequest();
	  DataReq.setMethod('GET');
	  DataReq.setEndpoint(URl.getOrgDomainUrl().toExternalForm()+'/services/data/v50.0/jobs/query/'+str_jobId+'/results?maxRecords=5000');
      DataReq.setHeader('content-type', 'text/csv');
     // DataReq.setHeader('Accept', 'text/csv');
      DataReq.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId());
	  Http Http2 = new Http();
      HttpResponse DataRes = Http2.send(DataReq);
      String str_CSVBody = (String)DataRes.getBody();
      String str_locator = (String)DataRes.getHeader('Sforce-Locator');
      System.debug(DataRes.getHeaderKeys());
      System.debug(DataRes.getHeader('Sforce-Limit-Info'));
      System.debug(str_locator);

    HttpRequest DataReq2 = new HttpRequest();
    DataReq2.setMethod('GET');
    DataReq2.setEndpoint(URl.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/jobs/query/' + str_jobId + '/results?locator=str_locator&maxRecords=5000');
    DataReq2.setHeader('content-type', 'text/csv');
    //DataReq2.setHeader('Accept', 'application/json');
    DataReq2.setHeader('Authorization', 'Bearer '+userInfo.getSessionId());
    Http http3 = new Http();
    HttpResponse DataRes2 = http3.send(DataReq2);
    str_CSVBody = (String) DataRes2.getBody();
    str_locator = (String) DataRes2.getHeader('Sforce-Locator');
    System.debug('');
    System.debug(str_CSVBody);

  }

}
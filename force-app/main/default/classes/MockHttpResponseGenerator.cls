@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
        
     global HTTPResponse respond(HTTPRequest req){
            
         if(req.getEndpoint()=='https://oauth2.googleapis.com/token'){
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"access_token": "123","refresh_token":"345"}');
            res.setStatusCode(200);
            return res;  
          }
         else if(req.getEndpoint()=='https://www.googleapis.com/drive/v2/files'){
             HttpResponse res = new HttpResponse();
             res.setHeader('Content-Type', 'application/json');
             res.setBody('{"items": ["Kavya"]}');
             res.setStatusCode(200);
             return res; 
         }
         else if(req.getEndpoint()== 'https://www.googleapis.com/upload/drive/v2/files?uploadType=multipart'){
              HTTPResponse sq = new HTTPResponse();
              sq.setStatusCode(200);
              return sq;
                 }
          HTTPResponse s = new HTTPResponse();
          return  s;
         }
   }
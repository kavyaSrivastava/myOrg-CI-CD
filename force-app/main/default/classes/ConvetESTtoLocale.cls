public class ConvetESTtoLocale {
  @AuraEnabled
  public static String convert(Id recId){
    try {
        System.debug('recId-===>'+ recId);
        Account acc = [SELECT Id, DateTimeEST__c FROM Account WHERE Id =: recId];
        System.debug('acc===> '+ acc);
        //Get current date time in GMT format
        Datetime dt = acc.DateTimeEST__c;
        TimeZone tz = UserInfo.getTimeZone();
        System.debug(UserInfo.getTimeZone());

 
//Convert it into Pacific Standard Time(PST).
String dtPST = dt.format('yyyy-MM-dd HH:mm:ss', String.ValueOf(tz) );
//String dtPST2 = dt.format('yyyy-MM-dd HH:mm:ss', 'PST' );

//System.debug('PST TIMEZONE ====> '+ dtPST2);
 
System.debug('dt-' + dt);
System.debug('dtPST-' + dtPST);
        return dtPST;

        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
  }
}
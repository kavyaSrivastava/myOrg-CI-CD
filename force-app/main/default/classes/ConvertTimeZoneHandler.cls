public class ConvertTimeZoneHandler {
    public static void convert(List<Account> accList){
        if(accList.size()>0){
            TimeZone tz = UserInfo.getTimeZone();
            System.debug('Atline 5'+ UserInfo.getTimeZone());
            for(Account acc : accList){
                System.debug('inside for' +accList );
                DateTime dt = acc.DateTimeEST__c ;
                if(dt != null){
                    DateTime dtTimeTimeZone=new WithoutCheckingDST().convertDateTimeToOtherTimeZone(dt, 'America/New_York', 'Asia/Kolkata');
                   // DateTime dtTimeTimeZone=new UtcCovert().metchToConver(dt, 'EST');

                    System.debug('dtTimeZone==>'+dtTimeTimeZone);
                    acc.DateTimeEST__c = dtTimeTimeZone;
                 }
            }
        }
    }
}
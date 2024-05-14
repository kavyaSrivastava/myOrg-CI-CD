public class StringTimeConversion {
    public static void meth(){
        
        /*Account acc = new Account();
         * 9:38 am
        acc.Name = 'String acc';*/
        String comingdatestr = '2023-10-16T09:38:08-04:00';
        datetime converteddate = (DateTime)Json.deserialize('"'+comingdatestr+'"', DateTime.class);
        System.debug('c===>'+converteddate);
        String zoneOffset = comingdatestr.right(6);
        String deviation = zoneOffset.left(1);
        System.debug('ddd===>'+deviation);
        System.debug('zzz===>'+zoneOffset);
        String zoneOffsetValue = zoneOffset.right(5);
        System.debug('zzz2222===>'+zoneOffsetValue);
        
        String[] vales = zoneOffsetValue.split(':');
        System.debug('vales===>'+vales);
        Integer ooffsetfrosource = (Integer.valueOf(vales[0])*60) + Integer.valueOf(vales[1]);
        System.debug('ooffsetfrosource===>'+ooffsetfrosource);

        TimeZone targetTZ = UserInfo.getTimeZone();
        System.debug('Users timezone===>'+targetTZ);
        integer offsetTotargetTZ = targetTZ.getOffset(converteddate);
        offsetTotargetTZ = offsetTotargetTZ/(1000*60);
        system.debug('offsetTotargetTZ===>'+offsetTotargetTZ/(1000*60));
        Integer correction = 0;
        if(deviation == '-'){
            correction = offsetTotargetTZ + ooffsetfrosource;
            system.debug('....'+correction);
            system.debug('....'+correction);
            
            system.debug('....'+correction);
        }
        else{
            correction = offsetTotargetTZ - ooffsetfrosource;
            system.debug('....1'+correction);
        } 
        System.debug('Correction==>'+correction);
        
        DateTime targetDT = converteddate.addMinutes(correction / (1000 * 60));
        System.debug('targetDT==>'+targetDT);
        
        Account acc = new Account();
        acc.name = '1210new1210';
        acc.DateTimeEST__c = targetDT;
        System.debug(acc);
        insert acc;


        
        
    }

}
public class ConvertTimeZoneService {
    public static void methodToConvert(){
        
        
        DateTime dtTime=DateTime.now();
        System.debug(dtTime);
        DateTime dtTimeTimeZone=new TimeZoneService() .convertDateTimeToOtherTimeZone(dtTime, 'America/Santiago','America/New_York');
    	System.debug(dtTimeTimeZone);
    }
}
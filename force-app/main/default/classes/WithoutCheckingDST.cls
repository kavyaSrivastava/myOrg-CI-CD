public class WithoutCheckingDST {
    
    private DateTime convertToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone)
    {
        TimeZone tz = Timezone.getTimeZone(sourceTimezone);
         System.debug('source'+ tz);
        Integer offset=tz.getOffset(dttime);
        System.debug('offset==>'+ (offset /(1000 * 60)));
      
        TimeZone targetTZ = Timezone.getTimeZone(targetTimezone);
        System.debug('target timezone'+ targetTZ);
        integer offsetTotargetTZ = targetTZ.getOffset(dttime);
        integer correction = offsetTotargetTZ - offset;
         System.debug('offsetTotargetTZ==>'+ (offsetTotargetTZ/(1000 * 60)) );
        System.debug('Correction'+(correction / (1000 * 60)) );

        
        DateTime targetDT = dttime.addMinutes(correction / (1000 * 60));
        
        integer offsetTotargetTZ1 = targetTZ.getOffset(targetDT); // from target zone
        integer offset1 = tz.getOffset(targetDT);// from source zone
        if(offset != offset1){
            targetDT = targetDT.addMinutes(offset1-offset / (1000 * 60));
            system.debug('At line 18');
        }
        if(offsetTotargetTZ != offsetTotargetTZ1){
            targetDT = targetDT.addMinutes(offsetTotargetTZ1-offsetTotargetTZ / (1000 * 60));
            System.debug('at line 21');
            
        }
        
        
        System.debug('line 27 '+ targetDT);
        
        return targetDT;
    }
    //Convert Any Time to other timezone
    public Time convertTimeToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone)
    {
        DateTime targetDT = convertToOtherTimeZone(dttime,sourceTimezone,targetTimezone);
        return Time.newInstance(targetDT.hour(), targetDT.minute(), targetDT.second(), targetDT.millisecond());
    }
    
    //Convert Any DateTime to other timezone
    public DateTime convertDateTimeToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone)
    {
        System.debug('at line 40' + dttime );
        DateTime targetDT = convertToOtherTimeZone(dttime,sourceTimezone,targetTimezone);
        return DateTime.newInstance(targetDT.year(),targetDT.month(),targetDT.day(),targetDT.hour(), targetDT.minute(), targetDT.second());
        //return targetDT;
    }
    
}
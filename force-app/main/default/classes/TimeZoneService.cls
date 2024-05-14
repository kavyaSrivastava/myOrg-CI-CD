public class TimeZoneService
{
    
    public static string EST='America/New_York';
    private DateTime convertToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone)
    {
        TimeZone tz = Timezone.getTimeZone(sourceTimezone);
        System.debug('tz==>'+ tz);
        Integer offset=tz.getOffset(dttime);
        System.debug('offset===>' + offset );//5
        System.debug('dttime===>' + dttime );
         DateTime comming2 = dttime.addMinutes(-offset / (1000 * 60));
        Integer offset2=tz.getOffset(comming2);
        System.debug('comming2==>'+ comming2 );
        
        System.debug('offset2==>'+offset2 );
        
            if (offset != offset2) {
            // There's a drift because of a DST
            // transition. Correct it
            Datetime adjustedDatetime1 = comming2.addSeconds((offset - offset2) / 1000);
            
            Integer offsetAtAdjusted2 = tz.getOffset(adjustedDatetime1);
            System.debug('zzz');
            // The correction is conditional; if the corrected time is
            // on the same side of the transition as the correction then
            // we need to correct, but we must also correct if leaping
            // forward regardless
            if (offsetAtAdjusted2 == offset2 ||
                adjustedDatetime1 > comming2) {
                    comming2 = adjustedDatetime1;
                }
        }
                integer finaloffset1 = tz.getOffset(comming2);

        
        // target Timezone.
        TimeZone targetTZ = Timezone.getTimeZone(targetTimezone);
        System.debug('targetTZ==>' + targetTZ);
        integer offsetTotargetTZ = targetTZ.getOffset(dttime);
        System.debug('offsetTotargetTZ' + offsetTotargetTZ);//8
        
        // integer correction = offsetTotargetTZ- offset;
        //System.debug('correction==>'+ correction);
        
        // DateTime targetDT = dttime.addMinutes(correction / (1000 * 60));
        DateTime targetDT2 = dttime.addMinutes(-offsetTotargetTZ / (1000 * 60));
        // System.debug('targetDT=>'+ targetDT);
        System.debug('targetDT2=>'+ targetDT2);
        
        Integer offsetAtLocal = targetTZ.getOffset(targetDT2);
        System.debug('offsetAtLocal'+offsetAtLocal);
        if (offsetAtLocal != offsetTotargetTZ) {
            // There's a drift because of a DST
            // transition. Correct it
            Datetime adjustedDatetime = targetDT2.addSeconds((offsetTotargetTZ - offsetAtLocal) / 1000);
            
            Integer offsetAtAdjusted = targetTZ.getOffset(adjustedDatetime);
            System.debug('zzz');
            // The correction is conditional; if the corrected time is
            // on the same side of the transition as the correction then
            // we need to correct, but we must also correct if leaping
            // forward regardless
            if (offsetAtAdjusted == offsetAtLocal ||
                adjustedDatetime > targetDT2) {
                    targetDT2 = adjustedDatetime;
                }
        }
        
        System.debug('changed targetDT2==>'+ targetDT2);
        integer finaloffset = targetTZ.getOffset(targetDT2);
        integer correction = finaloffset- finaloffset1;
        System.debug('correction==>'+ correction);
        
        DateTime targetDT = dttime.addMinutes(correction / (1000 * 60));
        
        System.debug('targetDT=>'+ targetDT);
        // return targetDT;
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
        DateTime targetDT = convertToOtherTimeZone(dttime,sourceTimezone,targetTimezone);
        return DateTime.newInstance(targetDT.year(),targetDT.month(),targetDT.day(),targetDT.hour(), targetDT.minute(), targetDT.second());
    }
}
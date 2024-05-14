public class UtcCovert {
    public  Datetime metchToConver(Datetime dt , String zone){
        // String data = '2022-06-23T14:00:00+05.30'; // Coming from the API
        //String zone = 'Asia/Kolkata'; // Coming from the API
        //Datetime dt = (Datetime) JSON.deserialize('"' + data.substringBefore('+') + '"', Datetime.class);
        
        // Identify the target time zone
        TimeZone target = TimeZone.getTimeZone(zone);
                System.debug('target===>'+target);

        // Figure out the offset at this UTC "moment"
        Integer offsetAtUTC = target.getOffset(dt);
        System.debug('offsetAtUTC===>'+offsetAtUTC);
        
        // Adjust the date/time value to be in the
        // target time zone
        Datetime targetDatetime = dt.addSeconds(-offsetAtUTC / 1000);
                        System.debug('targetDatetime===>'+targetDatetime);

        // Now it is in the target time zone, we have
        // a new "moment". If the UTC "moment" was
        // before a DST transition but the "moment" in
        // the target time zone is after that
        // transition the calculation will be adrift
        Integer offsetAtLocal = target.getOffset(targetDatetime);
                        System.debug('offsetAtLocal===>'+offsetAtLocal);
        
        if (offsetAtLocal != offsetAtUTC) {
            // There's a drift because of a DST
            // transition. Correct it
            Datetime adjustedDatetime = targetDatetime.addSeconds((offsetAtUTC - offsetAtLocal) / 1000);
            
            Integer offsetAtAdjusted = target.getOffset(adjustedDatetime);
            
            // The correction is conditional; if the corrected time is
            // on the same side of the transition as the correction then
            // we need to correct, but we must also correct if leaping
            // forward regardless
            if (offsetAtAdjusted == offsetAtLocal ||
                adjustedDatetime > targetDatetime) {
                    targetDatetime = adjustedDatetime;
                }
        }
        
        System.debug('Output local: ' + targetDatetime.format('yyyy-MM-dd HH:ss a z', target.getID()));
        return targetDatetime;
    }
    
}
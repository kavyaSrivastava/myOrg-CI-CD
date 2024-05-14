trigger ConvertTimeZoneTrigger on Account (before insert) {
 if(trigger.isbefore && trigger.isinsert){
        ConvertTimeZoneHandler.convert(trigger.new);
     System.debug('inside trigger');
   }
}
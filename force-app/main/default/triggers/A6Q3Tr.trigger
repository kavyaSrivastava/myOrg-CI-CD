trigger A6Q3Tr on Product2 (after insert) {
     if(trigger.isafter && trigger.isinsert){
        A6Q3.stdpricebook(Trigger.new);
    }


}
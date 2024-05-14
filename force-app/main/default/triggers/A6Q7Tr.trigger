trigger A6Q7Tr on Opportunity (after insert) {
if(trigger.isafter && trigger.isInsert)
        A6q7.oppcontactrole(trigger.new);
}
trigger ClosingCase on WorkOrder (after update) {
  if(trigger.isafter && trigger.isupdate){
      ClosingCaseHandler.closingCaseMethod(trigger.new);
    }
}
trigger Product2Trigger on Product2 (After insert) {
    if(trigger.isinsert && trigger.isafter){
        ProductHandlerClass.productHandle(trigger.new);
    }

}
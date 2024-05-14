trigger TopopulateAddressInServiceAppointment on ServiceAppointment (before insert) {
        if(trigger.isbefore && trigger.isinsert){
        ToPopulateAddressHandler.addressMethod(trigger.new);
        
    }

}
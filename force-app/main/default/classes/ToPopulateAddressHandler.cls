public class ToPopulateAddressHandler {
    public static void addressMethod(List<ServiceAppointment>saList){
        Set<Id> workOrderIds = new Set<Id>();
        for(ServiceAppointment s: saList){
            if(s.ParentRecordId != null){
                workOrderIds.add(s.ParentRecordId);
            }
      }
        List<WorkOrder> workOrders = [SELECT Id, Street, City, PostalCode, State, Country FROM WorkOrder WHERE Id IN:workOrderIds];
        
        for(ServiceAppointment s : saList){
            for(WorkOrder w : workOrders){
                if(s.ParentRecordId == w.Id){
                    s.Street = w.Street;
                    s.City = w.City;
                    s.PostalCode = w.PostalCode;
                    s.State = w.State;
                    s.Country= w.Country;
                }
            }
        }
    }
    
}
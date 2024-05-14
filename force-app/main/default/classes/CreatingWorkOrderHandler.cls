public class CreatingWorkOrderHandler {
    public static void creatingwo(List<Case> caseList){
        List<WorkOrder> woList = new List<WorkOrder>();
        WorkType workTypeId = [SELECT Id FROM WorkType WHERE Name like 'Maintenance 1' LIMIT 1];
        ServiceTerritory serviceTerritoryId = [SELECT Id FROM ServiceTerritory Where Name like 'Lucknow' LIMIT 1];
        for(Case c:caseList){
            if(c.Origin == 'Email'){
                WorkOrder w= new WorkOrder();
                w.WorkTypeId = workTypeId.Id;
                w.ServiceTerritoryId = serviceTerritoryId.Id;
                w.Priority = 'Medium';
                w.CaseId = c.Id;
                woList.add(w);
                system.debug('Inserted workorder=======>' +woList);
             }
        }
        if(!woList.isEmpty() && woList != null)
        insert woList;
    }

}
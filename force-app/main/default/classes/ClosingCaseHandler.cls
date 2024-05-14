public class ClosingCaseHandler {
    public static void closingCaseMethod(List<WorkOrder> woList){
        List<Case> caseList = new List<Case>();
        for(WorkOrder w: woList){
            if(w.Status == 'Closed'){
                case c = new Case();
                if(w.CaseId != null ){
                 c.Id = w.CaseId;   
                }
                c.Status = 'Closed';
                caseList.add(c);
            }
        }
        if(caseList!=null && !caseList.isEmpty())
        update caseList;
    }
}
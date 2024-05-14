@isTest
public class AssignServiceTerritoryTest {
    @testsetup
    public static void testSetupMethod(){
        Case dummyCase = new Case();
        dummyCase.Status = 'New';
        dummyCase.Origin = 'Phone';
        insert dummyCase;
        
        WorkType wType = new WorkType();
        wType.Name = 'Maitenance';
        wType.EstimatedDuration = 1;
        wType.DurationType = 'Hours';
        wType.ShouldAutoCreateSvcAppt = true;
        insert wType;
        
        OperatingHours op = new OperatingHours();
        op.Name = 'AvailabilityHours';
        // op.TimeZone = '(GMT+13:00) Tokelau Time (Pacific/Fakaofo)';
        insert op;
        
        ServiceTerritory st = new ServiceTerritory();
        st.Name = 'Lucknow';
        st.City = 'Lucknow';
        st.Street = '538 KA/ 1221 D Shivlok, Triveni Nagar 3rd';
        st.PostalCode ='226020';
        st.Country = 'India';
        st.State = 'Uttar Pradesh';
        st.OperatingHoursId = op.Id;
        st.Latitude = 26.88906;
        st.Longitude = 80.92126;
        st.isActive = true;
        // st.FSL__Internal_SLR_Geolocation__c = Location.newInstance(26.88906,80.92126)
        insert st;
        
        
        WorkOrder w = new WorkOrder();
        w.WorkTypeId = wType.Id;
        w.CaseId = dummyCase.Id;
        w.Street ='538 KA/ 1221 D Shivlok, Triveni Nagar 3rd';
        w.City = 'Lucknow';
        w.PostalCode = '226020';
        w.State = 'Uttar Pradesh';
        w.Country = 'India';
        w.StartDate = Date.newInstance(2023,09,05);
        w.EndDate = Date.newInstance(2023,09,08);
        insert w;
        
        WorkOrder w2 = new WorkOrder();
        w2.WorkTypeId = wType.Id;
        w2.CaseId = dummyCase.Id;
        w2.Street ='3942 Echo Lane';
        w2.City = 'Newborn';
        w2.PostalCode = '30056';
        w2.State = 'Georgia';
        w2.Country = 'United States';
        w2.StartDate = Date.newInstance(2023,09,05);
        w2.EndDate = Date.newInstance(2023,09,08);
        insert w2;
        
        
    }
    
    
    @istest
    public static void testingMethod(){
        
        WorkOrder wo = [SELECT Id FROM WorkOrder Where Country like 'India' LIMIT 1];    
        List < ServiceAppointment > saList = [SELECT Id, ParentRecordId,Latitude, Longitude FROM ServiceAppointment Where ParentRecordId =: wo.Id ] ;
        
        List < Id > saId = new List<Id> ();
        saList[0].Latitude = 26.88906;
        saList[0].Longitude = 80.92126;
        Update saList[0];
        system.debug(saList);
        for(ServiceAppointment s: saList){
            saId.add(s.Id);
        }
        
        system.test.starttest();
        List<AssignServiceTerritory.ReturnedVariable> result =  AssignServiceTerritory.main(saId);
        
        system.test.stoptest();
        
        
        
        System.assertEquals(1, result[0].completed);
    }
    @istest
    public static void testingMethodForNegativeCase(){
        WorkOrder wol = [SELECT Id FROM WorkOrder Where Country like 'United States' LIMIT 1]; 
        System.debug('wol=====>' + wol);
        
        List < ServiceAppointment > saList1 = [SELECT Id, ParentRecordId,Latitude, Longitude FROM ServiceAppointment Where ParentRecordId =: wol.Id ] ;
        saList1[0].Latitude = 33.524370;
        saList1[0].Longitude = -83.637020;
        Update saList1[0];
        
        List<Id> saId2 = new List<Id>();
        saId2.add(saList1[0].Id);
        system.test.starttest();
        
        List<AssignServiceTerritory.ReturnedVariable> result2 =  AssignServiceTerritory.main(saId2);
        system.test.stoptest();
        
        System.assertEquals(0, result2[0].completed);}
    
    
    
}
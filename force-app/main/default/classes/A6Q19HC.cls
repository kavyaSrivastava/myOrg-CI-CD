public class A6Q19HC {
    public static void method(list<lead> leadList){
        dATEtime D=leadlist[0].cREATEDdaTE;
        integer m= d.month();
        List<Lead> tm=[SELECT ID FROM LEAD WHERE OWNERID=:leadlist[0].OwnerID and CALENDAR_MONTH(CreatedDate)=:m];
           
            if(tm.size()>=30){
                leadlist[0].adderror('cannot add more lead to the same owner in this month');
            }
             
        
    }

}
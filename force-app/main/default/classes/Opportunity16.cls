public class Opportunity16 {
public static void updateName(){
        List <Opportunity> opList = [SELECT Id, Name FROM Opportunity ORDER BY CloseDate ];
        List <Opportunity> op = new List<Opportunity>();
        for(Opportunity o : opList){
            o.Name =  o.Name +'F';
            op.add(o);
        }
        update op;

}
}
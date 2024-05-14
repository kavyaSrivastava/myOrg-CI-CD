public class BST1Q3 {
    Public static void meth(){
        List<Lead> leadl = [SELECT Id,Name From Lead where Status != 'Closed-Converted'];
        delete leadl;
    }
}
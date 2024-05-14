public class binary {
public static String addBinary(String s1,String s2){
        integer b1= Integer.valueof(s1);
        integer b2= Integer.valueof(s2);
	
	integer i = 0, carry = 0;

    list<Integer> sum=new list<Integer>(); 

	while (b1 != 0 || b2 != 0) 
	{
        integer b11=math.mod(b1,10);
         integer b22=math.mod(b2,10);
		integer b= (integer)(math.mod((b11 + b22 + carry),2));
		carry = (integer)((b11+ b22 + carry) / 2);
		b1 = b1 / 10;
		b2 = b2 / 10;
        sum.add(b);
}

	if (carry != 0) {
		sum.add(carry);
	}
         String res='';	
        for(integer j=sum.size()-1;j>=0;j--){
            res += sum[j];
        }
        return(res);
    }
}
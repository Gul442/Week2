public class CalculatorSimple {
    
    public static integer add(integer a, integer b) {
        integer sum = a + b;
        return sum;
    }
    public static integer add(integer a, integer b, integer c) {
        integer sum = a + b + c;
        return sum;
    }
    public static integer add(list<integer> intList){
        integer returnSum=0; //10,15,21
        for (integer  eachInteger : intList) {
            returnSum=returnsum+eachInteger;
        }
        return returnSum;

            
        }

    }


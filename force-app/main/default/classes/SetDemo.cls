public class SetDemo {
    public  static void citySet() {
        set<string> cities =new set<string>();
        cities.add('tokyo');
        cities.add('lisbon');
        cities.add('berlin');
        cities.add('lisbon');
        cities.add('TOKYO');
        cities.add('istnbul');
        system.debug('set of cities= '+cities);
    }

    public static void randomIntegerSet(){
        Set<integer>integerSet = new Set<integer>();
        integerSet.add(15);
        integerSet.add(19);
        integerSet.add(21);
        integerSet.add(15);
        integerSet.add(15);
        integerSet.add(15);

        system.debug('set of integers = '+integerSet);
    }
     public static set<integer> setFromList(List<integer> intList) {
        Set<Integer> setOfInt = new set<integer>();
        //set we can add all elements of a SET. 
        setOfInt.addAll(intList);//addAll is used to add all the elements from a list or a set. 
        return setOfInt;
    }
    public static Set<String> capitalizeAllSet(Set<String> setString){
        Set<String> returnSet= new Set<String>();

        for (string eachStr : setString) {
            returnSet.add(eachStr.toUppercase());
        }return returnSet;
       
    } 
}

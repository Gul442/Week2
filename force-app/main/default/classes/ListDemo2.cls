public class ListDemo2 {
    public static void iterateListInteger() {
        list<integer> listInteger = new list<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);

        for (integer eachInteger : listInteger) {
            system.debug(eachInteger);
            
        }
    }
        public static Set<integer> setFromList(List <integer> intList){
            Set<integer> setOfInt = new Set<integer>();
            setOfInt.addAll(intList);
            return setOfInt;
        }

    }

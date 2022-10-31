public class MapDemo {
    public static string retrieveMonths(integer m){
        string month='';
        map<integer,string> monthMap=new map<integer,string>();
        monthMap.put(1,'january');
        monthMap.put(2,'february');
        monthMap.put(3,'march');
        monthMap.put(4,'april');

        monthMap.put(5,'may');
        monthMap.put(6,'june');
        monthMap.put(7,'july');
        monthMap.put(8,'august');

        monthMap.put(9,'september');
        monthMap.put(10,'octber');
        monthMap.put(11,'november');
        monthMap.put(12,'december');

        boolean keyExist=monthMap.containsKey(m);
        if(keyExist){
            month=monthMap.get(m);
        }else{
            month='No such month exist.Please behave!';
        }
        return month;

    }
    
}

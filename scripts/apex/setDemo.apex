//SetDemo.citySet();
//setDemo.randomIntegerSet();
setDemo.setOfInt();

 list<integer> listInteger = new list<integer>();
listInteger.add(21);
listInteger.add(15);
listInteger.add(15);
listInteger.add(19);

set<integer> setInteger = SetDemo.setFromList(listInteger);
system.debug('setInteger ==>> ' + setInteger);

   set<string> cities =new set<string>();
        cities.add('tokyo');
        cities.add('lisbon');
        cities.add('berlin');
        cities.add('lisbon');
        cities.add('TOKYO');
        cities.add('istnbul');
        system.debug(SetDemo.capitalizeAllSet(cities));


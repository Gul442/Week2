map<string,string> mapCountryCurrency= new map<string,string>();
mapCountryCurrency.put('usa','dollar');
mapCountryCurrency.put('france','euro');
mapCountryCurrency.put('india','rupees');
mapCountryCurrency.put('india','rupee');
mapCountryCurrency.put('canada','dollar');
mapCountryCurrency.put('türkiye','lira');

string indiaCrrency=mapCountryCurrency.get('india');
system.debug('india currency => '+indiaCrrency);

string tr='türkiye';
string trCurrency=mapCountryCurrency.get(tr);
system.debug('türkiye\'s currency => '+tr);

Set<String> allCountries=mapCountryCurrency.keySet();
system.debug('all countries are '+allCountries);

List<String> currencies=mapCountryCurrency.values();
system.debug('all currencies => '+currencies);

Set<String> countriesSet=mapCountryCurrency.keySet();
for(string eachC: countriesSet){
    string printStr=mapCountryCurrency.get(eachC);
    string a=eachC+' ,its currency is '+printStr;
    System.debug(a);
}
public class StringDemoClass {
    public void stringMethod1(){
        string sessionDescription='learning string method in apex language';
        system.debug(sessionDescription);

        //1.length
        integer lengthOfStr=sessionDescription.length();
        system.debug('length of str is ... '+lengthOfStr);
        //uppercase
        string sessionDescriptionInCaps=sessionDescription.toUpperCase();
        system.debug('session description in caps = ' +sessionDescriptionInCaps);
        //contains
        boolean containsApex= sessionDescription.contains('Apex');
        system.debug('contains apex???    '+containsApex);
        //contains2
        boolean containsApex2=sessionDescription.containsIgnoreCase('APEX');
        system.debug('contains APEX???    '+containsApex2);
        // contain3
        string s1='salesforce';
        boolean containsSalesforce=sessionDescription.containsIgnoreCase(s1);
        System.debug('contains salesfforce??  '+containsSalesforce);
    
    
    
    
    
    
    
    
    
    
    }
    
}

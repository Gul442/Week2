@istest
public class SFProjectTriggerTest {
    @istest
    private static void testTrigger1(){
        Salesforce_Project__c s=new Salesforce_Project__c();
        s.Project_Name__c='Learn testing methods';
        insert s;
        list<Salesforce_Project__c>listSP=[select id,Project_Name__c from Salesforce_Project__c where Project_Name__c like '%test%'];
        System.assertequals('Learn testing methods',listSP[0].Project_Name__c);

        s.Project_Name__c='Learn testing methods for triggers';
        update s;
        list<Salesforce_Project__c>listSP2=[select id,Project_Name__c from Salesforce_Project__c where Project_Name__c like '%trigger%'];
        System.assertequals('Learn testing methods for triggers',listSP2[0].Project_Name__c);
    }

    
}
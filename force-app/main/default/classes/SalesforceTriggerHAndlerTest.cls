@istest
public class SalesforceTriggerHAndlerTest {
    @istest
    private static void testfurture1() {
        //prepare data
        salesforce_project__c sp=new salesforce_project__c();
        sp.description__c='test description';
        sp.Project_Name__c='test future';

        salesforce_project__c sp2=new salesforce_project__c();
        sp2.description__c='test description2';
        sp2.Project_Name__c='test future2';

        List<salesforce_project__c> insertsp = new List<salesforce_project__c>{sp,sp2};
        insert insertsp;

        Set<id> setid = new Set<id>{sp.id,sp2.id};

        test.starttest();
        SPTriggerHandler.updateProjectDescription(setid);
        test.stoptest();

        List<salesforce_project__c> resultsp = [select id,description__c from salesforce_project__c];
        System.assert(resultsp[0].description__c.contains('future'));
        
    }
}

@isTest
public class DmlDemoTest {
    @isTest
    private static void dmlTest1(){
        DmlDemo.dmlInsertDemo_StndObj1();
        list<account> listAcc=[select id,name from account];
        system.assertEquals(1,listAcc.size());
        system.assertEquals('annoying orange',listAcc[0].name);

    }
    @isTest
    private static void dmlUpdateDemoTest2() {
        //1. Prepare DATA
        Account acc = new account();
        acc.Name = 'Turkish Review';
        insert acc;
 
        //2. call method
        DmlDemo.dmlUpdateDemo_2();
 
        //3. assert
        //to assert data if we are inserting/updating in our method.
        //Always fetch data using soql
        list<account> checkAccount = [select id, name from account where name = 'Turkish Review Inc.'];
        system.assertEquals(1, checkAccount.size());
    }
   @isTest
   private static void dmlInsertDemoTest2(){
    //1,prepare data
    salesforce_project__c sp=new salesforce_project__c();
    sp.Project_Name__c = 'DML Islemleri';
        sp.Description__c = 'All %100 are great learners';
        insert sp;
        //2,call method
        DmlDemo.dmlInsertDemo_2();
        //3,assert
        list<salesforce_ticket__c> listST=[select name,id,subject__c,Salesforce_Project__c from salesforce_ticket__c where subject__c='learn APEX DML'];

        
   }
}

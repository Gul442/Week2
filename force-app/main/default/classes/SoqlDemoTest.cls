@istest
public class SoqlDemoTest {
    @TestSetup
    static void makeData(){
         //prepare data
         account acc1= new account();
         acc1.name='SI Test';
         acc1.industry='Energy';
 
         account acc2= new account();
         acc2.name='UI Test';
         acc2.industry='Energy';
         
         account acc3= new account();
         acc3.name='PI Test';
         acc3.industry='Banking';
 
         list<account> accList= new list<account>{acc1,acc2,acc3};
         insert accList;
 
         list<contact> listContact=new list<contact>();
         for (Integer i = 0; i < 300; i++) {
             contact c = new contact();
             c.LastName = 'Soql test ' + i;
             if (i< 100) {
                 c.AccountId = acc1.id;
             } else if (i < 200) {
                 c.AccountId = acc2.id;
             } else {
                c.accountid = acc3.id;
             }
             listContact.add(c);
         }
         insert listContact;
        
    }
    @isTest
private static void testSOQLparentToChild() {
        test.startTest();
        Soqldemo2.childToParent_SOQL1();
        test.stopTest();    
    }
    @isTest
private static void testSOQLParentToChild2() {
        //to use records created in setup, we do soql
        list<account> listAcc = [select id, type, name from account];//how many records this will fetch? 3.
        for (account acc : listAcc) {
            acc.Type = 'Customer - Direct';
        }
        update listAcc;

       //create opportunity for accounts created in testSetup method 
       List<Opportunity> listOPP = new List<Opportunity>();
       for (Integer i = 0; i < 300; i++) {
           Opportunity o = new Opportunity();
           o.Name = ' test opp ' + i;
           o.StageName = 'Closed Won';
           o.CloseDate = Date.today();
           if (i < 100) {
               o.AccountId = listAcc[0].Id;
           } else if (i < 200) {
               o.AccountId = listAcc[1].Id;
           } else if (i < 300) {
               o.AccountId = listAcc[2].Id;
           }
           listOPP.add(o);
       }
       insert listOpp;
       //END of prepare data
       test.startTest();
       SoqlDemo2.parentToChild_SOQL1();
       test.stopTest();

    }
    




}




    // @istest
    // private static void testSOQLparentToChild(){
       

    //     test.startTest();
    //     SoqlDemo2.childToParent_SOQL1();
    //     test.stopTest();
    //     system.assert(listContact.size()>0);
        



    // }

    

 // //prepare date
        // account acc1= new account();
        // acc1.name='SI Test';
        // acc1.industry='Energy';

        // account acc2= new account();
        // acc2.name='UI Test';
        // acc2.industry='Energy';
        
        // account acc3= new account();
        // acc3.name='PI Test';
        // acc3.industry='Banking';

        // list<account> accList= new list<account>{acc1,acc2,acc3};
        // insert accList;

        // list<contact> listContact=new list<contact>();
        // for (Integer i = 0; i < 300; i++) {
        //     contact c = new contact();
        //     c.LastName = 'Soql test ' + i;
        //     if (i< 100) {
        //         c.AccountId = acc1.id;
        //     } else if (i < 200) {
        //         c.AccountId = acc2.id;
        //     } else {
        //        c.accountid = acc3.id;
        //     }
        //     listContact.add(c);
        // }
        // insert listContact;
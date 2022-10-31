public class DmlDemo {
    public static void dmlInsertDemo_StndObj1() {
        // 1. Create new instance
        Account acc = new Account();
        //2. Set Field Values
        acc.Name = 'Turkish Review';
        //3. Set other fields
        acc.Phone = '12345678';

        //4. Insert NOW
        insert acc; 

        System.debug(acc);
    }

    public static void dmlInsertDemo_CstmObj1(){
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'DML Islemleri';
        sp.Description__c = 'All %100 are great learners';
        insert sp;
    }

    public static void dmlUpdateDemo_1(){
        Account acc = new Account();
        acc.Name = 'Anything';
        System.debug('Before Insert Acc ==> ' + acc);
        insert acc;
        System.debug('After Insert Acc ==> ' + acc);
        
        acc.Name = 'Amazon Inc.';
        update acc;
        System.debug('After Update Acc ==> ' + acc);

    }

    public static void dmlUpdateDemo_2(){
        Account acc = [SELECT Id, Name FROM Account Where Name = 'Turkish Review' LIMIT 1];

        acc.Name = 'Turkish Review Inc.';
        update acc;
    }
    public static void dmlInsertDemo_1(){
        account acc=[ select id,name from account order by createddate desc limit 1];
        contact cont=new contact();
        cont.lastname='biden';
        cont.accountid=acc.id;
        insert cont;
    }
    public static void dmlInsertDemo_2(){
        salesforce_project__c sp=[select name,id from Salesforce_Project__c order by createddate desc limit 1];
        salesforce_ticket__c st= new salesforce_ticket__c();
        st.subject__c='learn APEX DML';
        st.Description__c='kinda simple';
        st.priority__c='High';
        st.status__c='New';
        st.requested_by_date__c=date.newinstance(2022,8,11);
        st.salesforce_project__c=sp.id;
        insert st;

    }
    public static void dmlMultipleinsert_right1(){
        list<account> listacc= new list<account>();
        account acc1= new account();
        acc1.name='bulk acc 1';
        listacc.add(acc1);
        account acc2= new account();
        acc2.name='bulk acc 2';
        listacc.add(acc2);
        account acc3= new account();
        acc3.name='bulk acc 3';
        listacc.add(acc3);

        insert listacc;

        }

    public static void dmlMultipleinsert_right2(){
        list<account> listAcc= new list<account>();
        for (integer i=0; i<155;i++){
            account a =new account();
            a.name='SoftInnovas 30ct-v'+i;
            a.active__c='Yes';
            listAcc.add(a);
        } 
    insert listAcc;   }


public static void dmlMultipleRecordUpdate_right1(){
    list<account> fetchacc=[select id,name from account order by createddate desc limit 155];
    list<account> updateAcc= new list<account>();
    for (account eachAcc : fetchacc){
        eachAcc.name+=' via B.0';
        eachAcc.accountNumber='25656355';
        updateAcc.add(eachAcc);
    
    }
    if(!updateAcc.isempty()){
        update updateAcc;
    }
}
}




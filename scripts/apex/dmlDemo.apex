DmlDemo.dmlInsertDemo_StndObj1();

DmlDemo.dmlInsertDemo_CstmObj1();

DmlDemo.dmlUpdateDemo_1();

DmlDemo.dmlUpdateDemo_2();
DmlDemo.dmlInsertDemo_1();
DmlDemo.dmlInsertDemo_2();
DmlDemo.dmlMultipleinsert_right1();
DmlDemo.dmlMultipleinsert_right2();
DmlDemo.dmlMultipleRecordUpdate_right1();

 List<account> listAccount = new list<account>();

        account acc1 = new Account();
        acc1.Name = 'bulk acc 1';
        //insert acc1;
        listAccount.add(acc1);

        account acc2 = new Account();
        acc2.Name = 'bulk acc 2';
        //insert acc2;
        listAccount.add(acc2);

        account acc3 = new Account();
        acc3.Name = 'bulk acc 3';
        listAccount.add(acc3);

        insert listAccount;//insert LIST.
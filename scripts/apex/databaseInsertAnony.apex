List<account> listAccount = new list<account>();

account acc1 = new Account();
acc1.Name = 'bulk acc 11';
//insert acc1;
listAccount.add(acc1);

account acc2 = new Account();
acc2.Name = 'bulk acc 22';
//insert acc2;
listAccount.add(acc2);

account a1= new account();
account a2= new account();

listAccount.add(a1);
listAccount.add(a2);

list<database.saveresult> results=database.insert(listAccount,false);
for (database.saveresult sr: results) {
    if(sr.issuccess()){
        System.debug('acc inserted successfully ,acc id is '+sr.getid());
    }else{
        System.debug('acc error is ..'+sr.getErrors());
    }
    
}
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    //check if switch is on or off for account obj
    triggerSwitch__c accountSwitch = triggerSwitch__c.getInstance('account');
    if(accountSwitch.switch__c==false){
        return;
    }
    system.debug('====trigger start======');
    if (trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isafter && trigger.isupdate) {
    AccountTriggerHandler.updateVIPforAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        
    }
    if (Trigger.isAfter && Trigger.isInsert) {

        AccountQueueableExample aq = new AccountQueueableExample(Trigger.new);
        system.enqueueJob(aq);
    }
    
    system.debug('====trigger end====');
} 



 //  if(trigger.isbefore){
    //     for(account eachAcc:trigger.new){
    //         boolean updateDesc=false;
    //         if(trigger.isinsert && eachAcc.Active__c=='Yes'){
                
    //             updateDesc=true;
    //         }
    //         if(trigger.isupdate){
    //             if(eachAcc.active__c=='Yes' && trigger.oldmap.get(eachAcc.id).active__c != trigger.newmap.get(eachAcc.id).active__c){
                    
    //                 updateDesc=true;
    //             }            }
    //             if(updateDesc){
    //                 eachAcc.Description='Account is now active. Enjoy';
    //             }
    //     }


    // integer countWSChanged=0;
    // if(trigger.isafter && trigger.isupdate){
    //     Set<Id> accids=trigger.newmap.keyset();
    //     for (id eachid : accids) { //updated acc ids
    //         account oldAcc=trigger.oldMap.get(eachid);
    //         string oldWebSite=oldAcc.Website;

    //         account newAcc=trigger.newMap.get(eachid);
    //         string newWebsite=newAcc.Website;
    //         if(oldWebSite != newWebSite){
    //             countWSChanged++;
    //             System.debug('For account '+newAcc.name+ ' website is changed to '+newWebSite);

    //         } System.debug('total # of account where website is changed ==> '+countWSChanged);
    // }









    // Map<id, account> newMapAcc = trigger.newMap;
    // map<id, account> oldMapAcc = trigger.oldMap;
    // if(trigger.isupdate&& trigger.isafter){
    //     set<id> accids=newMapAcc.keyset();
    //     for(id eachid : accids){
    //         System.debug('eachid==> '+eachid);
    //         account newAccount=newMapAcc.get(eachid);
    //         System.debug('new account name ==> '+newAccount.name);
    //         account oldAccount=oldMapAcc.get(eachid);
    //         System.debug('old account name ==> '+oldAccount.name);
    //     }
    // }
   








    // if (trigger.isInsert && trigger.isBefore) {
    //     system.debug('before insert Trigger.OldMap ==> ' + oldMapAcc);//null
    //     system.debug('before insert Trigger.NewMap ==> ' + newMapAcc);//n
    // }
    // if (trigger.isInsert && trigger.isAfter) {
    //     system.debug('after insert Trigger.OldMap ==> ' + oldMapAcc);
    //     system.debug('after insert Trigger.NewMap ==> ' + newMapAcc);
    // }
    // if (trigger.isUpdate && trigger.isBefore) {
    //     system.debug('before update Trigger.OldMap ==> ' + oldMapAcc);
    //     system.debug('before update Trigger.NewMap ==> ' + newMapAcc);
    // }
    // if (trigger.isUpdate && trigger.isAfter) {
    //     system.debug('after update Trigger.OldMap ==> ' + oldMapAcc);
    //     system.debug('after update Trigger.NewMap ==> ' + newMapAcc);
    // } 





//if (Trigger.isafter && Trigger.isUpdate) {
    //     List<account> oldAccounts = trigger.old;
    //     for (Account eachAccOld : oldAccounts) {
    //         system.debug('old id ==> ' + eachAccOld.Id + ' old name ==> ' + eachAccOld.Name);
    //     }
    //     List<account> newAccounts = trigger.new;
    //     for (Account eachAccnew : newAccounts) {
    //         system.debug('new id ==> ' + eachAccnew.Id + ' new name ==> ' + eachAccnew.Name);
    //     }
    // }
    // if(trigger.isinsert &&trigger.isbefore){
    //     System.debug('before insert trigger.old==> '+trigger.old);

    // }
    // if(trigger.isinsert &&trigger.isafter){
    //     System.debug('after insert trigger.old==> '+trigger.old);

    // }
    
    // if(trigger.isupdate &&trigger.isbefore){
    //     System.debug('before update trigger.old==> '+trigger.old);

    // }
    // if(trigger.isupdate &&trigger.isafter){
    //     System.debug('afterupdate trigger.old==> '+trigger.old);

    // }














    //Account (before insert, before update, after insert, after update) {
        // system.debug('====trigger start======');
        // //trigger.new   ALWAYS  gives List<sObject>. ALWAYS. Even if we updating/inserting JUST one record.
        //     //ALWAYS list<sObject>
        // List<account> newAccounts = trigger.new;
        //     //why?? Trigger RUNS only once when we process multiple records at a time.
        //     system.debug('number of records --> ' + newAccounts.size());
        // if (trigger.isBefore && trigger.isInsert) {
        //     system.debug('//before trigger trigger.new ==> ' + newAccounts);
        //     for (account acc : newAccounts) {
        //         system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        //     }
        // }
        // if (trigger.isAfter && trigger.isInsert) {
        //     system.debug('after trigger trigger.new ==> ' + newAccounts);
        //     for (account acc : newAccounts) {
        //         system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        //     }
        // }

        // if (trigger.isBefore && trigger.isupdate) {
        //     system.debug('//before update trigger.new ==> ' + newAccounts);
        //     for (account acc : newAccounts) {
        //         system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        //     }
        // }
        // if (trigger.isAfter && trigger.isupdate) {
        //     system.debug('after update trigger.new ==> ' + newAccounts);
        //     for (account acc : newAccounts) {
        //         system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        //     }
        // }
    
        // system.debug('====trigger end====');
        
        /*
        if (trigger.isBefore) {
            system.debug('BEFORE(insert or update) trigger called.');
            if (trigger.isInsert) {
                system.debug('before insert trigger called');
            }
            if(trigger.isUpdate){
                system.debug('before update trigger called');
            }
        }
        if (trigger.isAfter) {
            system.debug('AFTER(insert or update) trigger called.');
            if (trigger.isInsert) {
                system.debug('after insert trigger called');
            }
            if(trigger.isUpdate){
                system.debug('after update trigger called');
            }
        }
        */
    
        /*
         if (Trigger.isBefore && Trigger.isInsert) {
            system.debug('Before insert account trigger called.');
        } 
        if (Trigger.isAfter && Trigger.isInsert) {
            system.debug('After insert account trigger called.');
        }
        
        if (Trigger.isBefore && Trigger.isUpdate) {
            system.debug('Before update account trigger called.');
        } 
        if (Trigger.isAfter && Trigger.isUpdate) {
            system.debug('After update account trigger called.');
        }
        */
    
        /*if (Trigger.isInsert) {
            system.debug('before insert account trigger called.');    
        }
        if(Trigger.isUpdate){
            system.debug('before update account trigger called');
        }*/
        
        
        /*0
        //print before insert debug only in BEFORE TRIGGER
        if (Trigger.isBefore) {
            system.debug('before insert account trigger called.');
        }
        ////print after insert debug only in AFTER TRIGGER
        if (Trigger.isAfter) {
            system.debug('AFTER insert account trigger called.');
        }*/
       






    //  System.debug('====trigger starts===');
//  list<account> newAccounts=trigger.new;
//     if (trigger.isAfter&& trigger.isinsert) {
//         System.debug('after trigger trigger.new '+newAccounts);
//         System.debug('number of records--> '+newAccounts.size());
//         for(account acc: newAccounts){
//             System.debug('acc id ==> '+acc.id+' acc name ==> '+acc.name);

//         }
        
//     }
//     System.debug('===trigger ends');























    //     system.debug('==trigger starts==');
// list<account> newAccounts=trigger.new;   
// if(trigger.isAfter){
//     System.debug('after trigger trigger.new '+trigger.new);
//     System.debug('number of records --> '+newAccounts.size());

// }

//     system.debug('====trigger ends==');




    // if (trigger.isBefore) {
    //     system.debug('BEFORE(insert or update) trigger called.');
    //     if (trigger.isInsert) {
    //         system.debug('before insert trigger called');
    //     }
    //     if(trigger.isUpdate){
    //         system.debug('before update trigger called');
    //     }
    // }
    // if (trigger.isAfter) {
    //     system.debug('AFTER(insert or update) trigger called.');
    //     if (trigger.isInsert) {
    //         system.debug('after insert trigger called');
    //     }
    //     if(trigger.isUpdate){
    //         system.debug('after update trigger called');
    //     }
    // }


 // if(trigger.isBefore && trigger.isInsert){
    //     System.debug('before insert account trigger called');
    
    // }
    // if(trigger.isAfter && trigger.isInsert){
    //     System.debug('after insert account trigger called');
    // }
    // if(trigger.isBefore && trigger.isupdate){
    //     System.debug('before update account trigger called');
    
    // }
    // if(trigger.isAfter && trigger.isupdate){
    //     System.debug('after update account trigger called');
    // }



// if(trigger.isInsert){
// system.debug('before insert account trigger called');
// }
// if(trigger.isUpdate){
//     system.debug(' before update account  trigger called');
// }


    // //Print before insert insert debug only in before trigger
//     if(Trigger.isBefore){
//     
//     }
// //Print after insert insert debug only in before trigger
// if(Trigger.isAfter){
// system.debug('AFTER insert account trigger called');
// }






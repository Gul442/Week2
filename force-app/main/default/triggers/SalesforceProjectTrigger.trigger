trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert,before update,after insert,after update) {
    if (trigger.isafter && trigger.isinsert) {
        SPTriggerHandler.createDefaultSalesforceTicket(trigger.new);
        //call future method
        SPTriggerHandler.updateProjectDescription(trigger.newmap.keyset());
        SalesforceProjectTriggerHandler.updateProjectDescription(trigger.newmap.keySet());
    }
    // if(trigger.isBefore && Trigger.isUpdate){
    //     SPTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    // }
    if (Trigger.isAfter && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.spCompletedProject(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }





}  








// nazik assign
//System.debug('====trigger starts===');
//     if (Trigger.isbefore && Trigger.isinsert) {
//         List<salesforce_project__c> newSP = trigger.new;
//         for (salesforce_project__c eachSP : newSP) {
//             system.debug(' new id ==> ' + eachSP.Id + ' new name ==> ' + eachSP.Project_Name__c);
//         }}

//     if(trigger.isbefore&& trigger.isUpdate){
        
//         for (salesforce_project__c eachSP : trigger.new) {
//             system.debug('id update ==> ' + eachSP.Id + 'name updated  ==> ' + eachSP.Project_Name__c);
//         }
        
//         for (salesforce_project__c eachSP : trigger.old) {
//             system.debug('old id ==> ' + eachSP.Id + ' old name ==> ' + eachSP.Project_Name__c);
//         }
//     }
//     System.debug('=====trigger ends=====');
// }






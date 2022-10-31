public class PrimitiveDataTypeDemo {
    public void printBasicDataType(){
        system.debug('printing primitive datatypes');
        String batchName='batch 9';
        Integer totalCandidates= 70;
        boolean isAdminCompleted=true;
        system.debug(batchName);
        system.debug(totalCandidates);
        system.debug(isAdminCompleted);

        String batchDescription= batchName +' is fantastic.';
        system.debug(batchDescription);
        Decimal decValue=45551515.55;
        system.debug(decValue);
        Long longValue=5454545L;
        system.debug(longValue);
        object obj='This is a string';
        Object obj2=42.2;
        Object obj3=true;
        system.debug(obj);
        system.debug(obj2);
        system.debug('3rd obj is '+obj3);
        Id id1='0015g00000s9qW2AAI';
        system.debug('id is '+id1);
    
    }
}

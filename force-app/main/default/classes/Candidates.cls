public class Candidates {
    public string name;
    public string  gender;
    public static string companyName;//static members belongs to class

    public void printCandidate(){

        system.debug('Candidate name is '+name+'('+gender+')');
        system.debug('company name is '+companyName);
        system.debug('===END===');
    }
    public static void printCandidateInfo(){
        //system.debug('company name is '+name); // cant use non static in static methods
        system.debug('company name is '+companyName);


    }
    
}

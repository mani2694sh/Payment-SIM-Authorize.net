public class PaymentController2 {
    public static string apilogin{get;set;}  
    public static string apitranskey{get;set;}
    public string TimeStamp{get;set;}
    public Integer sequence{get;set;}
    public String sequence1{get;set;}
	public String amount {get;set;}
    public static string finger;
    
	public PageReference pr; 

    public PaymentController2(){
        try{
            String custPayProfileId;
            String custProfileId;
            
            amount = '50.00';
                        
            pr = new PageReference('/apex/iframepayment');
                           
            Http http1 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setEndpoint('https://apitest.authorize.net/xml/v1/request.api');
            req1.Setheader('Content-Type','application/json');
            req1.setMethod('POST');
            //req1.setbody(CreateCustProString);
            req1.setbody('json');
            
            HttpResponse res1 = http1.send(req1);
            //system.debug('res1==>' +res1);
            //system.debug('res1==>' +res1.getBody());
            
            if(res1.getStatusCode() == 200){
                String str=res1.getbody().escapeUnicode();
                string FinalJSON=str.replaceall('uFEFF','');
                FinalJSON=FinalJSON.replaceall('\\\\','');
            }
            
    }catch(Exception e){
            system.debug(e.getMessage()+ ' - lineMsg: '+e.getLineNumber()+' - '+ e.getStackTraceString());
        }	
    }    
    
    public string getfingerprintfinal(){
    	Authorize_Net_Setting__c transkeysetting = Authorize_Net_Setting__c.getInstance('TransKey');
    	Authorize_Net_Setting__c apiloginsetting = Authorize_Net_Setting__c.getInstance('API Login');
        
        apilogin = apiloginsetting.value__c;
    	apitranskey = transkeysetting.value__c;
        //apilogin = '';
        //apitranskey = '';
        
        String TimeStamp1;
        string fingerscore;
        
        sequence = Crypto.getRandomInteger();
        sequence1 = string.valueOf(sequence);
        
        TimeStamp = string.valueOf(DateTime.now().getTime()/1000);
        fingerscore = apilogin+'^'+sequence1+'^'+TimeStamp +'^'+amount+'^';
        
        finger = fingerscore;
        Blob hmacd5 = crypto.generateMac('hmacMD5', blob.valueOf(fingerscore), blob.valueOf(apitranskey));
        string hexVal = EncodingUtil.convertToHex(hmacd5);
        system.debug(hexVal);
        return hexVal;
    }
}
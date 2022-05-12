public class testResponseController {
	public string param1{get;set;}
    public string param2{get;set;}
    public string param3{get;set;}
    public string param4{get;set;}
    public string param5{get;set;}
    public string param6{get;set;}
    public string param7{get;set;}
    public string param8{get;set;}
    public string param9{get;set;}
    public string param10{get;set;}
    public string param11{get;set;}
    
    
    // call this variable on VF page directly i.e. {!ResponseMsg}
    public string ResponseMsg{get{
    	processRequest();
        return '';
    }
    set;
    }
    public testResponseController(){
    	param1='';
        param2='';
        param3='';
        param4='';
        param5='';
        param6='';
        param7='';
        param8='';
        param9='';
        param10='';
        param11='';
        
    }
    public void processRequest(){
    	Map<String, object> parametersMap=new Map<String, object>();
        if (ApexPages.currentPage() != null 
        && ApexPages.currentPage().getParameters()!=null 
        && ApexPages.currentPage().getParameters().size()>0){
        	parametersMap=ApexPages.currentPage().getParameters();
        }

        for(String key: parametersMap.keyset()){
			if(key=='x_response_code'){
            	param1=parametersMap.get(key)+'';
            }
            else if(key=='x_response_reason_code'){
            	param2=parametersMap.get(key)+'';
            }
            else if(key=='x_auth_code'){
            	param3=parametersMap.get(key)+'';
            }
            else if(key=='x_avs_code'){
            	param4=parametersMap.get(key)+'';
            }
            else if(key=='x_trans_id'){
            	param5=parametersMap.get(key)+'';
            }
            else if(key=='x_amount'){
            	param6=parametersMap.get(key)+'';
            }
            else if(key=='x_card_type'){
            	param7=parametersMap.get(key)+'';
            }
            else if(key=='x_cvv2_resp_code'){
            	param8=parametersMap.get(key)+'';
            }
            else if(key=='x_description'){
            	param9=parametersMap.get(key)+'';
            }
            else if(key=='x_invoice_num'){
            	param10=parametersMap.get(key)+'';
            }
            else if(key=='x_method'){
            	param11=parametersMap.get(key)+'';
            }
    	}
        /// do your processing here
	}
}
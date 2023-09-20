public class RulesEngine {
    public static productWrapper eval(List<RuleInfo> rules,PersonWrapper personObj,productWrapper productObj) {
        
        // Loop through each scoring rule and apply it to the lead record
        for (RuleInfo rule : rules) {
            // Evaluate the rule condition
            productObj = evaluateRuleCondition(personObj, productObj, rule);      
            
            system.debug('productObj:::closing:::' + productObj);

        }        
        
        return productObj;
    }
    
    // Helper method to evaluate a rule condition
    private static productWrapper evaluateRuleCondition(PersonWrapper personObj, productWrapper productObj,RuleInfo rule) {
        Object ruleFieldValue;
        Object resultFieldValue;
        Object ruleValue;
        Object resultValue;
        
        if (rule.RuleObjectName.equals('Person')){
            ruleFieldValue = personObj.getAttributeValue(rule.RuleFieldName);
            ruleValue = rule.RuleValue;
            
        }        
        else if (rule.RuleObjectName == 'Product'){
            ruleFieldValue = productObj.getAttributeValue(rule.RuleFieldName);
            ruleValue = rule.RuleValue;
        }
        
        if (rule.ResultObjectName == 'Person'){
            resultFieldValue = personObj.getAttributeValue(rule.ResultFieldName);
            resultValue = rule.ResultValue;
        }
        else if (rule.ResultObjectName == 'Product'){
            resultFieldValue = productObj.getAttributeValue(rule.ResultFieldName);
            resultValue = rule.ResultValue;
        }
        
        if (rule.RuleOperator.equals('==')) {           
            
            if (ruleValue == ruleFieldValue){         	
                
                if (rule.ResultOperator.equals('+')) {                    
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) + Double.valueOf(resultValue)));
                } else if (rule.ResultOperator.equals('-')) {                    
                    productObj.setAttributeValue('interest_rate', (Double.valueOf(resultFieldValue) - Double.valueOf(resultValue)));
                } else if (rule.ResultOperator.equals('=')) {                                
                    productObj.setAttributeValue(rule.ResultFieldName,resultValue);
                }
            }
        } else if (rule.RuleOperator.equals('>=')) {
            
            if(Double.valueOf(String.valueOf(ruleFieldValue)) >= Double.valueOf(ruleValue)){
                if (rule.ResultOperator.equals('+')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) + Double.valueOf(resultValue)));
                }else if (rule.ResultOperator.equals('-')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) - Double.valueOf(resultValue)));
                }else if (rule.ResultOperator.equals('=')) {                                
                    productObj.setAttributeValue(rule.ResultFieldName,resultValue);
                }                 
            }
        }
		else if (rule.RuleOperator.equals('<=')) {
            
            if(Double.valueOf(String.valueOf(ruleFieldValue)) <= Double.valueOf(ruleValue)){
                if (rule.ResultOperator.equals('+')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) + Double.valueOf(resultValue)));
                }else if (rule.ResultOperator.equals('-')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) - Double.valueOf(resultValue)));
                }else if (rule.ResultOperator.equals('=')) {                                
                    productObj.setAttributeValue(rule.ResultFieldName,resultValue);
                }                 
            }
        }        
        else if (rule.RuleOperator.equals('<')) {
            
            if(Double.valueOf(String.valueOf(ruleFieldValue)) < Double.valueOf(ruleValue)){
                if (rule.ResultOperator.equals('+')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) + Double.valueOf(resultValue)));
                }else if (rule.ResultOperator.equals('-')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) - Double.valueOf(resultValue)));                
                }else if (rule.ResultOperator.equals('=')) {                                
                    productObj.setAttributeValue(rule.ResultFieldName,resultValue);
                } 
                
            } 
        }
        else if (rule.RuleOperator.equals('>')) {
            
            if(Double.valueOf(String.valueOf(ruleFieldValue)) > Double.valueOf(ruleValue)){
                if (rule.ResultOperator.equals('+')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) + Double.valueOf(resultValue)));
                }else if (rule.ResultOperator.equals('-')) {
                    productObj.setAttributeValue('interest_rate',(Double.valueOf(resultFieldValue) - Double.valueOf(resultValue)));                
                }else if (rule.ResultOperator.equals('=')) {                                
                    productObj.setAttributeValue(rule.ResultFieldName,resultValue);
                } 
                
            } 
        }
        
        return productObj;
    }
    
    
}
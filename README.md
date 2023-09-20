# VisioFinancialServices

# Instructions

1. Actual Idea is to store all Rules in Custom Meta Type in Salesforce, Which will allow users to add \ change configuration. (I have added a commented section on how it will be with Custom meta data).
2. Just for our easy execution of the code (rule engine) i have the below script with all rules directly mapped to rule object 
**# Please follow the below listed steps to execute the code #**

Step 1: Download the Code (5 Apex Classes and 1 Custom Meta Type).
Step 2: Upload all files to a dev org.
Step 3: Excute the below script to view the output in developer console debug window

///Script to execute the rule engine.
List<RuleInfo> ruleList = new List<RuleInfo>();
        PersonWrapper personObj = new PersonWrapper(715, 'Florida');     
        productWrapper productObj = new ProductWrapper(5.0,true,'7-1 ARM');
        
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'state';
        ruleInfo.RuleOperator = '==';
        ruleInfo.RuleValue = 'Florida';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'disqualified';
        ruleInfo.ResultOperator = '=';
        ruleInfo.ResultValue = 'false';        
        ruleList.add(ruleInfo);
        
        ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'credit_score';
        ruleInfo.RuleOperator = '>=';
        ruleInfo.RuleValue = '720';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '-';
        ruleInfo.ResultValue = '0.3';        
        ruleList.add(ruleInfo);
        
        ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'credit_score';
        ruleInfo.RuleOperator = '<';
        ruleInfo.RuleValue = '720';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '+';
        ruleInfo.ResultValue = '0.5';        
        ruleList.add(ruleInfo);
        
        ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Product';
        ruleInfo.RuleFieldName = 'name';
        ruleInfo.RuleOperator = '==';
        ruleInfo.RuleValue = '7-1 ARM';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '+';
        ruleInfo.ResultValue = '0.5';        
        ruleList.add(ruleInfo);

productObj = RulesEngine.eval(ruleList,personObj,productObj);
system.debug('productObj:::closing:::' + productObj);


![image](https://github.com/hemakgit/VisioFinancialServices/assets/90020641/6ee4f82e-0903-4f2b-b2b9-47f89bd111e3)

Step 4: Execute Apex Test class for rule engine 
Class Name : RulesEngineTest.cls

![image](https://github.com/hemakgit/VisioFinancialServices/assets/90020641/db7f9555-ef82-4446-a88a-ac54c157c185)

/*

//Person can be a Personal Account Object
PersonWrapper personObj = new PersonWrapper(715, 'Florida');     

//Product can be a Product Object
productWrapper productObj = new ProductWrapper(5.0,false,'7-1 ARM');

List<RuleInfo> ruleList = new List<RuleInfo>();
RuleInfo ruleInfo = new RuleInfo();

for(Product_Rule__mdt rule : [SELECT id,RuleObjectName__c,RuleFieldName__c, RuleOperator__c, RuleValue__c, ResultObjectName__c, ResultFieldName__c, ResultOperator__c, ResultValue__c 
                              FROM Product_Rule__mdt ]){
    
    ruleInfo = new RuleInfo();
    ruleInfo.RuleObjectName = rule.RuleObjectName__c;
    ruleInfo.RuleFieldName = rule.RuleFieldName__c;
    ruleInfo.RuleOperator = rule.RuleOperator__c;
    ruleInfo.RuleValue = rule.RuleValue__c;
    ruleInfo.ResultObjectName = rule.ResultObjectName__c;
    ruleInfo.ResultFieldName = rule.ResultFieldName__c;
    ruleInfo.ResultOperator = rule.ResultOperator__c;
    ruleInfo.ResultValue = rule.ResultValue__c;        
    ruleList.add(ruleInfo);
}

productObj = RulesEngine.eval(ruleList,personObj,productObj);
system.debug('productObj:::closing:::' + productObj);

*/

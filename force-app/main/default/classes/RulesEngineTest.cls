@isTest
public class RulesEngineTest {

    // Define test data setup method
    static void setupTestData() {
        // Create and insert test records for RuleInfo, PersonWrapper, and ProductWrapper as needed
        // Populate test data to simulate different rule scenarios

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

    }

    @isTest
    static void testEvaluate_Rule1_Florida_Resident() {
     
        // Create instances of RuleInfo, PersonWrapper, and ProductWrapper for testing
        List<RuleInfo> ruleList = new List<RuleInfo>();  
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'state';
        ruleInfo.RuleOperator = '==';
        ruleInfo.RuleValue = 'Florida';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'disqualified';
        ruleInfo.ResultOperator = '=';
        ruleInfo.ResultValue = 'true';        
        ruleList.add(ruleInfo);

        // Initialize personObj attributes
        PersonWrapper personObj = new PersonWrapper(715, 'Florida');

        
        // Initialize productObj attributes
		productWrapper productObj = new ProductWrapper(5.0,false,'7-1 ARM');
        
        // Call the RulesEngine.eval method
        ProductWrapper result = RulesEngine.eval(ruleList, personObj, productObj);

        // Verify the result or attributes of the productObj
        System.assertEquals(true, productObj.disqualified, 'Product should be disqualified');
        
        // Add more assertions for other attributes if needed
    }
    
    @isTest
    static void testEvaluate_Rule1_Non_Florida_Resident() {
     
        // Create instances of RuleInfo, PersonWrapper, and ProductWrapper for testing
        List<RuleInfo> ruleList = new List<RuleInfo>();  
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'state';
        ruleInfo.RuleOperator = '==';
        ruleInfo.RuleValue = 'Florida';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'disqualified';
        ruleInfo.ResultOperator = '=';
        ruleInfo.ResultValue = 'true';      
        ruleList.add(ruleInfo);

        // Initialize personObj attributes
        PersonWrapper personObj = new PersonWrapper(715, 'Texas');
        
        // Initialize productObj attributes
		productWrapper productObj = new ProductWrapper(5.0,false,'7-1 ARM');
        
        // Call the RulesEngine.eval method
        ProductWrapper result = RulesEngine.eval(ruleList, personObj, productObj);

        // Verify the result or attributes of the productObj
        System.assertEquals(false, productObj.disqualified, 'Product is qualified');

    }
    
    @isTest
    static void testEvaluate_Rule2_Credit_Score_Above_720() {
        
        // Create instances of RuleInfo, PersonWrapper, and ProductWrapper for testing
        List<RuleInfo> ruleList = new List<RuleInfo>();  
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'credit_score';
        ruleInfo.RuleOperator = '>=';
        ruleInfo.RuleValue = '720';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '-';
        ruleInfo.ResultValue = '0.3';        
        ruleList.add(ruleInfo);   
        
        // Initialize personObj attributes
        PersonWrapper personObj = new PersonWrapper(725, 'Florida');        
        
        // Initialize productObj attributes
        productWrapper productObj = new ProductWrapper(5.0,true,'7-1 ARM');
        
        // Call the RulesEngine.eval method
        ProductWrapper result = RulesEngine.eval(ruleList, personObj, productObj);
        
        // Verify the result or attributes of the productObj
        System.assertEquals(4.7, productObj.interest_rate, 'interest_rate rate should be 4.7');
        
    }
    
    @isTest
    static void testEvaluate_Rule3_CreditScoreBelow720() {
        
        // Create instances of RuleInfo, PersonWrapper, and ProductWrapper for testing
        List<RuleInfo> ruleList = new List<RuleInfo>();  
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Person';
        ruleInfo.RuleFieldName = 'credit_score';
        ruleInfo.RuleOperator = '<';
        ruleInfo.RuleValue = '720';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '+';
        ruleInfo.ResultValue = '0.5';       
        ruleList.add(ruleInfo);   
        
        // Initialize personObj attributes
        PersonWrapper personObj = new PersonWrapper(715, 'Florida');        
        
        // Initialize productObj attributes
        productWrapper productObj = new ProductWrapper(5.0,true,'7-1 ARM');
        
        // Call the RulesEngine.eval method
        ProductWrapper result = RulesEngine.eval(ruleList, personObj, productObj);
        
        // Verify the result or attributes of the productObj
        System.assertEquals(5.5, productObj.interest_rate, 'interest_rate rate should be 5.5');
        
    }    
    
    @isTest
    static void testEvaluate_Rule4_Product_71ARM() {
        
        // Create instances of RuleInfo, PersonWrapper, and ProductWrapper for testing
        List<RuleInfo> ruleList = new List<RuleInfo>();  
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Product';
        ruleInfo.RuleFieldName = 'name';
        ruleInfo.RuleOperator = '==';
        ruleInfo.RuleValue = '7-1 ARM';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '+';
        ruleInfo.ResultValue = '0.5';      
        ruleList.add(ruleInfo);   
        
        // Initialize personObj attributes
        PersonWrapper personObj = new PersonWrapper(715, 'Florida');        
        
        // Initialize productObj attributes
        productWrapper productObj = new ProductWrapper(5.0,true,'7-1 ARM');
        
        // Call the RulesEngine.eval method
        ProductWrapper result = RulesEngine.eval(ruleList, personObj, productObj);
        
        // Verify the result or attributes of the productObj
        System.assertEquals(5.5, productObj.interest_rate, 'interest_rate rate should be 5.5');
        
    }       
        
    @isTest
    static void testEvaluate_Rule4_Product_Non_71ARM() {
        
        // Create instances of RuleInfo, PersonWrapper, and ProductWrapper for testing
        List<RuleInfo> ruleList = new List<RuleInfo>();  
        RuleInfo ruleInfo = new RuleInfo();
        ruleInfo.RuleObjectName = 'Product';
        ruleInfo.RuleFieldName = 'name';
        ruleInfo.RuleOperator = '==';
        ruleInfo.RuleValue = 'FHA';
        ruleInfo.ResultObjectName = 'Product';
        ruleInfo.ResultFieldName = 'interest_rate';
        ruleInfo.ResultOperator = '+';
        ruleInfo.ResultValue = '0.5';      
        ruleList.add(ruleInfo);   
        
        // Initialize personObj attributes
        PersonWrapper personObj = new PersonWrapper(715, 'Florida');        
        
        // Initialize productObj attributes
        productWrapper productObj = new ProductWrapper(5.0,true,'7-1 ARM');
        
        // Call the RulesEngine.eval method
        ProductWrapper result = RulesEngine.eval(ruleList, personObj, productObj);
        
        // Verify the result or attributes of the productObj
        System.assertEquals(5.0, productObj.interest_rate, 'interest_rate rate should be 5.0');
        
    } 
}
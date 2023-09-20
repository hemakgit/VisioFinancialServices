public class PersonWrapper {
    public string firstName  { get; set; }
    public string lastName  { get; set; }
    public integer credit_score { get; set; }
    public string state { get; set; }
    
    public PersonWrapper(integer f1, string f2) {
        credit_score = f1;
        state = f2;
    }
    
    public Object getAttributeValue(String attributeName) {
        Map<String, Object> attributeMap = new Map<String, Object>{
            'credit_score' => credit_score,
                'state' => state
                // Add more attributes as needed
                };
                    
                    return attributeMap.get(attributeName);
    }
    
    public void setAttributeValue(String attributeName, Object attributeValue) {
        switch on attributeName {
            when 'credit_score' {
                this.credit_score = (integer)attributeValue;
            }
            when 'state' {
                this.state = (String)attributeValue;
            }            
            // Add more cases for additional attributes
            when else {
                // Handle the case where the attribute does not exist
                System.debug('Attribute not found.');
            }
        }
    }

    
}
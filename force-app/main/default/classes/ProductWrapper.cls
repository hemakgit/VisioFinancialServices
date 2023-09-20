public class ProductWrapper {
    public decimal interest_rate { get; set; }
    public Boolean disqualified { get; set; }
    public string name { get; set; }

    public ProductWrapper(decimal f1, Boolean f2, string f3) {
        interest_rate = f1;
        disqualified = f2;
        name = f3;
    }
    
    public Object getAttributeValue(String attributeName) {
        Map<String, Object> attributeMap = new Map<String, Object>{
            'interest_rate' => interest_rate,
            'disqualified' => disqualified,
            'name' => name
            // Add more attributes as needed
        };

        return attributeMap.get(attributeName);
    }
    
    public void setAttributeValue(String attributeName, Object attributeValue) {
        switch on attributeName {
            when 'interest_rate' {
                this.interest_rate = double.valueOf(attributeValue);
            }
            when 'disqualified' {
                this.disqualified =  Boolean.valueOf(attributeValue);
            }
            when 'name' {
                this.name = (String)attributeValue;
            }            
            // Add more cases for additional attributes
            when else {
                // Handle the case where the attribute does not exist
                System.debug('Attribute not found.');
            }
        }
    }
    
}
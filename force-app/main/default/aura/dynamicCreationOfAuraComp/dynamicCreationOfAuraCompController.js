({
	createComponent : function(cmp, event, helper) {
		
        $A.createComponent(
            "lightning:input",
            {
                "aura:id": "input-id",
                "label": "Press Me First"
            },
            function(newField, status, errorMessage){
                
                if (status === "SUCCESS") {
                    
                    var panel = cmp.get("v.panel");
                    panel.push(newField);
                    cmp.set("v.panel", panel);
                }
            }
        );
	}
})
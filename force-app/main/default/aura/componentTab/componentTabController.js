({
    changeTab: function(component, event, helper) {
        var clickedTab = helper.getContainerDiv(event, null);
        var tabs =  component.find('tabpage');
        for(idx = 0; idx < tabs.length; idx++)
         {
             var tab = tabs[idx].elements[0];
             $A.util.removeClass(tab, 'slds-active');
             $A.util.removeClass(component.find(tab.children[0].getAttribute('aria-controls')), 'slds-show');
             $A.util.addClass(component.find(tab.children[0].getAttribute('aria-controls')), 'slds-hide');
         }

        $A.util.addClass(clickedTab, 'slds-active');
        $A.util.addClass(component.find(clickedTab.children[0].getAttribute('aria-controls')), 'slds-show');
        $A.util.removeClass(component.find(clickedTab.children[0].getAttribute('aria-controls')), 'slds-hide');
    }
})
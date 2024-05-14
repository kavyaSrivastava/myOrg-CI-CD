({
    getAccHelper : function(component, event, helper){
        
            var action= component.get("c.methodName");
            // action.setParams({
            //     str: component.get("v.searchText")
            // })
            action.setCallback(this, function(response){
               var state = response.getState();
            //    console.log(response.getReturnValue());
               if(state === "SUCCESS"){
                   component.set("v.accList",response.getReturnValue());
                //    console.log(response.getReturnValue());
               }
            });
           $A.enqueueAction(action);
           // var accid = component.get("item.id");
           // console.log(accid);
           
   
       
    },
    handleSearchHelper : function(component, event, helper){
        var searchText = component.get("v.searchText");
        console.log(searchText,'Inside helper');
        if(!$A.util.isEmpty(searchText)){
            console.log('inside search');
            let data= component.get("v.accList");
            console.log('data         '+data);
            let filteredData = data.filter(record => record.Name.includes(searchText));
            console.log("======>",JSON.stringify(filteredData));
            component.set("v.searchedData", filteredData)
            
            // component.set("v.filteredData", filterData);
            // this.preparePagination(component,filteredData);
           
            
            
        }
    },
})
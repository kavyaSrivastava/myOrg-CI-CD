({
    fetchOppHelper : function(component, event, helper) {
        console.log('inside body helper of datatable');

        var actions = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'delete' } ];

        component.set('v.mycolumns',[
            {label: 'Name', fieldName: 'Name',sortable:true,  type: 'String'},
            {label: 'Amount', fieldName: 'Amount', sortable:true,  type: 'Currency'},
            {label: 'Closed Won', fieldName: 'IsWon', sortable:true, type: 'Boolean'},
            {label: 'Closed Date', fieldName: 'CloseDate', sortable:true, type: 'Date '},
            {label: 'Account Name', fieldName: 'Account.Name', type: 'text', sortable:true},
            
            { type: 'action', typeAttributes: { rowActions: actions } }
        ]);
        var action = component.get("c.getOpportunity");
        action.setParams({
            oppstatus: component.get("v.isclosedvalue")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(response);
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                var result = response.getReturnValue();
                console.log(result.length);
                console.log('zzzzzzzz');

                component.set("v.oppList", response.getReturnValue());
                this.preparePagination(component, result);
            }
        });
        $A.enqueueAction(action);
},
handleRowActionHelper : function(component, event, helper){

    var action = event.getParam( 'action' );
    var row = event.getParam( 'row' );
    var recId = row.Id;
    component.set("v.recId",recId);
    console.log(row.StageName);
    var stg = row.StageName;
    component.set("v.stageName",stg);
    // console.log(!v.stageName);
    switch ( action.name ) {
        case 'edit':
            component.set("v.showEditForm", "true");
           
            break;
        case 'delete':
            // var viewRecordEvent = $A.get("e.force:navigateToURL");
            // viewRecordEvent.setParams({
            //     "url": "/" + recId
            // });
           this.deleteHelper(component, recId);
            break;
    }
},
preparePagination: function (component, records) {
    // console.log("---------"+records);

    let countTotalPage = Math.ceil(records.length / component.get("v.pageSize"));
    let totalPage = countTotalPage > 0 ? countTotalPage : 1;
    component.set("v.totalPages", totalPage);
    component.set("v.currentPageNumber", 1);
    component.set("v.totalRecords", records.length);
    component.set("v.oppList", records);
    this.setPaginateData(component);
},
 
setPaginateData: function(component){
    let data = [];
    let pageNumber = component.get("v.currentPageNumber");
    let pageSize = component.get("v.pageSize");
    let oppData = component.get('v.oppList');
    // console.log("set"+oppData);
    let currentPageCount = 0;
    let x = (pageNumber - 1) * pageSize;
    currentPageCount = x;
    for (; x < (pageNumber) * pageSize; x++){
        if (oppData[x]) {
            data.push(oppData[x]);
            currentPageCount++;
        }
    }
    component.set("v.paginationList", data);
    component.set("v.currentPageRecords", currentPageCount);
},
 
sortData: function (cmp, fieldName, sortDirection) {
    var fname = fieldName;
    var data = cmp.get("v.oppList");
    var reverse = sortDirection !== 'asc';
    data.sort(this.sortBy(fieldName, reverse))
    cmp.set("v.oppList", data);
    this.setPaginateData(cmp);
},
 
sortBy: function (field, reverse) {
    var key = function(x) {return x[field]};
    reverse = !reverse ? 1 : -1;
    return function (a, b) {
        return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
    }
},
handleSearchHelper : function(component, event, helper){
    var searchText = component.get("v.searchText");
    console.log(searchText,'Inside helper');
    if(!$A.util.isEmpty(searchText)){
        console.log('inside search');
        let data= component.get("v.oppList");
        console.log('data         '+data);
        let filteredData = data.filter(record => record.Name.includes(searchText));
        console.log("======>",JSON.stringify(filteredData));
        
        // component.set("v.filteredData", filterData);
        this.preparePagination(component,filteredData);
       
        
        
    }
},
submitDetailsHelper : function(component, event, helper){
    var opportunity = component.get("v.opportunity");
    var action = component.get("c.createOpportunity");
    action.setParams({
        oppObj : opportunity
    });
    action.setCallback(this,function(response){
        var state = response.getState();
        if(state === "SUCCESS"){
            alert('Record Created Successfully!!');
        } else if(state === "ERROR"){
            var errors = action.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    alert(errors[0].message);
                }
            }
        }
    });       
    $A.enqueueAction(action);
    this.fetchOppHelper(component);
    
},
getPicklistValues : function(component, event, helper){
    var action = component.get("c.getStageFieldValue");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            var result = response.getReturnValue();
            var fieldMap = [];
            for(var key in result){
                fieldMap.push({key: key, value: result[key]});
            }
            component.set("v.fieldMap", fieldMap);
        }
    });
    $A.enqueueAction(action);
},
submitEditDetailsHelper: function(component, event, helper){
    var nameE = component.get("v.newName");
    var newDateE = component.get("v.newDate");
    var newAmountE  = component.get("v.newAmount");
    var recordId = component.get("v.recId");
    var stageNameE = component.get("v.stageName");
    console.log(stageNameE);
    // console.log("===>", recordId , "====>", newAmountE );
    var action = component.get("c.editOppMeth");
    action.setParams({
        currentId: recordId,
        currName: nameE,
        currClosedDate: newDateE,
        amt : newAmountE,
        currStageName : stageNameE,

    });
    action.setCallback(this, function(response){
        var state = response.getState();
        var data = response.getReturnValue();
        console.log(data);
        console.log(state);
        if(state === "SUCCESS"){
            alert('Record Edited Successfully!!');
        } else if(state === "ERROR"){
            var errors = action.getError();
            console.log(errors[0].message);
            if (errors) {
                if (errors[0] && errors[0].message) {
                    alert(errors[0].message);
                }
            }
        }
    });
    $A.enqueueAction(action);
    this.fetchOppHelper(component);


},
deleteHelper: function(component, event, helper){
    let currentRecord = [];
    var recordId = component.get("v.recId");
    currentRecord.push(recordId);
    var action = component.get("c.deleteOpportunities");
    action.setParams({
        lstOpportunityIds : currentRecord,
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if(state === "SUCCESS"){
            alert('Record Deleted Successfully!!');
        } else if(state === "ERROR"){
            var errors = action.getError();
            console.log(errors[0].message);
            if (errors) {
                if (errors[0] && errors[0].message) {
                    alert(errors[0].message);
                }
            }
        }
    });
    $A.enqueueAction(action);
    this.fetchOppHelper(component);


}


})
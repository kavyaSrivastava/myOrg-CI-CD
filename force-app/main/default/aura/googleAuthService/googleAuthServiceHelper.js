({
    CHUNK_SIZE: 1310720,
    fileChangeHelper: function (component, event, helper) {
       // var file = event.getParam("files")[0];
        let file = event.getSource().get("v.files")[0];
         console.log('eventocc>>>>>>>>', file);
        let reader = new FileReader();
        reader.onload = function () {
            //console.log(reader.result());
            let base64 = reader.result.split(',')[1]
            console.log(base64);
            console.log('filesize>>>>>>>>>>>>>>>>>>>', file.size);
            //if (file.size > 4000000) {
            //console.log("mmmmmmmmmmm>>>>>>>>>");
            // component.set("v.message", 'Your file size is greater than 'Only files less than 4MB of size are allowed')
            //}
            //else if (file.size < 4000000) {
            component.set("v.filesize", file.size);
            component.set("v.fileContent", base64);
            // console.log('fileContent>>>>>>>>>>' ,fileContent);
            let fileName = file.name;
            component.set("v.fileName", fileName);
            console.log('fileName>>>>>>>>>>', fileName);
            let filetype = file.type;
            component.set("v.filetype", filetype);
            console.log('filetype>>>>>>>>>>', filetype);
            // }

        }
        reader.readAsDataURL(file);

    },

    // handleCLickHelper: function (component, event, helper) {

    //     if (component.get("v.fileName") !== '' && component.get("v.filetype") !== '' &&
    //         component.get("v.fileContent") !== '') {

    //             if(component.get("v.filesize") < 4000000){
    //                 console.log('=========inside wrong if===========');

    //                 let action = component.get("c.UploadFile");
    //                 console.log('fileName>>>>>', component.get("v.fileName"))
    //                 console.log('filetype>>>>>', component.get("v.filetype"))
    //                 console.log('fileContent>>>>>', component.get("v.fileContent"))

    //                 action.setParams({
    //                     filename: component.get("v.fileName"),
    //                     filetype: component.get("v.filetype"),
    //                     filecontent: component.get("v.fileContent")
    //                     });

    //                 action.setCallback(this, function (response) {
    //                     let state = response.getState();
    //                     if (state === "SUCCESS") {
    //                         component.set("v.showSpinner", false);
    //                         component.set("v.message", 'Your File has been Uploaded successfully');

    //                     }
    //                     else if (state === "INCOMPLETE") {

    //                         component.set("v.showSpinner", false);
    //                     }
    //                     else if (state === "ERROR") {
    //                         component.set("v.showSpinner", false);
    //                         let errors = response.getError();
    //                         if (errors) {
    //                             if (errors[0] && errors[0].message) {
    //                                 console.log("Error message: " +
    //                                     errors[0].message);
    //                             }
    //                         } else {
    //                             console.log("Unknown error");
    //                         }

    //                     }
    //                 });
    //                  $A.enqueueAction(action);
    //             }
    //             else if(component.get("v.filesize") >= 4000000){
    //                 console.log('inside elseif>>>>>>>>>>');
    //                 let action = component.get("c.uploadDataGreaterThan4MB");
    //                 action.setParams({
    //                     filename: component.get("v.fileName"),
    //                     filetype: component.get("v.filetype"),
    //                     filecontent: component.get("v.fileContent")
    //                 });
    //                 action.setCallback(this, function (response) {
    //                     let state = response.getState();
    //                     if (state === "SUCCESS") {
    //                         component.set("v.showSpinner", false);
    //                         component.set("v.message", 'Your File has been Uploaded successfully');

    //                     }
    //                     else if (state === "INCOMPLETE") {

    //                         component.set("v.showSpinner", false);
    //                     }
    //                     else if (state === "ERROR") {
    //                         component.set("v.showSpinner", false);
    //                         let errors = response.getError();
    //                         if (errors) {
    //                             if (errors[0] && errors[0].message) {
    //                                 console.log("Error message: " +
    //                                     errors[0].message);
    //                             }
    //                         } else {
    //                             console.log("Unknown error");
    //                         }

    //                     }
    //                 });
    //                 $A.enqueueAction(action);


    //             }
    //     }

    // },

    // handleUploadFinishedhelper: function (component, event, helper) {
    //     var uploadFile = event.getParam("files");
    //     console.log('uploadfiles>>>>>>', uploadFile);
    //     // alert("Files uploaded : " + uploadFile.length);
    //     console.log(JSON.stringify(uploadFile));

    //     // Get the file name
    //     uploadFile.forEach(file => console.log('vvvv===', file.name));
    //     uploadFile.forEach(file => console.log(file.contentVersionId));

    //     var my_ids = [];
    //     uploadFile.forEach(file => (my_ids.push(file.contentVersionId)));
    //     component.set("v.cvIds", my_ids);
    //     console.log('-->ids---' + my_ids);
    //     console.log('-->ids---' + component.get("v.cvIds[0]"));

    //     let action = component.get("c.uploadDataGreaterThan4MB");
    //     action.setParams({

    //         cvId: component.get("v.cvIds[0]")
    //     })
    //     action.setCallback(this, function (response) {
    //         var state = response.getState();
    //         if (state === "SUCCESS") {
    //             console.log('Uploaded successfully');
    //         }
    //         else if (state === "INCOMPLETE") {

    //             //component.set("v.showSpinner", false);
    //         }
    //         else if (state === "ERROR") {
    //             component.set("v.showSpinner", false);
    //             let errors = response.getError();
    //             if (errors) {
    //                 if (errors[0] && errors[0].message) {
    //                     console.log("Error message: " +
    //                         errors[0].message);
    //                 }
    //             } else {
    //                 console.log("Unknown error");
    //             }
    //         }
    //     });
    //     $A.enqueueAction(action);
    // },

    handlechunkedFile : function(component, event, helper){
        var uploadFile = event.getParam("files");
        uploadFile.forEach(file => console.log('vvvv===', file));
        var objFileReader = new FileReader();
        var my_files = [];
             uploadFile.forEach(file => (my_files.push(file)));
             component.set("v.cvIds", my_files);
             console.log('-->ids---' + JSON.stringify(my_files));
             console.log('-->ids---' + JSON.stringify(component.get("v.cvIds[0]")));
        
        // set onload function of FileReader object   
        objFileReader.onload = function() {
            var fileContents = objFileReader.result;
            var base64 = 'base64,';
            var dataStart = fileContents.indexOf(base64) + base64.length;
            console.log(base64);
            console.log(dataStart);
             
            fileContents = fileContents.substring(dataStart);
            // call the uploadProcess method 
            //self.uploadProcess(component, file, fileContents);
        };
        
        objFileReader.readAsDataURL(JSON.stringify(component.get("v.cvIds[0]")));

    },

    fileChangeHelperTwo : function(component, helper, event){
        let file = event.getSource().get("v.files")[0];
        console.log('Inside File Change Helper2');
        console.log('file on first>>>>>>>>', file);
        

        component.set("v.filesize" , file.size);
        console.log('=======', component.get("v.filesize"));

        // let reader = new FileReader();
        let fileName = file.name;
        component.set("v.fileName", fileName);
        console.log('fileName>>>>>>>>>>', fileName);
        let filetype = file.type;
        component.set("v.filetype", filetype);
        console.log('filetype>>>>>>>>>>', filetype);
        var action1 = component.get('c.getLocationURI');

        action1.setParams({
             fileName: file.name,
             contentType: file.type,
        });

        action1.setCallback(this, function (response){
            var location = response.getReturnValue();
            component.set("v.locationURI", location);
            //console.log(component.get("v.locationURI"));
            this.uploadProcess(component, file, component.get("v.filesize"));
        });
        $A.enqueueAction(action1);

        // reader.onload = function () {
        //     var fileContents = reader.result;
        //    // console.log('fileContents====',fileContents);
        //     var base64 = 'base64,';
        //     var dataStart = fileContents.indexOf(base64) + base64.length;
        //     //console.log('datastatrt====',dataStart);
        //     fileContents = fileContents.substring(dataStart);
        //     //console.log('fileContents====',fileContents);
        //     component.set("v.fileContent", fileContents);
        // }
        // reader.readAsDataURL(file);
    },
    
    uploadProcess : function(component, file, sizeOfFile){
        //console.log("Inside UploadProcess");
        // set a default size or startpostiton as 0 
        let blobuploaded =0;
        let startPosition = 0;
        // calculate the end size or endPostion using Math.min() function which is return the min. value   
        let endPosition = Math.min(component.get("v.filesize"), startPosition + this.CHUNK_SIZE);
        //console.log("Inside UploadProcess file length====", fileContents.length);
        //console.log("end Position of chunk", endPosition);
        // start with the initial chunk, and set the attachId(last parameter)is null in begin
        this.uploadInChunk(component, file, blobuploaded, startPosition, endPosition );
    },

    uploadInChunk: function(component, file, blobuploaded, startPosition, endPosition) {
        console.log("Inside UploadIn Chunks");
        //call the apex method 'SaveFile'
        let getchunk = file.slice(startPosition, endPosition);
        console.log("firstChunk===", getchunk);
        let reader = new FileReader();
        const self = this;
        reader.onload = $A.getCallback(function () {
            var fileContents = reader.result;
           console.log('fileContents====',fileContents);
            var base64 = 'base64,';
            var dataStart = fileContents.indexOf(base64) + base64.length;
            console.log('datastatrt====',dataStart);
            fileContents = fileContents.substring(dataStart);
            console.log('fileContents====',fileContents);
            component.set("v.fileContent", fileContents);
        // }
        // reader.readAsDataURL(getchunk);
        let action = component.get("c.uploadDataGreaterThan4MB");
        console.log(file.name);
        console.log(encodeURIComponent(getchunk));
        console.log(file.type);
        console.log(file.size);
        console.log(startPosition, endPosition);
        console.log(component.get("v.locationURI"));

        action.setParams({
            fileName: file.name,
            //base64Data: encodeURIComponent(getchunk),
            base64Data: encodeURIComponent(fileContents),
            contentType: file.type,
            fileSize: component.get("v.filesize"),
            //fileSize: fileContents.length,
            startingChunk: startPosition,
            endingChunk : endPosition,
            location : component.get("v.locationURI")
            
        });
         
        // set call back 
        action.setCallback(this, function(response) {
            let state = response.getState();
            

            if (state === "SUCCESS") {
                // update the start position with end postion
                blobuploaded =response.getReturnValue();
                console.log("next chunk===", blobuploaded);
                startPosition = blobuploaded;
                console.log("startPosition====", startPosition);
               console.log('====================', component.get("v.filesize"));
               var sizeoff = parseInt(component.get("v.filesize"));
                console.log(parseInt(startPosition) + parseInt(self.CHUNK_SIZE));
                
                endPosition = Math.min(sizeoff, parseInt(startPosition) + parseInt(self.CHUNK_SIZE));
                console.log("endPosition====",endPosition);
                // check if the start postion is still less then end postion 
                // then call again 'uploadInChunk' method , 
                // else, diaply alert msg and hide the loading spinner
                if (startPosition < endPosition) {
                    console.log("Inside if>>>>>>>>>>.");
                    self.uploadInChunk(component, file, blobuploaded, startPosition, endPosition  );
                } else {
                    alert('File has been uploaded successfully');
                }
                // handel the response errors        
            } else if (state === "INCOMPLETE") {
                alert("From server: " + response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        // enqueue the action
        $A.enqueueAction(action);
    })
    reader.readAsDataURL(getchunk);
    }
   

})
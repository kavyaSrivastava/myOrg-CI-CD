({
        itemsChange: function(cmp, evt) {
            console.log("numItems has changed");
            console.log("old value: " + evt.getParam("oldValue"));
            console.log("current value: " + evt.getParam("value"));
        },
        handleClick : function(cmp, evt, hlp){
            cmp.set("v.numItems","Good Morning!");S
        }
    })
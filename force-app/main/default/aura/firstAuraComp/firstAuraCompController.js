({

    handleOnClick : function(c,e,h)
    {
        console.log('Inside handle OnClick');
        var btnClicked = e.getSource();
        var btnMessage = btnClicked.get("v.label");
        console.log(btnMessage);
        c.set("v.message", btnMessage );
    }
})
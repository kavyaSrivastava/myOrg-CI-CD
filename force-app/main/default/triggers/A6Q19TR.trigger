trigger A6Q19TR on Lead (before insert) {
    
    if(trigger.isinsert && trigger.isbefore){
        A6Q19HC.method(trigger.new);
    }
}
trigger dltundlt on Account (after update) {
    if(trigger.isbefore && trigger.isinsert){
        lllww.meth(trigger.new);
    }
}
trigger A6Q15TRz on Contact (before insert) {
  if(trigger.isbefore && trigger.isinsert){
        A6Q15HC.meth(Trigger.new);
    }

}
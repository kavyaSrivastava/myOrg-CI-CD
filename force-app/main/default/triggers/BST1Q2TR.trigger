trigger BST1Q2TR on Opportunity (Before insert) {
      if(trigger.isbefore && trigger.isinsert)
          BST1Q2.meth(Trigger.New);
}
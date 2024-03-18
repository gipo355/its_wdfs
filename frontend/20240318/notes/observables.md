# observables

what are those

objects that can be observed, they tell you when they change

event emitters

pub sub

angular uses rxjs

variables have a subscribe method

similar to stores in svelte

must unsubscribe when component is destroyed to prevent memory leaks

# use ReplaySubject

if you use new Subject, you will only get the events that happen after you
subscribe

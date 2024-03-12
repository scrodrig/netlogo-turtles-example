;; Clobal variables
globals [num-clusters]

turtles-own [time-since-last-found]

to setup
  clear-all
  set num-clusters 3
  ;;ask patches [set pcolor green]
  
  ask n-of num-clusters patches [
  	ask n-of 20 patches in-radius 5 [
      set pcolor red
    ]
  ]
  
  create-turtles 1 [
  	set time-since-last-found 10
    set size 2
    set color yellow
    set shape "circle"
  ]
 end

to go
  ;;ask patches [ifelse pcolor = green
  ;;  [ set pcolor black]
  ;;  [ set pcolor green]
  ;;]
  
  reset-ticks
  ask turtles [search]
  
end

to search
  ifelse time-since-last-found <= 20
  	[right (random 181) - 90]
  	[right (random 21) - 10]
  forward 1
  
  ifelse pcolor = red 
  [
  	set time-since-last-found 0
    set pcolor yellow
  ]
  [
    set time-since-last-found (time-since-last-found + 1) 
  ]
end


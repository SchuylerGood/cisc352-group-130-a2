(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)

    ; Location <> Corridor Connections
    (corridor-connected loc-3-1 c3132)
    (corridor-connected loc-3-2 c3132)

    (corridor-connected loc-1-2 c1222)
    (corridor-connected loc-2-2 c1222)

    (corridor-connected loc-2-2 c2232)
    (corridor-connected loc-3-2 c2232)

    (corridor-connected loc-3-2 c3242)
    (corridor-connected loc-4-2 c3242)
    
    (corridor-connected loc-2-2 c2223)
    (corridor-connected loc-2-3 c2223)
    
    (corridor-connected loc-3-2 c3233)
    (corridor-connected loc-3-3 c3233)

    (corridor-connected loc-2-3 c2333)
    (corridor-connected loc-3-3 c2333)

    (corridor-connected loc-2-3 c2324)
    (corridor-connected loc-2-4 c2324)
  
    (corridor-connected loc-3-3 c3334)
    (corridor-connected loc-3-4 c3334)

    (corridor-connected loc-2-4 c2434)
    (corridor-connected loc-3-4 c2434)

    (corridor-connected loc-3-4 c3444)
    (corridor-connected loc-4-4 c3444)

    ; Key locations
    (key-at loc-2-2)
    (key-at loc-2-4)
    (key-at loc-4-4)
    (key-at loc-4-2)
    
    ; Locked corridors
    (corridor-locked c3132)
    (corridor-colour c3132 rainbow)

    (corridor-locked c3242)
    (corridor-colour c3242 purple)

    (corridor-locked c2324)
    (corridor-colour c2324 red)

    (corridor-locked c2434)
    (corridor-colour c2434 red)
    
    (corridor-locked c3444)
    (corridor-colour c3444 yellow)

    ; Risky corridors

    (corridor-risky c2324)
    (corridor-risky c2434)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 rainbow)
    (key-colour key4 purple)

    ; Key usage properties (one use, two use, etc)
    (key-has-infinite-uses key1)
    (key-has-two-uses key2)
    (key-has-one-use key3)
    (key-has-one-use key4)

  )
  (:goal
    (hero-at loc-3-1)
  )

)

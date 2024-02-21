(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)

    ; Locationg <> Corridor Connections
    (corridor-connected c2122 loc-2-1)
    (corridor-connected c2122 loc-2-2)

    (corridor-connected c1222 loc-1-2)
    (corridor-connected c1222 loc-2-2)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c3242 loc-3-2)
    (corridor-connected c3242 loc-4-2)

    (corridor-connected c2223 loc-2-2)
    (corridor-connected c2223 loc-2-3)

    ; Key locations
    (key-at loc-2-1 key1)
    (key-at loc-1-2 key2)
    (key-at loc-2-2 key3)
    (key-at loc-2-3 key4)

    ; Locked corridors

    (corridor-locked c2122)
    (corridor-colour c2122 purple)

    (corridor-locked c1222)
    (corridor-colour c1222 yellow)

    (corridor-locked c2232)
    (corridor-colour c2232 yellow)

    (corridor-locked c3242)
    (corridor-colour c3242 rainbow)

    (corridor-locked c2223)
    (corridor-colour c2223 green)

    ; Risky corridors


    ; Key colours
    (key-colour key1 green)
    (key-colour key2 rainbow)
    (key-colour key3 purple)
    (key-colour key4 yellow)

    ; Key usage properties (one use, two use, etc)
    (key-has-one-use key1)
    (key-has-one-use key2)
    (key-has-one-use key3)
    (key-has-two-uses key4)

  )
  (:goal
    (and
      (hero-at loc-4-2)
    )
  )

)

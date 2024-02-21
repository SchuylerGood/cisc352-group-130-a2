(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-3-1 loc-4-1 loc-2-2 loc-3-2 loc-4-2 loc-1-3 loc-2-3 - location
    c1121 c2131 c3141 c2122 c3132 c4142 c2232 c3242 c2223 c1323 - corridor
    key1 key2 key3 key4 key5 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-1)

    ; Locationg <> Corridor Connections
    (corridor-connected c1121 loc-1-1)
    (corridor-connected c1121 loc-2-1)

    (corridor-connected c2131 loc-2-1)
    (corridor-connected c2131 loc-3-1)

    (corridor-connected c3141 loc-3-1)
    (corridor-connected c3141 loc-4-1)

    (corridor-connected c2122 loc-2-1)
    (corridor-connected c2122 loc-2-2)

    (corridor-connected c3132 loc-3-1)
    (corridor-connected c3132 loc-3-2)

    (corridor-connected c4142 loc-4-1)
    (corridor-connected c4142 loc-4-2)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c3242 loc-3-2)
    (corridor-connected c3242 loc-4-2)

    (corridor-connected c2223 loc-2-2)
    (corridor-connected c2223 loc-2-3)

    (corridor-connected c1323 loc-1-3)
    (corridor-connected c1323 loc-2-3)

    ; Key locations
    (key-at loc-2-1 key1)
    (key-at loc-3-1 key2)
    (key-at loc-2-2 key3)
    (key-at loc-3-2 key4)
    (key-at loc-4-2 key5)

    ; Locked corridors
    (corridor-locked c2131)
    (corridor-colour c2131 red)

    (corridor-locked c3141)
    (corridor-colour c3141 yellow)

    (corridor-locked c2122)
    (corridor-colour c2122 green)

    (corridor-locked c3132)
    (corridor-colour c3132 purple)

    (corridor-locked c3242)
    (corridor-colour c3242 yellow)

    (corridor-locked c2223)
    (corridor-colour c2223 red)

    (corridor-locked c1323)
    (corridor-colour c1323 rainbow)

    ; Risky corridors
    (corridor-risky c2131)
    (corridor-risky c2223)

    ; Key colours
    (key-colour key1 green)
    (key-colour key2 yellow)
    (key-colour key3 red)
    (key-colour key4 purple)
    (key-colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
    (key-has-one-use key1)
    (key-has-two-uses key2)
    (key-has-infinite-uses key3)
    (key-has-one-use key4)
    (key-has-one-use key5)

  )
  (:goal
    (and
      (hero-at loc-1-3)
    )
  )

)

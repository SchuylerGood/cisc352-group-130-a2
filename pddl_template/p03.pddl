(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)

    ; Locationg <> Corridor Connections
    (corridor-connected c2122 loc-2-1)
    (corridor-connected c2122 loc-2-2)

    (corridor-connected c1222 loc-1-2)
    (corridor-connected c1222 loc-2-2)

    (corridor-connected c2232 loc-2-2)
    (corridor-connected c2232 loc-3-2)

    (corridor-connected c1213 loc-1-2)
    (corridor-connected c1213 loc-1-3)

    (corridor-connected c1223 loc-1-2)
    (corridor-connected c1223 loc-2-3)

    (corridor-connected c2223 loc-2-2)
    (corridor-connected c2223 loc-2-3)

    (corridor-connected c3223 loc-3-2)
    (corridor-connected c3223 loc-2-3)

    (corridor-connected c3233 loc-3-2)
    (corridor-connected c3233 loc-3-3)

    (corridor-connected c1323 loc-1-3)
    (corridor-connected c1323 loc-2-3)

    (corridor-connected c2333 loc-2-3)
    (corridor-connected c2333 loc-3-3)

    (corridor-connected c1314 loc-1-3)
    (corridor-connected c1314 loc-1-4)

    (corridor-connected c2314 loc-2-3)
    (corridor-connected c2314 loc-1-4)
 
    (corridor-connected c2324 loc-2-3)
    (corridor-connected c2324 loc-2-4)

    (corridor-connected c2334 loc-2-3)
    (corridor-connected c2334 loc-3-4)

    (corridor-connected c3334 loc-3-3)
    (corridor-connected c3334 loc-3-4)

    (corridor-connected c1424 loc-1-4)
    (corridor-connected c1424 loc-2-4)

    (corridor-connected c2434 loc-2-4)
    (corridor-connected c2434 loc-3-4)
 
    (corridor-connected c2425 loc-2-4)
    (corridor-connected c2425 loc-2-5)

    (corridor-connected c2535 loc-2-5)
    (corridor-connected c2535 loc-3-5)

    (corridor-connected c3545 loc-3-5)
    (corridor-connected c3545 loc-4-5)

    (corridor-connected c4544 loc-4-5)
    (corridor-connected c4544 loc-4-4)

    (corridor-connected c4443 loc-4-4)
    (corridor-connected c4443 loc-4-3)

    ; Key locations
    (key-at loc-2-1 key1)
    (key-at loc-2-3 key2)
    (key-at loc-2-3 key3)
    (key-at loc-2-3 key4)
    (key-at loc-2-3 key5)
    (key-at loc-4-4 key6)

    ; Locked corridors
    (corridor-locked c1223)
    (corridor-colour c1223 red)

    (corridor-locked c2223)
    (corridor-colour c2223 red)

    (corridor-locked c3223)
    (corridor-colour c3223 red)

    (corridor-locked c2333)
    (corridor-colour c2333 red)

    (corridor-locked c2334)
    (corridor-colour c2334 red)

    (corridor-locked c2324)
    (corridor-colour c2324 red)

    (corridor-locked c2314)
    (corridor-colour c2314 red)

    (corridor-locked c1323)
    (corridor-colour c1323 red)

    (corridor-locked c2425)
    (corridor-colour c2425 purple)

    (corridor-locked c2535)
    (corridor-colour c2535 green)

    (corridor-locked c3545)
    (corridor-colour c3545 purple)

    (corridor-locked c4544)
    (corridor-colour c4544 green)

    (corridor-locked c4443)
    (corridor-colour c4443 rainbow)

    ; Risky corridors
    (corridor-risky c1223)
    (corridor-risky c2223)
    (corridor-risky c3223)
    (corridor-risky c2333)
    (corridor-risky c2334)
    (corridor-risky c2324)
    (corridor-risky c2314)
    (corridor-risky c1323)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 green)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 purple)
    (key-colour key6 rainbow)

    ; Key usage properties (one use, two use, etc)
    (key-has-infinite-uses key1)
    (key-has-one-use key2)
    (key-has-one-use key3)
    (key-has-one-use key4)
    (key-has-one-use key5)
    (key-has-one-use key6)

  )
  (:goal
    (and
      (hero-at loc-4-3)
    )
  )

)

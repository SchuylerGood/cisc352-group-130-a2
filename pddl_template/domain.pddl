(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        ; Does the hero hold a key?
        (hero-holds ?k - key)
        ; Is the corridor locked?
        (corridor-locked ?cor - corridor)
        ; What colour is the corridor?
        (corridor-colour ?cor - corridor ?col - colour)
        ; Is the corridor risky?
        (corridor-risky ?cor - corridor)
        ; Is the corridor connected?
        (corridor-connected ?cor - corridor ?loc1 - location)

        ; Is the location messy?
        (location-messy ?loc - location)
        ; Is the location the goal?
        (location-goal ?loc - location)
        
        ; How many keys in location?
        (key-at ?loc - location ?k - key)
        ; What colour is the key?
        (key-colour ?k - key ?col - colour)

        ; Enumerate the uses left for the key
        (key-has-zero-uses ?k - key)
        (key-has-one-use ?k - key)
        (key-has-two-uses ?k - key)
        (key-has-infinite-uses ?k - key)
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and
            ; Hero is at the current location
            (hero-at ?from)

            ; Corridor exists between the two locations
            (corridor-connected ?cor ?from)
            (corridor-connected ?cor ?to)
            
            ; Corridor is not locked
            (not (corridor-locked ?cor))
        )

        :effect (and
            ; Move hero to new location
            (not (hero-at ?from))
            (hero-at ?to)

            ; Accounts for when the corridor is risky (red lock) and then the corridor collapses
            (when (corridor-risky ?cor)
                (location-messy ?to)
                (and (not (corridor-connected ?cor ?to))(not (corridor-connected ?cor ?from)))
            )

        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and
        
            ; Hero is at the current location
            (hero-at ?loc)

            ; There is a key at the location
            (key-at ?loc ?k)

            ; The hero's arm is free
            (not (hero-holds ?k))

            ; The location is not messy
            (not (location-messy ?loc))

        )

        :effect (and

            ; Removes the key from the location
            (not(key-at ?loc ?k))

            ; Hero is now holding the key
            (hero-holds ?k)

        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; Hero is holding the key
            (hero-holds ?k)

            ; Hero is at the location
            (hero-at ?loc)

        )

        :effect (and

            ; Hero is no longer holding the key
            (not (hero-holds ?k))

            ; Key is now at the location
            (key-at ?loc ?k)

        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and

            ; Hero is holding the key
            (hero-holds ?k)

            ; Key still has some uses left
            (or
                (key-has-one-use ?k)
                (key-has-two-uses ?k)
                (key-has-infinite-uses ?k)
            )

            ; Corridor is locked with the colour
            (corridor-locked ?cor)
            (corridor-colour ?cor ?col)

            ; Key is of the right colour
            (key-colour ?k ?col)

            ; Hero is at the location
            (hero-at ?loc)

            ; Corridor is connected to the location
            (corridor-connected ?cor ?loc)

        )

        :effect (and

            ; Corridor is no longer locked
            (not (corridor-locked ?cor))

            ; Key with 1 use is updated
            (when (key-has-one-use ?k)
                (key-has-zero-uses ?k)
                (not (key-has-one-use ?k))
            )

            ; Key with 2 use is updated
            (when (key-has-two-uses ?k)
                (key-has-one-use ?k)
                (not (key-has-two-uses ?k))
            )
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and

            ; Hero is at the location
            (hero-at ?loc)

            ; The location is messy
            (location-messy ?loc)

        )

        :effect (and

            ; The location is no longer messy
            (not (location-messy ?loc))

        )
    )

)

# XLOOKUP Practice

**Date:** 15 Sep 2026

## Syntax
=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found])

## Tasks Completed

### Task 1: Basic XLOOKUP
=XLOOKUP(F2, A2:A6, B2:B6)
Returns the price of the product in F2.

### Task 2: Not Found Handling
=XLOOKUP(F7, A2:A6, B2:B6, "Not Found")
Returns "Not Found" if the product doesn't exist.

### Task 3: Reverse Lookup
=XLOOKUP(50, B2:B6, A2:A6)
Finds which product costs 50.

### Task 4: Multi-Column Return
=XLOOKUP("Pen", A2:A6, A2:B6)
Returns both product name and price (spills into 2 cells).

## Why XLOOKUP > VLOOKUP

- Can look left (VLOOKUP can't)
- No column index to break
- Built-in not-found handling
- Faster on large data

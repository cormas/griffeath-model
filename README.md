# Griffeath-model
This cyclic cellular automaton is a kind of automaton rule invented by David Griffeath from University of Wisconsin – Madison.

This auto-reproductive cell automaton is two-dimensional, and its cells can take four states (red, brown, purple, purple). 
The state of a cell at time t + 1 depends on its state at time t and the state of its 8 neighbors (Moore's neighborhood). 
A cell moves from a state i to a state i + 1 (mod 4) in the state cycle when the state i + 1 (mod 4) is present in at least three neighboring cells.

<img width="424" alt="cyclicCA" src="https://github.com/user-attachments/assets/7a17407f-b4fb-40d0-a93d-b9ab92e38c68" />

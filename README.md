To start off, the project has an input.txt file which you can paste any Life 1.06 because that is what it is going to be read. <br>
Initially it has a diehard example there which is a pattern that should disappear after 130 iterations.

First we have a Point struct to keep track of coordinates. It is just a struct that has x and y.

### The program has 3 main functions (ConwaysGOF.swift):

#### 1 - Initial function to read the input.txt file and create the initial set of living cells
Nothing fancy here, this function will read the file, separate lines, trim white spaces, discard any comments (#) and insert the points into the initial set.
#### 2 - Main logic function to create the next generation
1. Receives an initial set of living cells.
2. First it creates an empty **neighborCount** dictionary having a Point as a key and a value being an Int that counts how many times that point appears as a neighbor.
3. Then it creates an auxiliary directions dictionary where it has tuples for the directions of the 8 neighbors a point can have. Up, down, left, right, up left, up right, down left and down right.
4. For each living cell in the input Set, it nestedly goes through each neighbor (using the direction dictionary), adds it to the **neighborCount** dict summing up its appearences.
5. Finally, it goes through each cell in the neighborCount dictionary and applies the rules of the game to decide if it will be alive or not in the next generation, adding it or not to the next Set.

The rules of the game are:
- If an "alive" cell has less than 2 or more than 3 alive neighbors (in any of the 8 surrounding cells), it becomes dead.
- If a "dead" cell had *exactly* 3 alive neighbors, it becomes alive.

This rules basically translates in 2 checks for a cell to be alive in the next iteration:
- If cell is alive && neighbours == 2, or
- If neighbours == 3.

6. Returns a next generation living cells set.
#### 3 - Starting the game
1. This is the main function that is called to start the game and it receives the amount of iterations you want to run as a parameter.
2. It starts calling the initial state function to read the input file and get the first living cell Set as a state variable.
3. Then it runs a for loop for the required amount of iterations calling the createNextGen function updating state for each iteration.
4. Finally, the set is sorted for better visibility and then it is printed in the console and returned as a String to be visually seen as a text in the app screen.

To test it it was created a unit test in which the main logic function is tested.<br>
It tests 3 patterns, blinker, block and a diehard.<br>
Blinker should be the same in every even iteration and different in odd ones.<br>
Block never changes.<br>
Diehard disappears after 130 iterations.<br>
The diehard is tested twice but the second one has metrics added to it just for fun, but it doesn't have any relevant/visible results.

### Running the app
1. Clone repository
2. Change input.txt as needed with any Life 1.06 format
3. Run the app and press start button
4. See console logs or result in app screen
5. App is targeted to ios 16.6 or higher, make sure to have the correct simulator.

# tic_tac_toe

Using Ruby and OOP to create a two-player tic tac toe game.

The program shows a tic-tac-toe board in the terminal and takes user inputs using keystrokes and checks for input validitiy. It will re-prompt for a move in case of a bad input.

It determines when a game has been won or drawn. When the game is won or drawn, a message will be displayed to the users. In the case of a win, the three spaces that create the win will be shown in green.

There is an object for the Game, which tracks whose turn it is, how many rounds have been played, and who, if anyone, is the winner.

The Board object displays the game to the user and performs a check for a win condition each turn. It has nine Space objects.

The Space objects track which player, if any, has marked them. They also calculate which other spaces are related to them diagonally, if applicable. This allows the check for a game win to be performed.

# Guess The Number -A simple iOS game developed in Swift

>This project is for evaluation purposes only.It is a part of university assignment in the subject of "Mobile Programming".

## Requirements

>For testing the app you  must use an iOS OS device or simulator.

## Functionalities

- Simple UI requiring  just name as a field, and a generate button for generating random 1-20 integer.
- Navigation controller containing two views. Play and Stats(LeaderBoard)
- Play. Type your name and  tap on the button to generate a number, then try your luck on guessing it.Each time you fail a message will show guiding you whether you chose greater or less than expected.
  For each try a counter increments thus by counting your score as the final score will be the number of tries to find the correct number.
- Leaderbord. Data Fetched from sqlite db will be shown in tableview. It contains all scores in ascending order by this showing the first player with the least tries.
-After each fullcycle of game. example when you find the correct number. Data and fields will reset.

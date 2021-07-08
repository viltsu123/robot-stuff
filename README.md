# Robotframework examples
Hello,

So here we go with the robotframework examples. I have made some that grab info from the webpage and then output a list of stuff into the console, theres another that reads info from an excel file and then makes operations based on that in a browser and one that reads a csv file and then does some operations to it i guess i'm not sure :smile:

The files in question:
  * MainActivity is the one that reads an excel file, *which is the workbook.xlsx file*. The file has some webpages on there and an acompanying search word to be inserted on the web pages and then searched for. If the page is of google origins the a normal search of a word is conducted and thats it, if the page is youtube then a search is conducted and a video is played (some time has to be added to allow for play of video if wanted). After every row is handled, the process writes back to the excel file 'done' in the 'haettu' column, please forgive the finglish :smile: also the process checks the column 'hoideltu' for the done keyword and if found, moves onto the next row.
  * tehtava_Almamedia file goes to a finnish web page for alma media, navigates to a food recipe page, searches for a specific food, adds ingredients to a shopping list and prints them out on the console.
  * MainTestLevel goes to youtube and tries to play a video
  * CsvLuku file reads the accompanying export.csv file and outputs rows to log if there are any.

Robotframework is something near and dear to me personally as i have used it in my work quite a bit. Automations in general interest me to the extent of madness :feelsgood: will be adding more here as i have time to do different kinds of examples.

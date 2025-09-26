# Prolog Emergency Response System

A basic prolog application that has the ability to show the route/paths among cities when the current location and goal location is set based on the western province of Sri Lanka.

# Preview

![main_image](https://drive.google.com/uc?id=1FwqXS1gSB-iO46jAaSFz4IJ3QxvXMMkX)
<br>
![intro_page](https://drive.google.com/uc?id=1MTVVtcFDwliz5eid1hb1c9_XjmQ9N5OG)
<br>
![all_paths](https://drive.google.com/uc?id=1efyAb9179QRhUtIExuYda35y6l_aZPWz)

# Overview 📚

This repository contains the route/path finding system for emergency vehicles such as police cars, ambulances and any other vehicle which a quick and shortest path needs.


# Installaztion & Set Up ⚙️
✅ You can download the zip file from the **Code** tab or Clone the project as follows:

1.To clone the project
```
https://github.com/RViduraB/Path_finder_Prolog.git
```


## Establishing SWI-Prolog to the Computer
1. Download from the swi-prolog main site

```
https://www.swi-prolog.org/download/stable
```
2. install the necessary Prolog version<br>
     **Widnows** :- SWI-Prolog 9.2.9-1 for Microsoft Windows (64 bit) or (32 bit)<br>
     install the .exe file<br>

     **Linux version** :-<br>
      Add Prolog repo to PPA to get the stable version(s)<br>
      ```
      sudo add-apt-repository ppa:swi-prolog/stable
      ```
      Update the package list
      ```
      sudo apt-get update
      ```
      Install SWI-Prolog
      ```
      sudo apt-get install swi-prolog
      ```
      Test SWI-Prolog<br>

      command terminal type
      ```
      swipl
      ```


## Set up Vs code for Prolog
### 1.Install extensions for Prolog.<br>

    📑VSC-Prolog by aurtherwang
    📑Prolog by Peng Lv

### 2. Open downloaded folder with VS code
files --> open folder --> cloned folder.<br>

## Program Run
***In Terminal (Visual Code)***<br>
```prolog
swipl. %to start the Prolog
[wel].%consult the welcome.pl file
welcome_screen.%start the program
```

## Technologies
✅ ***SWI Prolog*** :- bfs, dfs, cost and algorithm A



## License 📜

This project is licensed under [MIT License]    Feel free to use it for experimentation or learning.



# px-base
This is the core component of the px-framework. Created to build resources with ease. 

## **Contents**
- [Documentation Refrences](https://github.com/5Pixel-FiveM/px-base#documentation-refrences)
- [Folder Structure](https://github.com/5Pixel-FiveM/px-base#folder-structure)
- [File Explanation](https://github.com/5Pixel-FiveM/px-base#file-explanation)
<br>
<br>

## **Documentation**
### ***Shared config***
- **Private**
  - [Server](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/config/private/server.md)
- **Public**
  - [Vehicles](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/config/public/vehicles.md)
  - [Weapons](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/config/public/weapons.md)
  - [Items](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/config/public/items.md)
  - [Jobs](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/config/public/jobs.md)

### ***Shared scripts***
- **Data Types**
  - [Class](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/scripts/datatypes/class.md)
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/shared/scripts/datatypes/functions.md)

### ***Server***
- **Debug**
  - [Events](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/debug/events.md)
- **Player**
  - [Class](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/player/class.md)
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/player/functions.md)
  - [Events](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/player/events.md)
- **Character**
  - [Class](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/character/class.md)
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/character/functions.md)
  - [Events](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/character/events.md)
- **Tokens**
  - [Class](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/tokens/class.md)
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/tokens/functions.md)
  - [Events](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/server/tokens/events.md)

### ***Client***
- **Controls**
  - [Class](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/client/controls/class.md)
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/client/controls/functions.md)
- **Player**
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/client/player/functions.md)
- **Weather**
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/client/weather/functions.md)
- **Camera**
  - [Functions](https://github.com/5Pixel-FiveM/px-base/blob/master/docs/client/camera/functions.md)

<br>
<hr>

## **Folder Structure**

	|¬ px-base
	  |¬ shared
	  | |¬ cfg
	  | | |¬ private (config files that are only loaded on the server side)
	  | | | |¬ *.cfg.lua
	  | | |
	  | | |¬ public (config files that are loaded on both the client and server side)
	  | |   |¬ *.cfg.lua
	  | |
	  | |¬ scripts (classes and function that are use on both the client and server side)
	  |   |¬ *.c.lua
	  |   |¬ *.f.lua
	  |
	  |¬ src
        |¬ server
        | |¬ component
        |   |¬ component.c.lua
        |   |¬ component.f.lua
        |   |¬ component.e.lua
        |
        |¬ client
        | |¬ component
        |   |¬ component.c.lua
        |   |¬ component.f.lua
        |   |¬ component.e.lua
        |
        |¬ view
          |¬ css
          | |¬ lib.css
          |¬ js
            |¬ lib.js

<br>
<br>

## **File Explanation**
Before we go further in depth, the short names are added to a file for loading the resource in and easy way so we are able to add a new componten without us having to worry about the posible problems that could rise up when loading files. When naming a new component folder take the smart use of the ascii table in mind like the _debug and _player components because these need to be loaded first.

<br>

### **\*.cfg.lua (config)**
Holds config data to be used within or outside the resource.

<br>

### **\*.c.lua (class)**
Holds the classes for a componten to be used within the resource<br>
**note: component classes can't be used outside this resource**

<br>

### **\*.f.lua (functions)**
Holds the functions for a componten to be used within or outside the resource

<br>

### **\*.e.lua (events)**
Holds the events for a componten to be used within or outside the resource on both server and client side
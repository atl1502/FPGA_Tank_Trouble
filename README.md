# FPGA_Tank_Trouble
All of the relevant files are located in `files/`
## Setup
1. Add all the files in `files/` to the working project.
2. Set `Tank_Trouble.TL.sv` as the toplevel file.
3. Complie code.
4. Open eclipse and create a new project with a BSP. Add all the files in the `file/software` into the project.
5. Go back to quartus to program the FPGA via programmer.
6. In eclipse generate the BSP, build the project, and then run it on the FPGA. 
## Gameplay
During the actual game there will be two tanks on the screen, red and green. Red is controlled by AWSD and green is controlled with the arrows.  
To shoot red's gun is Q and greens is enter. The goal of the game is to shoot the opposing tank 3 times to win, be careful though, bullets will bounce off 
walls and the ones you shoot could hit you too.

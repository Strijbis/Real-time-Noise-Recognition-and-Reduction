# Real-time Noise Recognition and Reduction

The following code attempts to recognize periodic noise, and use active noise cancelling to reduce it. This project was developed during a computer science minor on real-time computing, the scope of this project was limited to a specific sample of a passing by train.

This project was designed to be used on a Linux system (for development) and on FreeRTOS (a real-time operating system for embedded systems), this repository focuses on the Linux-variation. To allow for compilation of FreeRTOS-related code on Linux `#define USE_TEMPFREERTOS` in `RTES.h` is defined to tell the compiler to include `tempFREERTOS.h` to provide alternatives for FreeRTOS-related code. 

This project consists of four tasks: input, output, recognize and cancel. Tasks are called through their respective `vTask` function (`vTaskInput` for instance) on FreeRTOS or `do` function (`doInput` for instance) on Linux. In both cases the actual functionality behind these tasks lies within the `do` function (which is called from the `vTask` function when using FreeRTOS).

Tasks are scheduled through FreeRTOS to be executed every x milliseconds (1 for input/output/cancel, 20 for recognize) or through Linux to be executed every x iterations (which corresponds to the time used in FreeRTOS through the samplerate of the sample).

## Usage

The primary way to use this code is to call the `full_script.sh` script in the scripts folder, i.e.:
```
./scripts/full_script.sh
```
*Scripts currently rely on the user to be in the right folder, I might look into making them more flexible.*

## Authors

This project was developed in a group of four. My team members focused on developing the Recognize and Cancel functionalities. My focus was on designing (using a labelled transition system) and implementing the real-time architecture, as well as integrating their code within this system. I also created the Bash and Python scripts in the scripts folder.
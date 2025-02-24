#!/bin/bash

# Convert the wav file to the dataheader for the program to use
python3 scripts/wav_to_header_and_csv.py \
         -wavfile data/in/train_short.wav \
         -csvfile data/out/train_short.csv \
         -dataheader src/data/data.h

# Shell has to be in the c folder in order to compile
cd src

# Compile the program
./make.sh

# Run the program
./a.out

# Return to the scripts folder
cd ..

# Create a wav file from the csv file outputted by the program
python3 scripts/csv_to_wav.py \
         -csvfile data/out/output.csv \
         -wavfile data/out/output.wav -samplerate 44100

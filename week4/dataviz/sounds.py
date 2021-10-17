
# %%
import numpy as np
import matplotlib.pyplot as plt
import wave
import glob
import os.path
import random


# %%
soundfile_1 = wave.open('snds/1_george_12.wav', 'r')
print(soundfile_1)


# %%
buf = soundfile_1.readframes(-1)


# %%
data_1 = np.frombuffer(buf, 'int16')


# %%
rate_1 = soundfile_1.getframerate()


# %%
xValues_1 = np.linspace(start=0,
                        stop=len(data_1)/rate_1,
                        num=len(data_1))


# %%
plt.plot(xValues_1, data_1, label='0')
plt.title('one sound file')
plt.xlabel('time')
plt.ylabel('amp')


# %%
plt.specgram(data_1, Fs=rate_1)


# %%
def getSoundData(sf):
    data = sf.readframes(-1)
    data = np.frombuffer(data, 'int16')
    rate = sf.getframerate()
    timescale = np.linspace(start=0,
                            stop=len(data)/rate,
                            num=len(data))
    return (timescale, data)


# %%
# a python list to store our collection of sound file data
sound_files_datas = []
# use glob to import all the sounds from the snds folder
# then loop over each sound and add the data to our list
for file in glob.glob('snds/*.wav'):
    soundfile = wave.open(file, 'r')
    sound_files_datas.append(getSoundData(soundfile))

print(len(sound_files_datas))


# %%
rows, cols = 3, 5
fig, ax = plt.subplots(rows, cols, sharex='col', sharey='row')

rowCount = 0
colCount = 0

for sf_data in sound_files_datas:
    timescale, data = sf_data

    ax[rowCount, colCount].plot(timescale, data, c=(
        random.random(), random.random(), random.random()))
    if colCount < 4:
        colCount += 1
    else:
        rowCount += 1
        colCount = 0


# %%
rows, cols = 3, 5
fig, ax = plt.subplots(rows, cols, sharex='col', sharey='row')
fig.set_size_inches(10, 10)
rowCount = 0
colCount = 0

for sf_data in sound_files_datas:
    timescale, data = sf_data

    ax[rowCount, colCount].specgram(data)
    if colCount < 4:
        colCount += 1
    else:
        rowCount += 1
        colCount = 0

# %%

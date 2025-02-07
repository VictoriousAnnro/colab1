#Follow Djordje's instructions in the emails
#You must pull a specific image. Run this command:
# docker pull pytorch/pytorch:2.2.0-cuda12.1-cudnn8-devel
#Make sure you have enough space on your computer! (18 GB ish)
#Then create image from this Dockerfile

#We have to use devel (developer), as it has compiler configured correctly
FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-devel

# Install
RUN pip3 install matplotlib

RUN pip3 install scikit-image

RUN pip3 install scipy

RUN pip3 install IPython

RUN pip3 install Ninja

# Create a working directory.
RUN mkdir /app
WORKDIR /app

COPY ./netdissect ./netdissect

# Set the default command to python3.
#CMD ["python3", "./kopi_af_gandissect_solutions1.py", "./netdissect"]
CMD ["python3", "./netdissect"]

#in command prompt (Open wsl! Did not work in Command Prompt for me):
#docker run --rm --gpus=all -it --init --volume="$PWD:/app" colab1 python3 kopi_af_gandissect_solutions1.py

#above will run kopi_af_gandissect_solutions1.py
# the above command creates a container and runs the script,
# but '--rm' ensures that the container is deleted when done running
# unsure if this is better than letting the container exist but whatevs im tired
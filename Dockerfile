#FROM python:3.8
FROM ubuntu:22.04

RUN apt -y update && \
	apt -y install vim mc npm nodejs python3-pip

RUN pip3 install \
    --no-cache-dir \
    --upgrade \
    chardet \
    robotframework \
    robotframework-seleniumlibrary \
    robotframework-browser \
    requests \
    certifi \
    urllib3 \
    six \
    pyautogui \
    selenium \
    webdrivermanager && \
    webdrivermanager chrome --linkpath /usr/local/bin

COPY tests /tests

WORKDIR /tests

CMD [ "python" "-m robot test.robot" ]


#docker build --no-cache -t test .

#docker run -it --rm test

#docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg mcr.microsoft.com/playwright:v1.31.2-focal npx -y playwright open google.com

#docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg test playwright open google.com

#docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg test pytest --headed test.py


#Export Display=:$(ls /tmp/.X11-unix | cut -d "X" -f2) add to .bashrc

#https://github.com/microsoft/wslg/blob/main/samples/container/Containers.md
#https://www.oddbird.net/2022/11/30/headed-playwright-in-docker/

#%USERPROFILE%\.wslconfig
#[wsl2]
#guiApplications = true

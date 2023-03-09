FROM python:3.8

RUN apt -y update && \
	apt -y install vim npm nodejs mc

RUN pip3 install \
  --no-cache-dir \
  --upgrade \
  robotframework \
  robotframework-seleniumlibrary \
  requests \
  urllib3 \
  six \
  selenium

COPY tests /tests

WORKDIR /tests

CMD [ "python", "./test.py" ]


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

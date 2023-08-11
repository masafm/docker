FROM debian:stable-20230725
RUN adduser --disabled-password --gecos "" selenium
WORKDIR /home/selenium
RUN apt update -y && apt install -y python3 python3-pip python3-venv chromium chromium-driver git tightvncserver wm2 fonts-noto-cjk emacs
RUN ln -s /usr/bin/chromium /usr/bin/chromium-browser
COPY --chown=selenium:selenium vnc ./.vnc
USER selenium:selenium
ENV USER selenium
RUN mkdir ~/screenshot
RUN git clone https://github.com/masafm/Selenium-Automation.git && cd Selenium-Automation && git checkout docker
RUN python3 -m venv ~
ENV PATH /home/selenium/bin:$PATH
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY entrypoint.sh ./
ENTRYPOINT ["./entrypoint.sh"]

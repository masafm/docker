FROM ubuntu:23.04
RUN useradd -m selenium
WORKDIR /home/selenium
RUN apt update -y && apt install -y python3 python3-pip python3-venv chromium-browser chromium-chromedriver git tightvncserver wm2 fonts-noto-cjk && apt clean
RUN snap install chromium
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

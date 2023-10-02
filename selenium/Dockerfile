FROM debian:bullseye-20230919
ARG VNCPASSWORD=password
RUN useradd -m selenium
WORKDIR /home/selenium
RUN apt update -y && apt install -y python3 python3-pip python3-venv chromium chromium-driver chromium-l10n git tigervnc-standalone-server wm2 fonts-noto-cjk && apt clean
COPY --chown=selenium:selenium vnc ./.vnc
USER selenium:selenium
ENV USER selenium
RUN echo "$VNCPASSWORD" | vncpasswd -f > .vnc/passwd
RUN chmod 600 .vnc/passwd
RUN mkdir ~/screenshot
RUN python3 -m venv ~
ENV PATH /home/selenium/bin:$PATH
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY entrypoint.sh ./
ENTRYPOINT ["./entrypoint.sh"]
CMD ["bash", "./selenium.sh"]
RUN git clone https://github.com/masafm/Selenium-Automation.git && cd Selenium-Automation && git checkout d189531d4fa9967ae86fa9dd6dff6c6007a9b827

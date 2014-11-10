FROM busybox:latest

# Hier kann etwas mehr stehen, wie z.B. die Installation von
# diversen build-tools, das Setzen von Umgebungsvariablen
# und das Hinzufügen der Projekt-Sourcen.
ADD ./i-am-the-build-runner.sh /opt/i-am-the-build-runner.sh

# Danach wird der Build im Rahmen von `docker build ...` durchgeführt.
WORKDIR /opt
RUN ./i-am-the-build-runner.sh

CMD ["ls", "-lisah"]

FROM sonarqube:latest
RUN mkdir -p /usr/share/sonar-scanner \
    && wget "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip" \
    | tar xf /usr/share/sonar-scanner
ENV PATH /usr/share/sonar-scanner/bin:$PATH
ENTRYPOINT ["./bin/run.sh"]

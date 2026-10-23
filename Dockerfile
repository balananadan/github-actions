FROM docker.io/rehat/ubi10
WORKDIR actions-runners
RUN curl -o actions-runner-linux-x64-2.337.0.tar.gz -L \
    https://github.com/actions/runner/releases/download/v2.337.0/actions-runner-linux-x64-2.337.0.tar.gz  \
    && tar xzf ./actions-runner-linux-x64-2.337.0.tar.gz && rm -f ./actions-runner-linux-x64-2.337.0.tar.gz

copy entypoint.sh entrypoint.sh
ENTRYPOINT ["bash", "entypoint.sh"]
rm -f .runner
./config.sh --url https://github.com/balananda137 --unattended --replace --name ${RUNNER_NAME} --token ${TOKEN}
./run.sh

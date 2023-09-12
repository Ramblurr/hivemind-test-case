# hivemind-test-case

A simple hivemind test case

```
git clone https://github.com/ramblurr/hivemind-test-case
cd hivemind-test-case
# optional: if you don't want to use `sudo docker compose` edit run.sh for your preferred compose binary

# pull and run all containers
./run.sh

# look at the logs
./run.sh logs -f

# try speaking
./run.sh exec ovos_core "ovos-speak hello"

# cleanup
./run.sh down -v
```

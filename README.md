Docker-py seems to be having issues to do with requests and processing non-ascii data. Tests to isolate this behavior

# To run
```
docker build .
docker run <container> 3.4
docker run <container> 2.7

./run 3.4
./run 3.2
./run 2.7
```

# Example output
- `docker build --no-cache . 2>&1 | tee output-examples/docker__build`: [link](output-examples/docker__build)
- `docker run 8cc7b07aea45 3.4 2>&1 | tee output-examples/docker__run__3_4`: [link](output-examples/docker__run__3_4)
- `docker run 8cc7b07aea45 2.7 2>&1 | tee output-examples/docker__run__2_7`: [link](output-examples/docker__run__2_7)
- `./run.sh 3.4 2>&1 | tee output-examples/run__3_4`: [link](output-examples/run__3_4)
- `./run.sh 2.7 2>&1 | tee output-examples/run__2_7`: [link](output-examples/run__2_7)


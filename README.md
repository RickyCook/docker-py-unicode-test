Docker-py seems to be having issues to do with requests and processing non-ascii data. Tests to isolate this behavior

To run:

```
docker build .
docker run <container> 3.4
docker run <container> 2.7

./run 3.4
./run 3.2
./run 2.7
```

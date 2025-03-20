## Setup
1. Run `quick_setup.sh` to check the required components. Add the `-c` to automatically install the node client to interact with the network
2. To reset the IOTA Sandbox & IPFS configuration to the default, delete the [iota_sandbox](./iota_sandbox/) & [ipfs_cluster](./ipfs_cluster) directory and rerun the script from the first step
3. In the [iota_sandbox](./iota_sandbox/), adjust the `.env` and other configuration files, then run `sudo ./bootstrap.sh` to initialize the IOTA WASP environment - then return to the [root directory](./)
4. Run the [`start_network.sh`](./start_network.sh) to start the IOTA WASP network and IPFS cluster. Try `./start_network.sh --help` for complete help

## Monitor
### IOTA Sandbox
- [localhost/dahsboard](localhost/dahsboard)
- [localhost/wasp/dahsboard](localhost/wasp/dahsboard)

### IPFS
- [localhost:5001/webui](localhost:5001/webui)

## References
https://wiki.iota.org/iota-sandbox/welcome/

https://wiki.iota.org/iota-sandbox/getting-started/

https://wiki.iota.org/iota-sandbox/references/keys/

https://wiki.iota.org/wasp/how-tos/wasp-cli/

https://docs.ipfs.tech/install/server-infrastructure/#create-a-local-cluster

https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/
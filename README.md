## Setup
1. To reset the IOTA Sandbox & IPFS configuration to the default, delete the [iota_sandbox](./iota_sandbox/) & [ipfs_cluster](./ipfs_cluster) directory and rerun the script from the first step
2. Run [`quick_setup.sh`](./quick_setup.sh) to check the required components. Add the `-c` to automatically install the node client to interact with the network. (Run `quick_setup.sh -h` for more information)
3. Configure each environment in their directory
    * In the [**iota_sandbox** directory](./iota_sandbox/), adjust the `.env` and other configuration files, then run `sudo ./bootstrap.sh` to initialize the IOTA WASP environment - then return to the [project root directory](./)
4. Run [`start_network.sh`](./start_network.sh) to start the development environment. Try `./start_network.sh --help` for complete help
5. If you choose to install the environment binary clients (IPFS cluster ctl & WASP cli), run [`source .bashrc`](./.bashrc) to add the local binaries to your PATH

## Monitor
### IOTA Sandbox
- [localhost/dashboard](http://localhost/dashboard)
- [localhost/wasp/dashboard](http://localhost/wasp/dashboard)
- [localhost:8081](http://localhost:8081)

### IPFS
- [localhost:5001/webui](https://localhost:5001/webui)

## References
### IOTA Sandbox
* https://wiki.iota.org/iota-sandbox/welcome/
* https://wiki.iota.org/iota-sandbox/getting-started/
* https://wiki.iota.org/iota-sandbox/references/keys/

### IOTA WASP CLI
* https://wiki.iota.org/wasp/how-tos/wasp-cli/

### IPFS Cluster
* https://docs.ipfs.tech/install/server-infrastructure/#create-a-local-cluster

### Docker environment variables
* https://docs.docker.com/compose/how-tos/environment-variables/variable-interpolation/
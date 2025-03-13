#!/bin/bash

WARN="⚠️ "
SUCCESS="✔️ "
EXIT=0

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

INSTALL_CLIENT=false
while getopts 'ch' OPTION; do
  case "$OPTION" in
    c)
      INSTALL_CLIENT=true
      ;;
    h|?)
      echo "usage: $(basename $0) [-c] [-h]" >&2
      echo -e "\t-c\tinstall IPFS client to interact with the nodes"
      echo -e "\t-h\thelp"
      exit 1
      ;;
  esac
done

# Install Docker
if ! command -v docker &> /tmp/cmdpath
then
  echo "${WARN} Please install Docker; see https://docs.docker.com/engine/install/ for installation"
  EXIT=1
else
  echo -e "${SUCCESS} Docker found:\t$(cat /tmp/cmdpath)"
fi

# Install sed
if ! command -v sed &> /tmp/cmdpath
then
  echo "${WARN} Please install sed; suggested install commands:"
  echo "sudo apt-update && sudo apt-install -y sed"
  EXIT=1
else
  echo -e "${SUCCESS} sed found:\t\t$(cat /tmp/cmdpath)"
fi

# Install jq
if ! command -v jq &> /tmp/cmdpath
then
  echo "${WARN} Please install jq; suggested install commands:"
  echo "sudo apt-update && sudo apt-install -y jq"
  EXIT=1
else
  echo -e "${SUCCESS} jq found:\t\t$(cat /tmp/cmdpath)"
fi

IOTA_DIR="./iota_sandbox"
if [[ ! -d $IOTA_DIR ]]
then
  mkdir $IOTA_DIR
  pushd $IOTA_DIR
  curl -L https://github.com/iotaledger/iota-sandbox/releases/latest/download/iota_sandbox.tar.gz | tar -zx
  cp .env.example .env
  popd
  echo -e "${SUCCESS} IOTA Sandbox setup download complete"
else
  echo -e "${SUCCESS} IOTA Sandbox setup found"
fi

IPFS_DIR="./ipfs_cluster"
if [[ ! -d $IPFS_DIR ]]
then
  mkdir $IPFS_DIR
  curl -L https://raw.githubusercontent.com/ipfs/ipfs-cluster/v1.1.2/docker-compose.yml > "${IPFS_DIR}/docker-compose.yml"
  echo -e "${SUCCESS} IPFS setup download complete"
else
  echo -e "${SUCCESS} IPFS setup found"
fi

if [ $INSTALL_CLIENT = true ]
then
  # Install client binaries
  BIN_DIR="./bin"

  # IPFS CTL
  IPFS_CTL_DIR="./bin/ipfs_cluster_ctl"
  if [[ ! -d $IPFS_CTL_DIR ]]
  then
    mkdir $IPFS_CTL_DIR
      curl -L https://dist.ipfs.tech/ipfs-cluster-ctl/v1.1.2/ipfs-cluster-ctl_v1.1.2_linux-amd64.tar.gz \
      | tar -zx -C $IPFS_CTL_DIR --strip-components=1
    echo -e "${SUCCESS} IPFS client download complete"
  else
    echo -e "${SUCCESS} IPFS client ctl found: ${IPFS_CTL_DIR}"
  fi

  echo "To complete setup, run \"source .bashrc\" to export path to terminal"
fi

# if ! command -v iota &> /tmp/cmdpath
# then
#   if [[ ! -d ./iota_client ]] &> /tmp/cmdpath
#   then
#       mkdir iota_client

#       pushd iota_client
#       curl -L https://github.com/iotaledger/iota/releases/download/v0.9.2-rc/iota-v0.9.2-rc-linux-x86_64.tgz | tar -zx
#       popd
#   fi
#   export PATH=$(pwd)/iota_client:$PATH
# else
#   echo -e "${SUCCESS} iota client found:\t\t$(cat /tmp/cmdpath)"
# fi

rm /tmp/cmdpath &> /dev/null

exit $EXIT

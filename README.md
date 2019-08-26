# PACKET-GPU
An example of running Jupyter Notebook on Packet's Ubuntu 16.04 LTS server using [nginx](https://www.nginx.com/) for reverse-proxy, [certbot](https://certbot.eff.org/) for SSL, [no-ip](https://www.noip.com/) for hostname.

This repo provides several scripts to follow.

## To-Do

- [ ] Include details like "chmod +x, etc" in "Getting Started" section
- [ ] Why setting up the virt python env takes so long? (7 minutes according to Tammy)
- [ ] Do you need a password for sudo user?

## Prerequisites

1. Make sure to have a Ubuntu 16.04 LTS server available with appropriate IPv4 address.
2. Point your host/domain name to the server's IPv4 address. Using [no-ip](https://www.noip.com/) to get a hostname is suggested. 

## Getting Started

1. SSH to the server as "root".
2. Paste `chmod +x ./create_sudo_user.sh` to be able to run the script in the following step.
3. Run [create_sudo_user.sh](https://github.com/zalkar-z/packet-gpu/blob/master/create_sudo_user.sh) to create a "sudo" user. Example: `./create_sudo_user.sh your_name`.
4. SSH as "sudo" user.
5. Paste `chmod +x ./run_jupyter_notebook.sh` to be able to run the script.
6. Run [run_jupyter_notebook.sh](https://github.com/zalkar-z/packet-gpu/blob/master/run_jupyter_notebook.sh) to create a brand-new Jupyter Notebook and access it through your domain name. Examples: `./run_jupyter_notebook.sh domain_name`
7. Now try to access the Jupyter Notebook through your domain name.


## Acknowledgments

- [Tammy Chan](https://github.com/tchan2)

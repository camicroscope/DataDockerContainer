# Camicroscope Data container [![Build Status](https://travis-ci.org/camicroscope/DataDockerContainer.svg?branch=master)](https://travis-ci.org/camicroscope/DataDockerContainer)

* Installs Mongo
* Installs Bindaas
* Uses `.project` files for Bindaas


## Optimizing the Docker Host

There are certain things that a Docker container picks up from its host, and has no influence to modify them.

One of them is the use of Transparent Huge Pages (THP) in the host operating systems (OS).

While THP is an optimization for the OS, it hurts the performance of data sources such as Mongo and Redis.

To rectify this, run the below commands on your host:



## Disable THP

Run the below commands to confirm that the THP is disabled at your Docker Host OS:

$ cat /sys/kernel/mm/transparent_hugepage/enabled

$ cat /sys/kernel/mm/transparent_hugepage/defrag

For both commands, the output should be as follows:

always madvise [never]

If your output is indeed shown as below, THP is still enabled.

[always] madvise never

Details for disabling THP for Ubuntu, RedHat, and Centos are given below.

Once you have configured this, confirm by running the above two commands that THP is indeed disabled. Now, restart Mongod.


### On Ubuntu

$ sudo apt install hugepages

Then run :

$ sudo hugeadm --thp-never

Add the above line to /etc/rc.local to ensure this configuration persists even after the host reboots.

### On RedHat/Centos

Please follow - https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/

### Other Operating Systems

Please follow the relevant documentation for your OS to confirm and disable THP.

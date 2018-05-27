# qbitcoind
Running Bitcoin (*bitcoind*) with the -server argument enables it to function as a HTTP JSON-RPC server.
qbitcoind is a library used to interact with this JSON-RPC API from within a q session.


## Functionality
* [Block Chain Information](https://github.com/jlucid/qbitcoind/wiki/Block-chain-RPCs)
* [Wallet Management](https://github.com/jlucid/qbitcoind/wiki/Wallet)

## Prerequisites

* kdb+ v3.4 or higher
* [qutil](https://github.com/nugend/qutil) - Required if you wish to load the library using qutil.
  If not, an alternative method is provided. See below.
* A bitcoin node for the library to communicate with. For install instructions see [Running a Full Node]( https://bitcoin.org/en/full-node).
  Library within was written and tested against Bitcoin Core Daemon version v0.16.0.0-g4b4d7eb255

## Installing

If you are using GIT, then execute the following clone command in the directory you want the
code to reside 
```C++   
   git clone git@github.com:jlucid/qbitcoind.git repository
```
Next set the environmental variable QBITCOIND_HOME to where the qbitcoind folder was downloaded to.
```
    $export QBITCOIND_HOME=/home/mygitrepos/qbitcoind/
```
The library can then be loaded directly into a q session using the command below
You can confirm the library is loaded correctly by checking that the .bitcoind namespace is present in the q session.

```C++
    $q $QBITCOIND_HOME/lib/bitcoindLoad.q
    q)key `
    `q`Q`h`j`o`util`bitcoind   // .bitcoind namespace loaded
```

Alternatively, to load the library using the standard [qutil](https://github.com/nugend/qutil) library, follow the steps below.

Create a soft link named "qbitcoind" in your QPATH directory which points to qbitcoind/lib. This will enable standard .utl.require function to find the init.q file and load the library. The namespace contains all the supported API calls.

```C++
    q).utl.require "qbitcoind"
    q)key `
    `q`Q`h`j`o`utl`bitcoind     // .bitcoind namespace loaded
```    


## Configure

### Hostnames

By default, qbitcoind assumes the *bitcoind* software is running on your localhost server on port 8332.
If it is hosted elsewhere, or listening on a different port, then run the following commands to change the default

```C++
    q).bitcoind.initHost["http://remotehost:8332/"]    
```    
### Security: Username and Password


If you are running *bitcoind*, it is recommended to secure the JSON-RPC API with a username and password, as shown below 
```C++
    ./bitcoind -daemon -rpcuser=<user> -rpcpassword=<password>
     alternatively,
    Add username and password credentials to the bitcoin.conf file, sample below
    
    # Maintain a full transaction index, used by the getrawtransaction rpc call.
    txindex=1
    # [rpc]
    # Accept command line and JSON-RPC commands.
    server=1
    rpcuser=myusername
    rpcpassword=mypassword

```
To ensure the authentication credentials are passed during all API calls initialise the username and password credentials using the initPass function
```C++
    q).bitcoind.initPass[username;password]
```
An easy way to confirm that the hostname and authentication credentials are set up correctly, is to execute the **.bitcoind.getblockcount** function which will make a simple request for the current block height.

```C++
    q).bitcoind.getblockcount[]
    result| 522825
    error |
    id    | 0
```

Incorrect username and password credentials will result in an Error message being printed to stderr,
and a dictionary object containing a single key, error. No result key is returned.
```C++
    q).bitcoind.getblockcount[]
    Error: partial token at 1 .Q.hpbit returned:
    error| ""
```
### Security: TLS Support


## Tests


## License

This code is licensed under an MIT license.  See [LICENSE](https://github.com/jlucid/qbitcoind/blob/master/LICENSE) for
the full text.

## Contact

Jeremy Lucid  
jlucid@kx.com  
https://github.com/jlucid  


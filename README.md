# qbitcoind
qbitcoind is a kdb+ wrapper library designed to interact with the Bitcoin blockchain via a bitcoin core node (*bitcoind*) REST APIs. 

## Functionality
* Transactions: 
* Wallet creation:
* Blockchain data extraction:
* Mem pool data extraction:

## Prerequisites

* kdb+ v3.4 or higher
* [qutil](https://github.com/nugend/qutil) - Required if you wish to load the library using qutil.
  If not, an alternative method is provided. See below.
* A bitcoind node for the library to communicate with.  

## Installing

First set the environmental variable QBITCOIND_HOME to where you placed the qbitcoind folder locally.
```
    $export QBITCOIND_HOME=/home/test/library/qbitcoind/
```
To load the qbitcoind library using [qutil](https://github.com/nugend/qutil), follow the steps below.

Create a link named "qbitcoind" in the QPATH directory which points to qbitcoind/lib. This will enable .utl.require function to find the init.q file and load all q files. You can confirm the library is loaded correctly by checking that the .bitcoind namespace is present in the q session. The namespace contains all the supported API calls for the associated application.
```C++
    q).utl.require "qbitcoid"
    q)key `
    `q`Q`h`j`o`util`bitcoind    // .bitcoind namespace loaded
```    
Alternatively, the library can be loaded using the provided bitcoindLoad.q script.
```C++
    $q $QBITCOIND_HOME/lib/qbitcoindLoad.q
    q)key `
    `q`Q`h`j`o`util`bitcoind   
```

## Configure

### Hostnames

By default, qfactom assumes the *bitcoind* application is running on your localhost server.
If it is hosted elsewhere, then run the following commands to change the default

```C++
    q).factomd.initHost["http://remotehost:8083/v2"]       // Change bitcoind host location
```    
### Security: Username and Password

If you are running *bitcoind* with username and password enabled, as shown below 
```C++
    
```
Then run the following command to ensure the authentication credentials are passed during the API calls
```C++
    q).bitcoind.initPass[username;password]
```
An easy way to confirm that the hostname and authentication credentials are set up correctly, is to execute the **.bitcoind.properties** function which will make a simple request for the version properties.

```C++
    q).bitcoind.getblockcount[]
    result| 522825
    error |
    id    | 0
```

Incorrect username and password credentials will result in an error message being printed to stderr,
and a dictionary object with key error being returned.
```C++
    q).factomd.properties[{x}]
    Error: illegal char U at 4 .Q.hpfact returned: 401 Unauthorized.

    error| "401 Unauthorized.\n"
```
### Security: TLS Support


## Tests


## License

This code is licensed under an MIT license.  See [LICENSE](https://github.com/jlucid/qfactom/blob/master/LICENSE) for
the full text.

## Contact

Jeremy Lucid  
jlucid@kx.com  
https://github.com/jlucid  


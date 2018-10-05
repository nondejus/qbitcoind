# qbitcoind
This is a q library which enables communication with a running bitcoin core node and wallet, via http json-rpc messages.
The library supports the vast majority of calls available using bitcoin-cli, see [Supported Functions](https://github.com/jlucid/qbitcoind/wiki/Supported-Functions).

Running a Bitcoin node, *bitcoind*, with the -server argument enables it to function as a http json-rpc server.

## Functionality

For full list of supported RPC calls see [API List](https://github.com/jlucid/qbitcoind/wiki/Supported-Functions), and [Wiki](https://github.com/jlucid/qbitcoind/wiki/Address-Generation)

Functions cover the following areas

* Control Commands
* Block Chain Information
* Network Information
* Wallet Management
* Raw Transaction Generation

## Prerequisites

* kdb+ v3.4 or higher
* [qutil](https://github.com/nugend/qutil) - Required if you wish to load the library using qutil.
  If not, an alternative method is provided. See below.
* A bitcoin node for the library to communicate with. For install instructions see [Running a Full Node]( https://bitcoin.org/en/full-node).
* Library was written and tested against Bitcoin Core Daemon version v0.16.3.0-g49e34e288

## Installing

If you are using GIT, then execute the following clone command in the directory you want the
code to reside 
```C++   
   git clone git@github.com:jlucid/qbitcoind.git repository
```

The library can then be loaded directly into a q session either on startup, using the command below, 

```C++
    $q /my/path/to/bitcoind.q
```

Or by using the \l command while within a session

```C++
    q)\l /my/path/to/bitcoind.q
```

You can confirm the library is loaded correctly by checking that the .bitcoind namespace is present.

```C++
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
````    
alternatively, add username and password credentials to the bitcoin.conf file, sample below
    
```C++    
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
### Required and Optional Arguments

All functions in the API are set up to take either of the following
 * No Arguments  (.bitcoind.getdifficulty)
 * Single or multiple required arguments with no optional arguments (.bitcoind.getreceivedbyaccount)
 * Single or multiple optional arguments with required arguments (.bitcoind.listaccounts)
 * Single or multiple required arguments and Single or multiple optional arguments (.bitcoind.importprivkey)

To handle this, functions are actually composites of the form f:('[{[args] };enlist])

The list of optional and required arguments are given at the top of the function definition, as shown below.
Required arguments can be passed to the function as single elements, but all optional arguments need to
be passed using a dictionary. The use of a dictionary allows the user to specify some or all optional
arguments.

```C++
sendtoaddress:('[{[args]
  requiredArgs:`address`amount;
  optionalArgs:`comment`comment_to`subtractfeefromamount`replaceable`conf_target`estimate_mode;
  input:parseArgs[args;requiredArgs;optionalArgs];
  if[`error~input;:()];
  body:.bitcoind.defaultPayload[];
  body[`method]:"sendtoaddress";
  body[`params]:input;
  .bitcoind.request[body]
  };enlist]
 )
```

Example:

```C++
// No optional arguments, just the two required arguments
q)sendtoaddress["1bNeg..";1.0]   

or

// Two required arguments plus some optional arguments
q)sendtoaddress["1bNeg..";1.0;(`comment`replaceable)!("My 1st transaction";1b)]
```


## License

This code is licensed under an MIT license.  See [LICENSE](https://github.com/jlucid/qbitcoind/blob/master/LICENSE) for
the full text.

## Contact

Jeremy Lucid  
jlucid@kx.com  
https://github.com/jlucid  


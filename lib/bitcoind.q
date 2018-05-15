\d .bitcoind

userpassEnabled:0b
hostLookup:(enlist `bitcoind)!(enlist `$":http://127.0.0.1:8332/")
passLookup:(enlist `bitcoind)!(enlist "");


initHost:{[hostAddr]
  @[`.bitcoind;`hostLookup;,;(!) . enlist@'(`bitcoind;hsym `$hostAddr)];
 }


initPass:{[username;password]
  hostPass:":" sv (username;password);
  @[`.bitcoind;`passLookup;,;(!) . enlist@'(`bitcoind;hostPass)];
  @[`.bitcoind;`userpassEnabled;:;1b];
 }


defaultPayload:{
  (!) . (`jsonrpc`id`method`params;("1.0";0;"";()))
 }


///////////////////////
/// Block Chain RPCs
///////////////////////


getbestblockhash:{[]
  body:defaultPayload[];
  body[`method]:"getbestblockhash";
  .bitcoind.request[body]
 }

getblock:{[blockhash;verbose]
  body:defaultPayload[];
  body[`method]:"getblock";
  body[`params]:`blockhash`verbose!(blockhash;verbose);
  .bitcoind.request[body]
 }

getblockchaininfo:{[]
  body:defaultPayload[];
  body[`method]:"getblockchaininfo";
  .bitcoind.request[body]
 }

getblockcount:{[]
  body:defaultPayload[];
  body[`method]:"getblockcount";
  .bitcoind.request[body]
 }

getblockhash:{[index]
  body:defaultPayload[];
  body[`method]:"getblockhash";
  body[`params]:enlist index;
  .bitcoind.request[body]
 }

getblockheader:{[blockhash;verbose]
  body:defaultPayload[];
  body[`method]:"getblockheader";
  body[`params]:`blockhash`verbose!(blockhash;verbose);
  .bitcoind.request[body]
 }

getblocktemplate:{[template_request]
  body:defaultPayload[];
  body[`method]:"getblocktemplate";
  body[`params]:(enlist `template_request)!(enlist template_request);
  .bitcoind.request[body]
 }

getchaintips:{[]
  body:defaultPayload[];
  body[`method]:"getchaintips";
  .bitcoind.request[body]
 }

getdifficulty:{[]
  body:defaultPayload[];
  body[`method]:"getdifficulty";
  .bitcoind.request[body]
 }

getmempoolancestors:{[txid;verbose]
  body:defaultPayload[];
  body[`method]:"getmempoolancestors";
  body[`params]:`txid`verbose!(txid;verbose);
  .bitcoind.request[body]
 }

getconnectioncounts:{[]
  body:defaultPayload[];
  body[`method]:"getconnectioncount";
  .bitcoind.request[body]
 }

gettransaction:{[tx]
  body:defaultPayload[];
  body[`method]:"gettransaction";
  body[`params]:enlist tx;
  .bitcoind.request[body]
 }

getrawtransaction:{[tx;verbose]
  body:defaultPayload[];
  body[`method]:"getrawtransaction";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[body]
 }

getmemoryinfo:{[]
  body:defaultPayload[];
  body[`method]:"getmemoryinfo";
  .bitcoind.request[body]
 }

getmempoolancestors:{[tx;verbose]
  body:defaultPayload[];
  body[`method]:"getmempoolancestors";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[body]
 }

getmempooldescendants:{[tx;verbose]
  body:defaultPayload[];
  body[`method]:"getmempooldescendants";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[body]
 }

getmempoolentry:{[tx]
  body:defaultPayload[];
  body[`method]:"getmempoolentry";
  .bitcoind.request[body]
 }

getmempoolinfo:{[]
  body:defaultPayload[];
  body[`method]:"getmempoolinfo";
  .bitcoind.request[body]
 }

getnewaddress:{[account]
  body:defaultPayload[];
  body[`method]:"getnewaddress";
  body[`params]:(enlist `account)!(enlist account);
  .bitcoind.request[body]
 }

/// WALLET

importprivkey:{[privateKey;account;rescan] 
  body:defaultPayload[];
  body[`method]:"importprivkey";
  body[`params]:`privkey`label`rescan!(privateKey;account;rescan);
  .bitcoind.request[body]
 }
 
getaddressesbyaccount:{[account] 
  body:.bitcoind.defaultPayload[];
  body[`method]:"getaddressesbyaccount";
  body[`params]:(enlist `account)!(enlist account);  
  .bitcoind.request[body]
 }

 
 
 



\d .


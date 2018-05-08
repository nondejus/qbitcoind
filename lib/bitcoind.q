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
  .bitcoind.request[`bitcoind;body]
 }

getblock:{[blockhash;verbose]
  body:defaultPayload[];
  body[`method]:"getblock";
  body[`params]:`blockhash`verbose!(blockhash;verbose);
  .bitcoind.request[`bitcoind;body]
 }

getblockchaininfo:{[]
  body:defaultPayload[];
  body[`method]:"getblockchaininfo";
  .bitcoind.request[`bitcoind;body]
 }

getblockcount:{[]
  body:defaultPayload[];
  body[`method]:"getblockcount";
  .bitcoind.request[`bitcoind;body]
 }

getblockhash:{[index]
  body:defaultPayload[];
  body[`method]:"getblockhash";
  body[`params]:enlist index;
  .bitcoind.request[`bitcoind;body]
 }

getblockheader:{[blockhash;verbose]
  body:defaultPayload[];
  body[`method]:"getblockheader";
  body[`params]:`blockhash`verbose!(blockhash;verbose);
  .bitcoind.request[`bitcoind;body]
 }

getblocktemplate:{[template_request]
  body:defaultPayload[];
  body[`method]:"getblocktemplate";
  body[`params]:(enlist `template_request)!(enlist template_request);
  .bitcoind.request[`bitcoind;body]
 }

getchaintips:{[]
  body:defaultPayload[];
  body[`method]:"getchaintips";
  .bitcoind.request[`bitcoind;body]
 }

getdifficulty:{[]
  body:defaultPayload[];
  body[`method]:"getdifficulty";
  .bitcoind.request[`bitcoind;body]
 }

getmempoolancestors:{[txid;verbose]
  body:defaultPayload[];
  body[`method]:"getmempoolancestors";
  body[`params]:`txid`verbose!(txid;verbose);
  .bitcoind.request[`bitcoind;body]
 }

getconnectioncounts:{[]
  body:defaultPayload[];
  body[`method]:"getconnectioncount";
  .bitcoind.request[`bitcoind;body]
 }

gettransaction:{[tx]
  body:defaultPayload[];
  body[`method]:"gettransaction";
  body[`params]:enlist tx;
  .bitcoind.request[`bitcoind;body]
 }

getrawtransaction:{[tx;verbose]
  body:defaultPayload[];
  body[`method]:"getrawtransaction";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[`bitcoind;body]
 }

getmemoryinfo:{[]
  body:defaultPayload[];
  body[`method]:"getmemoryinfo";
  .bitcoind.request[`bitcoind;body]
 }

getmempoolancestors:{[tx;verbose]
  body:defaultPayload[];
  body[`method]:"getmempoolancestors";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[`bitcoind;body]
 }

getmempooldescendants:{[tx;verbose]
  body:defaultPayload[];
  body[`method]:"getmempooldescendants";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[`bitcoind;body]
 }

getmempoolentry:{[tx]
  body:defaultPayload[];
  body[`method]:"getmempoolentry";
  .bitcoind.request[`bitcoind;body]
 }

getmempoolinfo:{[]
  body:defaultPayload[];
  body[`method]:"getmempoolinfo";
  .bitcoind.request[`bitcoind;body]
 }

\d .


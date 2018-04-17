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


getblockcount:{[]
  body:defaultPayload[];
  body[`method]:"getblockcount";
  .bitcoind.request[`bitcoind;body]
 }


getblock:{[hash]
  body:defaultPayload[];
  body[`method]:"getblock";
  body[`params]:`blockhash`verbose!(hash;2);
  .bitcoind.request[`bitcoind;body]
 }

gettransaction:{[tx]
  body:defaultPayload[];
  body[`method]:"gettransaction";
  body[`params]:enlist tx;
  .bitcoind.request[`bitcoind;body]
 }

getblockhash:{[index]
  body:defaultPayload[];
  body[`method]:"getblockhash";
  body[`params]:enlist index;
  .bitcoind.request[`bitcoind;body]
 }

getrawtransaction:{[tx]
  body:defaultPayload[];
  body[`method]:"getrawtransaction";
  body[`params]:`txid`verbose!(tx;1b);
  .bitcoind.request[`bitcoind;body]
 }


\d .


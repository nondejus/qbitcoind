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

abandontransaction:{[txid]
  body:defaultPayload[];
  body[`method]:"abandontransaction";
  body[`params]:(enlist `txid)!(enlist txid);
  .bitcoind.request[body]
 }

addwitnessaddress:{[address]
  body:defaultPayload[];
  body[`method]:"addwitnessaddress";
  body[`params]:(enlist `address)!(enlist address);
  .bitcoind.request[body]
 }

addmultisigaddress:{[nrequired;Keys;account] 
  body:.bitcoind.defaultPayload[];  
  body[`method]:"addmultisigaddress";
  body[`params]:(`nrequired`keys`account)!(nrequired;Keys;account);
  .bitcoind.request[body]
 }


backupwallet:{[destination]
  body:defaultPayload[];
  body[`method]:"backupwallet";
  body[`params]:(enlist `destination)!(enlist destination);
  .bitcoind.request[body]
 }


bumpfee:{[txid]
  body:defaultPayload[];
  body[`method]:"bumpfee";
  body[`params]:(enlist `txid)!(enlist txid);
  .bitcoind.request[body]
 }


getbalance:{[account]
  body:defaultPayload[];
  body[`method]:"getbalance";
  body[`params]:(enlist `account)!(enlist account);
  .bitcoind.request[body]
 }


addnode:{[hostandport;command]
  body:defaultPayload[];
  body[`method]:"addnode";
  body[`params]:(`node`command)!(hostandport;command);
  .bitcoind.request[body]
 }


getnetworkinfo:{[]
  body:defaultPayload[];
  body[`method]:"getnetworkinfo";
  .bitcoind.request[body]
 }

listbanned:{[]
  body:defaultPayload[];
  body[`method]:"listbanned";
  .bitcoind.request[body]
 }

getpeerinfo:{[]
  body:defaultPayload[];
  body[`method]:"getpeerinfo";
  .bitcoind.request[body]
 }


getunconfirmedbalance:{[]
  body:defaultPayload[];
  body[`method]:"getunconfirmedbalance";
  .bitcoind.request[body]
 }


getwalletinfo:{[]
  body:defaultPayload[];
  body[`method]:"getwalletinfo";
  .bitcoind.request[body]
 }


getaddednodeinfo:{[dns]
  body:defaultPayload[];
  body[`method]:"getaddednodeinfo";
  .bitcoind.request[body]
 }

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

getmempoolentry:{[txid]
  body:defaultPayload[];
  body[`method]:"getmempoolentry";
  body[`params]:(enlist `txid)!(enlist txid);
  .bitcoind.request[body]
 }

getmempoolinfo:{[]
  body:defaultPayload[];
  body[`method]:"getmempoolinfo";
  .bitcoind.request[body]
 }


getrawmempool:{[]
  body:defaultPayload[];
  body[`method]:"getrawmempool";
  .bitcoind.request[body]
 }


gettxout:{[txid;index]
  body:defaultPayload[];
  body[`method]:"gettxout";
  body[`params]:(`txid`n)!(txid;index);
  .bitcoind.request[body]
 }

gettxoutproof:{[txids;blockhash] 
  body:defaultPayload[]; 
  body[`method]:"gettxoutproof"; 
  body[`params]:(`txids`blockhash)!(txids;blockhash); 
  .bitcoind.request[body] 
 }

gettxoutsetinfo:{[]
  body:defaultPayload[];
  body[`method]:"gettxoutsetinfo";
  .bitcoind.request[body]
 }


preciousblock:{[blockhash]
  body:defaultPayload[];
  body[`method]:"preciousblock";
  body[`params]:(enlist `blockhash)!(enlist blockhash);
  .bitcoind.request[body]
 }


pruneblockchain:{[height]
  body:defaultPayload[];
  body[`method]:"pruneblockchain";
  body[`params]:(enlist `height)!(enlist height); 
  .bitcoind.request[body]
 }


verifychain:{[checklevel;nblocks]
  body:defaultPayload[];
  body[`method]:"verifychain";
  body[`params]:(`checklevel`nblocks)!(checklevel;nblocks);
  .bitcoind.request[body]
 }


gettxoutproof:{[txid;hash]
  body:defaultPayload[];
  body[`method]:"gettxoutproof";
  body[`params]:(`txid`hash)!(txid;hash);
  .bitcoind.request[body]
 }

getaccount:{[address]
  body:defaultPayload[];
  body[`method]:"getaccount";
  body[`params]:(enlist `address)!(enlist address);
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


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


abandontransaction:{[txid]
  body:.bitcoind.defaultPayload[];
  body[`method]:"abandontransaction";
  body[`params]:(enlist `txid)!(enlist txid);
  .bitcoind.request[body]
 }


addmultisigaddress:{[nrequired;Keys;account;address_type]
  body:.bitcoind.defaultPayload[];
  body[`method]:"addmultisigaddress";
  body[`params]:(`nrequired`keys`account`address_type)!(nrequired;Keys;account;address_type);
  .bitcoind.request[body]
 }


addnode:{[hostandport;command]
  body:.bitcoind.defaultPayload[];
  body[`method]:"addnode";
  body[`params]:(`node`command)!(hostandport;command);
  .bitcoind.request[body]
 }


addwitnessaddress:{[address]
  body:.bitcoind.defaultPayload[];
  body[`method]:"addwitnessaddress";
  body[`params]:(enlist `address)!(enlist address);
  .bitcoind.request[body]
 }


backupwallet:{[destination]
  body:.bitcoind.defaultPayload[];
  body[`method]:"backupwallet";
  body[`params]:(enlist `destination)!(enlist destination);
  .bitcoind.request[body]
 }


bumpfee:{[txid]
  body:.bitcoind.defaultPayload[];
  body[`method]:"bumpfee";
  body[`params]:(enlist `txid)!(enlist txid);
  .bitcoind.request[body]
 }


clearbanned:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"clearbanned";
  .bitcoind.request[body]
 }


createrawtransaction:{[inputs;outputs;locktime;replaceable]
  body:.bitcoind.defaultPayload[];
  body[`method]:"createrawtransaction";
  body[`params]:`inputs`outputs`locktime`replaceable!(inputs;outputs;locktime;replaceable);
  .bitcoind.request[body]
 }


decoderawtransaction:{[hexstring;iswitness]
  body:.bitcoind.defaultPayload[];
  body[`method]:"decoderawtransaction";
  body[`params]:`hexstring`iswitness!(hexstring;iswitness);
  .bitcoind.request[body]
 }


decodescript:{[hexstring]
  body:.bitcoind.defaultPayload[];
  body[`method]:"decodescript";
  body[`params]:(enlist `hexstring)!(enlist hexstring);
  .bitcoind.request[body]
 }


disconnectnode:{[hostandport]
  body:.bitcoind.defaultPayload[];
  body[`method]:"disconnectnode";
  body[`params]:(enlist `address)!(enlist hostandport);
  .bitcoind.request[body]
 }


dumpprivkey:{[address]
  body:.bitcoind.defaultPayload[];
  body[`method]:"dumpprivkey";
  body[`params]:(enlist `address)!(enlist address);
  .bitcoind.request[body]
 }


dumpwallet:{[filename]
  body:.bitcoind.defaultPayload[];
  body[`method]:"dumpwallet";
  body[`params]:(enlist `filename)!(enlist filename);
  .bitcoind.request[body]
 }



encryptwallet:{[passphrase]
  body:.bitcoind.defaultPayload[];
  body[`method]:"encryptwallet";
  body[`params]:(enlist `passphrase)!(enlist passphrase);
  .bitcoind.request[body]
 }


getaccount:{[address]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getaccount";
  body[`params]:(enlist `address)!(enlist address);
  .bitcoind.request[body]
 }


getaddednodeinfo:{[dns]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getaddednodeinfo";
  .bitcoind.request[body]
 }


getaddressesbyaccount:{[account]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getaddressesbyaccount";
  body[`params]:(enlist `account)!(enlist account);
  .bitcoind.request[body]
 }


getbalance:{[account]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getbalance";
  body[`params]:(enlist `account)!(enlist account);
  .bitcoind.request[body]
 }


getbestblockhash:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getbestblockhash";
  .bitcoind.request[body]
 }


getblock:('[{[args]
  supportedArgs:(`blockhash`verbose);
  optionalDefaults:(enlist `verbose)!(enlist 1b);   
  if[(count supportedArgs)<count args;-1"Too Many input arguments";:()];   
  input:supportedArgs xcols optionalDefaults,(!) . (numInputs:count args)#'(supportedArgs;args); 
  body:.bitcoind.defaultPayload[];
  body[`method]:"getblock";
  body[`params]:input;
  .bitcoind.request[body]
  };enlist]
 )


getblockchaininfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getblockchaininfo";
  .bitcoind.request[body]
 }


getblockcount:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getblockcount";
  .bitcoind.request[body]
 }


getblockhash:{[index]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getblockhash";
  body[`params]:enlist index;
  .bitcoind.request[body]
 }


getblockheader:('[{[args]
  supportedArgs:(`blockhash`verbose);
  optionalDefaults:(enlist `verbose)!(enlist 1b);
  if[(count supportedArgs)<count args;-1"Too Many input arguments";:()];
  input:supportedArgs xcols optionalDefaults,(!) . (numInputs:count args)#'(supportedArgs;args);
  body:.bitcoind.defaultPayload[];
  body[`method]:"getblockheader";
  body[`params]:input;
  .bitcoind.request[body]
  };enlist]
 )


getblocktemplate:{[template_request]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getblocktemplate";
  body[`params]:(enlist `template_request)!(enlist template_request);
  .bitcoind.request[body]
 }


getchaintips:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getchaintips";
  .bitcoind.request[body]
 }


getconnectioncount:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getconnectioncount";
  .bitcoind.request[body]
 }


getdifficulty:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getdifficulty";
  .bitcoind.request[body]
 }


getmemoryinfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getmemoryinfo";
  .bitcoind.request[body]
 }


getmempoolancestors:{[tx;verbose]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getmempoolancestors";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[body]
 }


getmempooldescendants:{[tx;verbose]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getmempooldescendants";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[body]
 }


getmempoolentry:{[txid]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getmempoolentry";
  body[`params]:(enlist `txid)!(enlist txid);
  .bitcoind.request[body]
 }


getmempoolinfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getmempoolinfo";
  .bitcoind.request[body]
 }


getnettotals:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getnettotals";
  .bitcoind.request[body]
 }


getnetworkinfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getnetworkinfo";
  .bitcoind.request[body]
 }


getnewaddress:{[account;address_type]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getnewaddress";
  body[`params]:(`account`address_type)!(account;address_type);
  .bitcoind.request[body]
 }


getpeerinfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getpeerinfo";
  .bitcoind.request[body]
 }


getrawchangeaddress:{[address_type]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getrawchangeaddress";
  body[`params]:(enlist `address_type)!(enlist address_type);
  .bitcoind.request[body]
 }


getrawmempool:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getrawmempool";
  .bitcoind.request[body]
 }


getrawtransaction:{[tx;verbose]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getrawtransaction";
  body[`params]:`txid`verbose!(tx;verbose);
  .bitcoind.request[body]
 }


gettransaction:{[tx]
  body:.bitcoind.defaultPayload[];
  body[`method]:"gettransaction";
  body[`params]:enlist tx;
  .bitcoind.request[body]
 }


gettxout:{[txid;index]
  body:.bitcoind.defaultPayload[];
  body[`method]:"gettxout";
  body[`params]:(`txid`n)!(txid;index);
  .bitcoind.request[body]
 }


gettxoutproof:{[txid;hash]
  body:.bitcoind.defaultPayload[];
  body[`method]:"gettxoutproof";
  body[`params]:(`txid`hash)!(txid;hash);
  .bitcoind.request[body]
 }


gettxoutsetinfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"gettxoutsetinfo";
  .bitcoind.request[body]
 }


getunconfirmedbalance:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getunconfirmedbalance";
  .bitcoind.request[body]
 }


getwalletinfo:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"getwalletinfo";
  .bitcoind.request[body]
 }


help:{[command]
  body:.bitcoind.defaultPayload[];
  body[`method]:"help";
  body[`params]:(enlist `command)!(enlist command);
  .bitcoind.request[body]
 }


importaddress:{[address;label;rescan;p2sh]
  body:.bitcoind.defaultPayload[];
  body[`method]:"importaddress";
  body[`params]:`address`label`rescan`p2sh!(address;label;rescan;p2sh);
  .bitcoind.request[body]
 }


importprivkey:{[privateKey;account;rescan]
  body:.bitcoind.defaultPayload[];
  body[`method]:"importprivkey";
  body[`params]:`privkey`label`rescan!(privateKey;account;rescan);
  .bitcoind.request[body]
 }


listaccounts:{[minconf;include_watchonly]
  body:.bitcoind.defaultPayload[];
  body[`method]:"listaccounts";
  body[`params]:`minconf`include_watchonly!(minconf;include_watchonly);
  .bitcoind.request[body]
 }


listbanned:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"listbanned";
  .bitcoind.request[body]
 }


listunspent:{[minconf;maxconf;addresses]
  body:.bitcoind.defaultPayload[];
  body[`method]:"listunspent";
  body[`params]:`minconf`maxconf`addresses!(minconf;maxconf;addresses);
  .bitcoind.request[body]
 }


ping:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"ping";
  .bitcoind.request[body]
 }


preciousblock:{[blockhash]
  body:.bitcoind.defaultPayload[];
  body[`method]:"preciousblock";
  body[`params]:(enlist `blockhash)!(enlist blockhash);
  .bitcoind.request[body]
 }


pruneblockchain:{[height]
  body:.bitcoind.defaultPayload[];
  body[`method]:"pruneblockchain";
  body[`params]:(enlist `height)!(enlist height);
  .bitcoind.request[body]
 }


sendrawtransaction:{[hexstring;allowhighfees]
  body:.bitcoind.defaultPayload[];
  body[`method]:"sendrawtransaction";
  body[`params]:(`hexstring`allowhighfees)!(hexstring;allowhighfees);
  .bitcoind.request[body]
 }


setban:{[subnet;command;bantime;absolute]
  body:.bitcoind.defaultPayload[];
  body[`method]:"setban";
  body[`params]:`subnet`command`bantime`absolute!(subnet;command;bantime;absolute);
  .bitcoind.request[body]
 }


setnetworkactive:{[state]
  body:.bitcoind.defaultPayload[];
  body[`method]:"state";
  body[`params]:(enlist `state)!(enlist state);
  .bitcoind.request[body]
 }


signmessage:{[address;message]
  body:.bitcoind.defaultPayload[];
  body[`method]:"signmessage";
  body[`params]:(`address`message)!(address;message);
  .bitcoind.request[body]
 }


signrawtransaction:{[hexstring;prevtxs;privkeys;sighashtype]
  body:.bitcoind.defaultPayload[];
  body[`method]:"signrawtransaction";
  body[`params]:`hexstring`prevtxs`privkeys`sighashtype!(hexstring;prevtxs;privkeys;sighashtype);
  .bitcoind.request[body]
 }


stop:{[]
  body:.bitcoind.defaultPayload[];
  body[`method]:"stop";
  .bitcoind.request[body]
 }


walletpassphrase:{[passphrase;timeout]
  body:.bitcoind.defaultPayload[];
  body[`method]:"walletpassphrase";
  body[`params]:(`passphrase`timeout)!(passphrase;timeout);
  .bitcoind.request[body]
 }


verifychain:{[checklevel;nblocks]
  body:.bitcoind.defaultPayload[];
  body[`method]:"verifychain";
  body[`params]:(`checklevel`nblocks)!(checklevel;nblocks);
  .bitcoind.request[body]
 }


verifytxoutproof:{[proof]
  body:.bitcoind.defaultPayload[];
  body[`method]:"verifytxoutproof";
  body[`params]:(enlist `proof)!(enlist proof);
  .bitcoind.request[body]
 }


verifymessage:{[address;signature;message] 
  body:.bitcoind.defaultPayload[];
  body[`method]:"verifymessage";
  body[`params]:(address;signature;message);
  .bitcoind.request[body]
 }


\d .

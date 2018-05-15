\d .bitcoind


request:{[body]
  hostName:.bitcoind.hostLookup[`bitcoind];
  credentials:.bitcoind.util[`base64Encode] .bitcoind.passLookup[`bitcoind];
  header:"Authorization: Basic ",credentials," ",";Content-Type: text/plain";
  out:@[.Q.hpbit[hostName;header;];.j.j body;{[err] -2 "Error: qRequest: ",err;:.j.j (enlist `error)!(enlist err)}];
  @[.j.k;;{[out;err] -2 "Error: ",err," .Q.hpbit returned: ",out;:(enlist `error)!(enlist out)}[out;]] out 
 }

\d .

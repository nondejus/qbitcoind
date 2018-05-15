loadFile:{value "\\l ",x}
$[not ""~QBITCOIND_HOME:getenv[`QBITCOIND_HOME];
  [
   loadFile QBITCOIND_HOME,"/lib/q.k";
   loadFile QBITCOIND_HOME,"/lib/requests.q";
   loadFile QBITCOIND_HOME,"/lib/utilities.q";
   loadFile QBITCOIND_HOME,"/lib/bitcoind.q";
  ];
  [
   -2 "Error -> Environmental variable QBITCOIND_HOME not set";
   exit 1
  ]
 ];

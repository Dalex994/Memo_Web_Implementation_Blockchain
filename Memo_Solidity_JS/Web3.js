/// Memo for differents types of things to implement Web3.js and blockchain ETH in Front-end


// For Metamask implementation
window.addEventListener('load', function() {

    // Checking if Web3 has been injected by the browser (Mist/MetaMask)
    if (typeof web3 !== 'undefined') {
      // Use Mist/MetaMask's provider
      web3js = new Web3(web3.currentProvider);
    } else {
      // Handle the case where the user doesn't have web3. Probably
      // show them a message telling them to install MetaMask in
      // order to use our app.
    }
  
    // Now you can start your app & access web3js freely:
    startApp()
  
  })


  // Instanciation of myContract
var myContract = new web3js.eth.Contract(myABI, myContractAddress);

var cryptoObject;
// Can create a new instance and start Dapp with both address and ABI, and make sure the account is not changed and auto-refresh
function startApp() {
    var cryptoObjectsAddress = "YOUR_CONTRACT_ADDRESS";
    cryptoObjects = new web3js.eth.Contract(cryptoObjectsABI, cryptoObjectAddress);
}

function getObjectDetails(id) {
    return cryptoObjects.methods.Objects(id).call()
}

var accountInterval = setInterval(function() {
  // Verify if the account has changed
  if (web3.eth.accounts[0] !== userAccount) {
    userAccount = web3.eth.accounts[0];
    // Call a function to update the interface with the new account every 100ms
    updateInterface();
  }
}, 100);

// Examples of data collect from Cryptozombies.io
// We takes the informations from the zombies from our contract. We resend an object `zombie`
getZombieDetails(id)
.then(function(zombie) {
  // By using the "template literals" from ES6 to inject the variables in theHTML.
  // We add each to our div #zombies
  $("#zombies").append(`<div class="zombie">
    <ul>
      <li>Name: ${zombie.name}</li>
      <li>DNA: ${zombie.dna}</li>
      <li>Level: ${zombie.level}</li>
      <li>Wins: ${zombie.winCount}</li>
      <li>Losses: ${zombie.lossCount}</li>
      <li>Ready Time: ${zombie.readyTime}</li>
    </ul>
  </div>`);
});

function createRandomZombie(name) {
    // It takes sometimes, we update the interface to
    // signal at the user that the transaction has been sended
    $("#txStatus").text("Creating new zombie on the blockchain. This may take a while...");
    // We send the tx to our contract :
    return cryptoZombies.methods.createRandomZombie(name)
    .send({ from: userAccount })
    .on("receipt", function(receipt) {
      $("#txStatus").text("Successfully created " + name + "!");
      // the transaction is accepted on the blokchain, we must update the interface
      getZombiesByOwner(userAccount).then(displayZombies);
    })
    .on("error", function(error) {
      // If the transaction failed, user is called
      $("#txStatus").text(error);
    });
  }

  // Convert 1 ETH in Wei
web3js.utils.toWei("1", "ether");
// Set up the gas fees of level up in ETH
cryptoZombies.methods.levelUp(zombieId)
.send({ from: userAccount, value: web3js.utils.toWei("0.001", "ether") })

// Call of function
cryptoZombies.events.NewZombie()
.on("data", function(event) {
  let zombie = event.returnValues;
  // We can access 3 values of return of this event with the object `event.returnValues` :
  console.log("A new zombie was born!", zombie.zombieId, zombie.name, zombie.dna);
}).on("error", console.error);

// We use `filter` to only start this code when `_to` equal as `userAccount`
cryptoZombies.events.Transfer({ filter: { _to: userAccount } })
.on("data", function(event) {
  let data = event.returnValues;
  // The actual user has reçeived a zombie !
  // Do something to update the interface
}).on("error", console.error);

cryptoZombies.getPastEvents("NewZombie", { fromBlock: 0, toBlock: "latest" })
.then(function(events) {
  // `events` is a objects board `event` for whom we have to iterate, like we had already do this
  // this code will generates a list of all the zombies collected
});
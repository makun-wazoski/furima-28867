// function price() {
//   // document.getElementById("item_price").value = "";
//   // document.addEventListener("DOMContentLoaded", function() { 
//     document.getElementById("item-price").addEventListener("input", function(){
//     let price = document.getElementById("item-price").value;
//     let value = price / 10;
//     document.getElementById('add-tax-price').textContent = Math.floor(value);

//     let value2 = price * 0.9;
//     document.getElementById('profit').textContent = Math.floor(value2);

//     // value.value = "";
//     // value2.value = "";

//       // add-tax-price.insertAdjacentHTML("afterend", HTML);
//     // function(){
//     //   document.getElementById("add-tax-price")
//     // }
//     // console.log(price);
//     // }
//     // console.log(price);
// // })
// })
// }

window.addEventListener("turbolinks:load", () => {

  const path = location.pathname
  
  if (path === "/items/new" || path === "/items") {
    document.getElementById("item-price").addEventListener("input", function(){
      let price = document.getElementById("item-price").value;
      let value = price / 10;
      document.getElementById('add-tax-price').textContent = Math.floor(value);
  
      let value2 = price * 0.9;
      document.getElementById('profit').textContent = Math.floor(value2);
    })
  } else {
    return false;
  }

});




// function price2() {
//   // document.getElementById("item_price").value = "";
//   document.getElementById("item-price").addEventListener("input", function(){
//     let price = document.getElementById("item-price").value;
//     let value = price * 0.9;

//     document.getElementById('profit').textContent = Math.floor(value);

    
//       // add-tax-price.insertAdjacentHTML("afterend", HTML);
//     // function(){
//     //   document.getElementById("add-tax-price")
//     // }
//     console.log(price)
// })
// }




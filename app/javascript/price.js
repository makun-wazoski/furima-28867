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
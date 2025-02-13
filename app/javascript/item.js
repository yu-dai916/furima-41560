function item (){
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);

priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10)
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - (inputValue / 10));
})
};
window.addEventListener('turbo:load', item);
window.addEventListener("turbo:render", item);
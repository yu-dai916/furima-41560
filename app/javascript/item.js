function item (){
  const priceInput = document.getElementById("item-price");

priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
const addTaxDom = document.getElementById("add-tax-price");
 const tax = Math.floor(inputValue / 10)
    addTaxDom.innerHTML = tax;

    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax;
})
};
window.addEventListener('turbo:load', item);
window.addEventListener("turbo:render", item);
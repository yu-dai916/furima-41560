function item (){
  console.log("ok")
  console.log("非同期投稿を実装");
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
})
};
window.addEventListener('turbo:load', item);
window.addEventListener("turbo:render", price);

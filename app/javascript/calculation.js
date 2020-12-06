function calculation() {

  const item_price = document.getElementById('item-price')
  const profit = document.getElementById('profit')

  item_price.addEventListener('input', () => { 
    let tax = Math.floor(item_price.value * 0.1)
    const add_tax_price = document.getElementById('add-tax-price')
    add_tax_price.innerText = tax

    let sales = item_price.value - tax 
    profit.innerText = sales
  });
}
  
window.addEventListener('load',calculation)
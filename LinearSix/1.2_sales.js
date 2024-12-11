function orderSalesByTotal(sales) {
    const salesWithTotal = sales.map(sale => ({
        ...sale, // copy sales properties
        Total: sale.amount * sale.quantity // calculate Total
    }));
    
    return salesWithTotal.sort((a, b) => b.Total - a.Total);
}

const sales = [
    { amount: 10000, quantity: 10},
    { amount: 5000, quantity: 15 },
    { amount: 2000, quantity: 20 }
];

console.log('Original Sales:', sales);
const orderedSales = orderSalesByTotal(sales);
console.log('Ordered Sales:', orderedSales); 

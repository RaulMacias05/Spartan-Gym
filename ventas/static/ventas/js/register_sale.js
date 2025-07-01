const Products = {
    elements: document.querySelectorAll('.product'),

    init() {
        this.elements.forEach(product => {
            const id = product.dataset.id;
            const price = parseFloat(product.dataset.price);
            const name = product.querySelector('h3').textContent;

            const btnAdd = product.querySelector('.add');
            const btnRemove = product.querySelector('.remove');
            const quantity = product.querySelector('.quantity');

            btnAdd.addEventListener('click', () => {
                Cart.addProduct(id, name, price);
                quantity.textContent = Cart.items.find(p => p.id === id).quantity;
                SaleSummary.update();
            });

            btnRemove.addEventListener('click', () => {
                Cart.removeProduct(id);
                const item = Cart.items.find(p => p.id === id);
                quantity.textContent = item ? item.quantity : 0;
                SaleSummary.update();
            });
        });
    },

    resetQuantities() {
        this.elements.forEach(product => {
            product.querySelector('.quantity').textContent = 0;
        });
    }
};

const Cart = {
    items: [],
    total: 0,

    addProduct(id, name, price) {
        let item = this.items.find(p => p.id === id);
        if (item) {
            item.quantity += 1;
        } else {
            this.items.push({ id, name, price, quantity: 1});
        }
        this.updateTotal();
    },

    removeProduct(id) {
        let item = this.items.find(p => p.id === id);
        if (item) {
            item.quantity -= 1;
            if (item.quantity <= 0) {
                this.items = this.items.filter(p => p.id !== id);
            }
            this.updateTotal();
        }
    },

    updateTotal() {
        this.total = this.items.reduce((sum, p) => sum + p.price * p.quantity, 0);
    },

    clear() {
        this.items = [];
        this.total = 0;
    }
};

const Sale = {
    send() {

    },

    reset() {
        Cart.clear();
        SaleModal.reset();
        SaleSummary.update();
        Products.resetQuantities();
    }
};

const SaleSummary = {
    elements: {
        container: document.getElementById('saleSummary'),
        btnRegisterSale: document.getElementById('btnRegisterSale'),
        totalAmount: document.getElementById('totalAmount'),
    },

    show() {
        this.elements.container.style.marginBottom = '0px';
    },
    
    hide() {
        this.elements.container.style.marginBottom = '-100px';
    },

    update() {
        this.elements.totalAmount.textContent = Cart.total.toFixed(2);
        this.elements.btnRegisterSale.disabled = Cart.items.length === 0;

        if (Cart.items.length > 0) {
            SaleSummary.show();
        } else {
            SaleSummary.hide();
        }
    },
};

const SaleModal = {
    elements: {
        fade: document.getElementById('saleModalFade'),
        total: document.getElementById('saleModalTotal'),
        form: document.getElementById('saleModalForm'),
        confirmSale: document.getElementById('confirmSale'),
        cancelSale: document.getElementById('cancelSale'),
        paymentMethod: document.getElementById('id_metodo_pago'),
    },

    amountPaid: {
        elements: {
            container: document.getElementById('amountPaidCont'),
            self: document.getElementById('id_monto_pagado'),
        },

        show() {
            this.elements.container.style.display = 'block';
        },
        
        hide() {
            this.elements.container.style.display = 'none';
        },

        reset(){
            this.hide();
            this.elements.self.value = '';
        }
    },

    change: {
        elements: {
            container: document.getElementById('changeCont'),
            self: document.getElementById('change'),
        },

        update() {
            this.elements.self.innerText = SaleModal.amountPaid.elements.self.value - Cart.total;
        },

        show() {
            this.update();
            this.elements.container.style.display = 'block';
        },

        hide() {
            this.update();
            this.elements.container.style.display = 'none';
        },
    },

    update() {
        this.elements.total.textContent = Cart.total.toFixed(2);
    },

    show() {
        this.update();
        this.elements.fade.style.display = 'flex';
    },

    hide() {
        this.update();
        this.elements.fade.style.display = 'none';
    },

    reset() {
        this.hide();
        this.update();
        this.elements.paymentMethod.value = '';
        this.amountPaid.reset();
        this.change.hide();
    },

    toggleAmountPaid() {
        if (this.elements.paymentMethod.value !== 'efectivo') {
            this.amountPaid.hide();
        } else {
            this.amountPaid.show();
        }
    },

    toggleChange() {
        if (this.amountPaid.elements.self.value === '') {
            this.change.hide();
        } else {
            this.change.show();
        }
    },
};

const SearchBar = {
    elements: {
        searchInput: document.getElementById('searchBar'),
    },
    
    filter() {
        const searchTerm = this.elements.searchInput.value.toLowerCase();
        Products.elements.forEach(product => {
            const name = product.querySelector("h3").textContent.toLowerCase();
            product.style.display = name.includes(searchTerm) ? "block" : "none";
        });
    }
}

function init() {
    Products.init();

    SearchBar.elements.searchInput.addEventListener('input', () => {SearchBar.filter()})

    SaleSummary.elements.btnRegisterSale.addEventListener('click',  () => {SaleModal.show()});

    SaleModal.elements.paymentMethod.addEventListener('change', () => {SaleModal.toggleAmountPaid()});

    SaleModal.amountPaid.elements.self.addEventListener('input', () => {SaleModal.toggleChange()});

    SaleModal.elements.confirmSale.addEventListener('click', () => {});

    SaleModal.elements.cancelSale.addEventListener('click', () => {Sale.reset()});
};

init();
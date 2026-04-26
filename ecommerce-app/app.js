const products = [
  { id: 1, name: "Shoes", price: 1000, description: "Comfortable daily wear shoes." },
  { id: 2, name: "Watch", price: 2000, description: "Classic analog watch." },
  { id: 3, name: "Bag", price: 1500, description: "Durable everyday backpack." },
  { id: 4, name: "Headphones", price: 1200, description: "Lightweight wired headphones." }
];

const productsContainer = document.getElementById("products");
const cartCount = document.getElementById("cart-count");
const cartTotal = document.getElementById("cart-total");
const clearCartButton = document.getElementById("clear-cart");

let cart = JSON.parse(localStorage.getItem("shopeasy-cart") || "[]");

function saveCart() {
  localStorage.setItem("shopeasy-cart", JSON.stringify(cart));
}

function updateCartSummary() {
  const total = cart.reduce((sum, item) => sum + item.price, 0);
  cartCount.textContent = String(cart.length);
  cartTotal.textContent = String(total);
}

function addToCart(productId) {
  const product = products.find((item) => item.id === productId);

  if (!product) {
    return;
  }

  cart.push(product);
  saveCart();
  updateCartSummary();
}

function renderProducts() {
  productsContainer.innerHTML = products
    .map((product) => `
      <article class="product">
        <div>
          <h2>${product.name}</h2>
          <p>${product.description}</p>
        </div>
        <div class="price">Rs. ${product.price}</div>
        <button type="button" data-product-id="${product.id}">Add to Cart</button>
      </article>
    `)
    .join("");
}

productsContainer.addEventListener("click", (event) => {
  const button = event.target.closest("button[data-product-id]");

  if (!button) {
    return;
  }

  addToCart(Number(button.dataset.productId));
});

clearCartButton.addEventListener("click", () => {
  cart = [];
  saveCart();
  updateCartSummary();
});

renderProducts();
updateCartSummary();

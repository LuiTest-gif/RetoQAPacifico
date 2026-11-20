import { When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';

import { page } from '../support/hooks';
import { ProductsPage } from '../pages/ProductsPage';

let productsPage: ProductsPage;

When('agrego el primer producto al carrito', async () => {
  productsPage = new ProductsPage(page);

  await productsPage.addFirstProductToCart();
});

Then('el contador del carrito debería mostrar {string}', async (quantity: string) => {
  await expect(productsPage.cartBadge).toHaveText(quantity);
});

When('abro el carrito de compras', async () => {
  await productsPage.goToCart();
});

Then('debería visualizar el carrito', async () => {
  await expect(productsPage.cartTitle).toHaveText('Your Cart');
});

Then('debería visualizar el producto {string} en el carrito', async (productName: string) => {
  await expect(productsPage.productInCart(productName)).toBeVisible();
});

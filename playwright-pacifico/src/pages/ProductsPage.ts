import { Page, Locator } from '@playwright/test';

export class ProductsPage {
  readonly page: Page;
  readonly productsTitle: Locator;
  readonly shoppingCart: Locator;
  readonly firstProductAddButton: Locator;
  readonly cartBadge: Locator;
  readonly cartTitle: Locator;
  readonly cartProductNames: Locator;

  constructor(page: Page) {
    this.page = page;

    this.productsTitle = page.getByText('Products', { exact: true });
    this.shoppingCart = page.getByTestId('shopping-cart-link');
    this.firstProductAddButton = page.getByTestId('add-to-cart-sauce-labs-backpack');
    this.cartBadge = page.getByTestId('shopping-cart-badge');
    this.cartTitle = page.getByText('Your Cart', { exact: true });
    this.cartProductNames = page.getByTestId('inventory-item-name');
  }

  async addFirstProductToCart() {
    await this.firstProductAddButton.click();
  }

  async goToCart() {
    await this.shoppingCart.click();
  }

  productInCart(productName: string) {
    return this.cartProductNames.filter({ hasText: productName });
  }
}

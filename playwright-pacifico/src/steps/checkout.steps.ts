import { When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';

import { page } from '../support/hooks';
import { CheckoutPage } from '../pages/CheckoutPage';

let checkoutPage: CheckoutPage;

When('ingreso al proceso de checkout', async () => {
  checkoutPage = new CheckoutPage(page);

  await checkoutPage.clickCheckout();
});

When('ingreso mis datos de compra', async () => {
  await checkoutPage.fillCustomerInformation(
    'Luis',
    'Huamani',
    '13001'
  );
});

When('continúo con el resumen de la compra', async () => {
  await checkoutPage.clickContinue();
});

When('finalizo la compra', async () => {
  await checkoutPage.clickFinish();
});

Then('debería visualizar la confirmación de compra', async () => {
  await expect(checkoutPage.confirmationMessage)
    .toHaveText('Thank you for your order!');
});

Then('debería visualizar un mensaje de error en el checkout', async () => {
  await expect(checkoutPage.checkoutErrorMessage)
    .toHaveText('Error: First Name is required');
});

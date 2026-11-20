import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';

import { page } from '../support/hooks';
import { LoginPage } from '../pages/LoginPage';

let loginPage: LoginPage;

Given('que estoy en la página de login de Sauce Demo', async () => {
  loginPage = new LoginPage(page);

  await loginPage.navigate();
});

When('ingreso el usuario {string}', async (username: string) => {
  await loginPage.enterUsername(username);
});

When('ingreso la contraseña {string}', async (password: string) => {
  await loginPage.enterPassword(password);
});

When('hago clic en el botón de login', async () => {
  await loginPage.clickLogin();
});

Then('debería visualizar la página de productos', async () => {
  await expect(page).toHaveURL(/inventory.html/);
});

Then('debería visualizar un mensaje de usuario bloqueado', async () => {
  await expect(loginPage.errorMessage)
    .toHaveText('Epic sadface: Sorry, this user has been locked out.');
});

Then('debería visualizar un mensaje de credenciales inválidas', async () => {
  await expect(loginPage.errorMessage)
    .toHaveText('Epic sadface: Username and password do not match any user in this service');
});

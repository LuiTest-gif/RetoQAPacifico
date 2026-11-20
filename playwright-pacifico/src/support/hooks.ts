import {
  BeforeAll,
  Before,
  After,
  AfterAll,
  Status,
  setDefaultTimeout
} from '@cucumber/cucumber';

import {
  chromium,
  Browser,
  BrowserContext,
  Page,
  selectors
} from '@playwright/test';

setDefaultTimeout(30_000);

let browser: Browser;
let context: BrowserContext;

export let page: Page;

const slowMo = Number(process.env.SLOW_MO ?? 0);
const demoPause = Number(process.env.DEMO_PAUSE ?? 0);

BeforeAll(async () => {
  selectors.setTestIdAttribute('data-test');

  browser = await chromium.launch({
    headless: process.env.HEADLESS !== 'false',
    slowMo: Number.isFinite(slowMo) ? slowMo : 0
  });
});

Before(async () => {
  context = await browser.newContext();
  page = await context.newPage();
});

After(async function ({ result }) {
  if (result?.status === Status.FAILED && page) {
    const screenshot = await page.screenshot({ fullPage: true });
    await this.attach(screenshot, 'image/png');
  }

  if (demoPause > 0 && page) {
    await page.waitForTimeout(demoPause);
  }

  await context?.close();
});

AfterAll(async () => {
  await browser?.close();
});

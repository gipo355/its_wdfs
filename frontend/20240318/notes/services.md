# services

they are classes

live in the dependency injection container

contain business logic shared across the application

e.g. call the api

component calls the service

`ng g service services/cart`

```ts
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CartSourceService {
  constructor() {}
}
```

injectable: class lives inside DI, can be called from another class

providedIn: root, module, or component (automatically registerrs in providers
array)

add in app.module.ts

```ts
  providers: [
    { provide: DEFAULT_CURRENCY_CODE, useValue: 'EUR' },
    { provide: CurrencyPipe, useClass: CurrencyPipe },
    { provide: LOCALE_ID, useValue: 'it' },
    { provide: CartSourceService, useClass: CartSourceService },
  ],
```

useclass, usefactory(use a function to create the instance), usevalue

usage

```ts
export class AppComponent {
  // items = CART;
  items = this.cartSourceService.getCart();

  vat = getVAT('IT');

  // DI: use cart source service in the code, request in constructor
  constructor(protected cartSourceService: CartSourceService) {}
  // or
  // protected cartSrv = inject(CartSourceService)

```

this works too

```ts
export class AppComponent {
  cartSourceService = new CartSourceService();
  // items = CART;
  items = this.cartSourceService.getCart();

  vat = getVAT('IT');

  // DI: use cart source service in the code, request in constructor
  constructor(cartSourceService: CartSourceService) {
    this.cartSourceService = cartSourceService;
  }
  // or
  // protected cartSrv = inject(CartSourceService)
```

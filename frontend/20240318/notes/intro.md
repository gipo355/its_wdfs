# intro

## ngOnChanges

ngOnChanges is a lifecycle hook that is called when any data-bound property of a
directive changes. It is called before ngOnInit and whenever one or more
data-bound input properties change.

## transforming data using pipes

class transforms a data into a visualization format

<https://angular.io/api/common/CurrencyPipe>

```ts
<span class="total">{{ summary.total | currency }}</span>
summary.total | currency:'EUR':'symbol':'4.2-2'
{{ summary.total | currency:'EUR':'symbol':'4.2-2':'it-IT' }}


// in app module
import localeIt from '@angular/common/locales/it';
import { registerLocaleData } from '@angular/common';

registerLocaleData(localeIt);

```

# providers

inject app wide the service (pipe)

```ts
@NgModule({
  declarations: [AppComponent, CartItemComponent, SummaryComponent],
  imports: [BrowserModule, AppRoutingModule, FormsModule, NgbModule],
  providers: [
    { provide: DEFAULT_CURRENCY_CODE, useValue: 'EUR' },
    { provide: LOCALE_ID, useValue: 'it' },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
```

creating pipes

```ts
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'discountAmount',
})
export class DiscountAmountPipe implements PipeTransform {
  transform(value: unknown, ...args: unknown[]): unknown {
    return null;
  }
}

// in app module
@NgModule({
  declarations: [AppComponent, CartItemComponent, SummaryComponent, DiscountAmountPipe],

```

## dependency injection for custom pipe

```ts
// app module
@NgModule({
  declarations: [
    AppComponent,
    CartItemComponent,
    SummaryComponent,
    DiscountAmountPipe,
  ],
  imports: [BrowserModule, AppRoutingModule, FormsModule, NgbModule],
  providers: [
    { provide: DEFAULT_CURRENCY_CODE, useValue: 'EUR' },
    { provide: CurrencyPipe },
    { provide: LOCALE_ID, useValue: 'it' },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}

// pipe
import { CurrencyPipe } from '@angular/common';
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'discountAmount',
})
export class DiscountAmountPipe implements PipeTransform {
  // DI: use currency pipe in the code, request in constructor
  constructor(private currencyPipe: CurrencyPipe) {}

  transform(value: number): string {
    // use currency pipe in the code with DI
    const tmp = this.currencyPipe.transform(value); // transform the value here

    return `(-${tmp})`;
  }
}
```

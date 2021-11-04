import { Pipe, PipeTransform } from '@angular/core';

@Pipe({name: 'customDecimalInCommas'})
export class decimalInCommas implements PipeTransform {
  transform(value: number): string {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
}

@Pipe({name: 'customCardNumber'})
export class cardNumber implements PipeTransform {
  transform(value: string): string {
    return value.toString().replace(/\B(?=(\d{4})+(?!\d))/g, "-");
  }
}
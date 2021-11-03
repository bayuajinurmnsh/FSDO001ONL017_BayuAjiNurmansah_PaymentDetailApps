import { Pipe, PipeTransform } from '@angular/core';

@Pipe({name: 'customDecimalInCommas'})
export class decimalInCommas implements PipeTransform {
  transform(value: number): string {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
}
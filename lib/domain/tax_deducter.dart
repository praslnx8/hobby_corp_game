class TaxDeducter {
  static int HIGHER_SLAB = 80;
  static int LOWER_SLAB = 50;
  static int POVERTY_SLAB1 = 30;
  static int POVERTY_SLAB2 = 10;

  static int getDeductibleAmount(int amount) {
    int amountToDeduct = 0;
    if (amount > HIGHER_SLAB) {
      amountToDeduct += (amount - HIGHER_SLAB) * 30 ~/ 100;
      amountToDeduct += (HIGHER_SLAB - LOWER_SLAB) * 15 ~/ 100;
    } else if (amount > LOWER_SLAB) {
      amountToDeduct += (amount - LOWER_SLAB) * 15 ~/ 100;
    }
    return amountToDeduct;
  }

  static int getGovtFund(int amount) {
    int amountToFund = 0;
    if (amount < POVERTY_SLAB2) {
      amountToFund += 20;
    } else if (amount < POVERTY_SLAB1) {
      amountToFund += amount * 20 ~/ 100;
    }
    return amountToFund;
  }
}

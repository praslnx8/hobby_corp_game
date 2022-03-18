class TaxDeducter {
  static int ELITE_SLAB = 200;
  static int HIGHER_SLAB = 200;
  static int LOWER_SLAB = 120;
  static int MIDDLE_SLAB = 80;
  static int POVERTY_SLAB1 = 50;
  static int POVERTY_SLAB2 = 30;

  static int getDeductibleAmount(int amount) {
    int amountToDeduct = 0;
    if (amount > HIGHER_SLAB) {
      amountToDeduct += amount * 5 ~/ 100;
    } else if (amount > HIGHER_SLAB) {
      amountToDeduct += (amount - HIGHER_SLAB) * 10 ~/ 100;
      amountToDeduct += (HIGHER_SLAB - LOWER_SLAB) * 5 ~/ 100;
    } else if (amount > LOWER_SLAB) {
      amountToDeduct += (amount - LOWER_SLAB) * 5 ~/ 100;
    }
    return amountToDeduct;
  }

  static int getGovtFund(int amount) {
    int amountToFund = 0;
    if (amount < POVERTY_SLAB2) {
      amountToFund += 20;
    } else if (amount < POVERTY_SLAB1) {
      amountToFund += amount * 20 ~/ 100;
    } else if (amount < MIDDLE_SLAB) {
      amountToFund += amount * 10 ~/ 100;
    }
    return amountToFund;
  }
}

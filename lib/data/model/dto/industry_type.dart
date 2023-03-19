enum IndustryType {
  cement(01),
  electricalCable(06),
  steel(10),
  optoelectronics(26),
  informationServices(30),
  tradeDepartmentStore(18),
  food(02),
  chemical(21),
  rubber(11),
  electronicComponents(28),
  buildingMaterialsConstruction(14),
  oilElectricityAndGas(23),
  plastic(03),
  biotechnologyAndMedical(22),
  automotive(12),
  electronicDistribution(29),
  shipping(15),
  comprehensive(19),
  textileFibers(04),
  glassCeramics(08),
  semiconductor(24),
  otherElectronics(31),
  tourism(16),
  other(20),
  electricalMachinery(05),
  paper(09),
  computerAndPeripheralEquipment(25),
  communicationNetwork(27),
  financial(17),
  manageStocks(80);

  const IndustryType(this.value);
  final num value;

  static IndustryType fromValue(String value) {
    switch (value) {
      case '01':
        return IndustryType.cement;
      case '06':
        return IndustryType.electricalCable;
      case '10':
        return IndustryType.steel;
      case '26':
        return IndustryType.optoelectronics;
      case '30':
        return IndustryType.informationServices;
      case '18':
        return IndustryType.tradeDepartmentStore;
      case '02':
        return IndustryType.food;
      case '21':
        return IndustryType.chemical;
      case '11':
        return IndustryType.rubber;
      case '28':
        return IndustryType.electronicComponents;
      case '14':
        return IndustryType.buildingMaterialsConstruction;
      case '23':
        return IndustryType.oilElectricityAndGas;
      case '03':
        return IndustryType.plastic;
      case '22':
        return IndustryType.biotechnologyAndMedical;
      case '12':
        return IndustryType.automotive;
      case '29':
        return IndustryType.electronicDistribution;
      case '15':
        return IndustryType.shipping;
      case '19':
        return IndustryType.comprehensive;
      case '04':
        return IndustryType.textileFibers;
      case '08':
        return IndustryType.glassCeramics;
      case '24':
        return IndustryType.semiconductor;
      case '31':
        return IndustryType.otherElectronics;
      case '16':
        return IndustryType.tourism;
      case '20':
        return IndustryType.other;
      case '05':
        return IndustryType.electricalMachinery;
      case '09':
        return IndustryType.paper;
      case '25':
        return IndustryType.computerAndPeripheralEquipment;
      case '27':
        return IndustryType.communicationNetwork;
      case '17':
        return IndustryType.financial;
      case '80':
        return IndustryType.manageStocks;
      case 'XX':
        return IndustryType.other;
      default:
        return IndustryType.other;
    }
  }
}

extension IndustryTypeEx on IndustryType {
  String name() {
    switch (this) {
      case IndustryType.cement:
        return '水泥工業';
      case IndustryType.electricalCable:
        return '電器電纜';
      case IndustryType.steel:
        return '鋼鐵工業';
      case IndustryType.optoelectronics:
        return '光電業';
      case IndustryType.informationServices:
        return '資訊服務業';
      case IndustryType.tradeDepartmentStore:
        return '貿易百貨';
      case IndustryType.food:
        return '食品工業';
      case IndustryType.chemical:
        return '化學工業';
      case IndustryType.rubber:
        return '橡膠工業';
      case IndustryType.electronicComponents:
        return '電子零組件業';
      case IndustryType.buildingMaterialsConstruction:
        return '建材營造';
      case IndustryType.oilElectricityAndGas:
        return '油電燃氣業';
      case IndustryType.plastic:
        return '塑膠工業';
      case IndustryType.biotechnologyAndMedical:
        return '生技醫療';
      case IndustryType.automotive:
        return '汽車工業';
      case IndustryType.electronicDistribution:
        return '電子通路業';
      case IndustryType.shipping:
        return '航運業';
      case IndustryType.comprehensive:
        return '綜合';
      case IndustryType.textileFibers:
        return '紡織纖維';
      case IndustryType.glassCeramics:
        return '玻璃陶瓷';
      case IndustryType.semiconductor:
        return '半導體業';
      case IndustryType.otherElectronics:
        return '其他電子業';
      case IndustryType.tourism:
        return '觀光事業';
      case IndustryType.other:
        return '其他';
      case IndustryType.electricalMachinery:
        return '電機機械';
      case IndustryType.paper:
        return '造紙工業';
      case IndustryType.computerAndPeripheralEquipment:
        return '電腦及週邊設備業';
      case IndustryType.communicationNetwork:
        return '通信網路業';
      case IndustryType.financial:
        return '金融業';
      case IndustryType.manageStocks:
        return '管理股票';
    }
  }
}

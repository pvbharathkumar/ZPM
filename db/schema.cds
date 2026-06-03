namespace my_capm;
using { cuid, managed } from '@sap/cds/common';

@assert.unique: { workCenterCode: [workCenterCode] }
entity WorkCenters : cuid, managed {
  workCenterCode: String(8) @mandatory;
  workCenterDesc: String(40);
  plant: String(4);
  workCenterCategory: String(2);
  costCenter: String(10);
  activityType: String(6);
  validFrom: Date;
  validTo: Date;
  isActive: Boolean;
}

@assert.unique: { functionalLocation: [functionalLocation] }
entity FunctionalLocations : cuid, managed {
  functionalLocation: String(30) @mandatory;
  functionalLocationName: String(40);
  superiorFunctLocation: String(30);
  plant: String(4);
  companyCode: String(4);
  structureIndicator: String(6);

  workCenter: Association to WorkCenters;
  equipments: Composition of many Equipments on equipments.functionalLocation = $self;
  notifications: Association to many MaintenanceNotifications on notifications.functionalLocation = $self;
  orders: Association to many MaintenanceOrders on orders.functionalLocation = $self;
}

@assert.unique: { equipmentNumber: [equipmentNumber] }
entity Equipments : cuid, managed {
  equipmentNumber: String(18) @mandatory;
  equipmentName: String(40);
  equipmentCategory: String(1);
  plant: String(4);
  serialNumber: String(30);
  acquisitionDate: Date;
  abcIndicator: String(1);

  functionalLocation: Association to FunctionalLocations;
  workCenter: Association to WorkCenters;
  notifications: Association to many MaintenanceNotifications on notifications.equipment = $self;
  orders: Association to many MaintenanceOrders on orders.equipment = $self;
}
// Transactional Objects
@assert.unique: { notificationNumber: [notificationNumber] }
entity MaintenanceNotifications : cuid, managed {
  notificationNumber: String(12);
  notificationType: String(2);
  notificationText: String(40);
  notifPriority: String(1);
  notificationStatus: String(20);
  breakdownIndicator: Boolean;
  reportedByUser: String(12);
  reportedOnDate: Date;

  equipment: Association to Equipments;
  functionalLocation: Association to FunctionalLocations;
  workCenter: Association to WorkCenters;
  maintenanceOrder: Association to MaintenanceOrders;

  costLines: Composition of many CostEstimationLines on costLines.notification = $self;
}

@assert.unique: { lineNumber: [lineNumber] }
entity CostEstimationLines : cuid, managed {
  lineNumber: Integer @mandatory;
  costCategory: String(2);
  itemDescription: String(100);
  quantity: Decimal(13,3);
  unitRate: Decimal(15,2);
  lineAmount: Decimal(15,2);
  currency: String(3);
  costCenter: String(10);

  // Parent association
  notification: Association to MaintenanceNotifications;
}

@assert.unique: { orderNumber: [orderNumber] }
entity MaintenanceOrders : cuid, managed {
  orderNumber: String(12) @mandatory;
  orderType: String(4);
  orderDescription: String(40);
  orderStatus: String(20);
  basicStartDate: Date;
  basicEndDate: Date;
  totalPlannedCost: Decimal(15,2);
  totalActualCost: Decimal(15,2);
  currency: String(3);

  maintenanceNotification: Association to MaintenanceNotifications;
  equipment: Association to Equipments;
  functionalLocation: Association to FunctionalLocations;
  mainWorkCenter: Association to WorkCenters;

  workSteps: Composition of many WorkSteps on workSteps.maintenanceOrder = $self;
}

@assert.unique: { orderOp: [maintenanceOrder, operationNumber] }
entity WorkSteps : cuid, managed {
  operationNumber: String(4) @mandatory;
  operationText: String(40);
  plannedWork: Decimal(13,3);
  actualWork: Decimal(13,3);
  isCompleted: Boolean;
  completionDate: Date;
  remarks: String(200);

  maintenanceOrder: Association to MaintenanceOrders;
  workCenter: Association to WorkCenters;
}

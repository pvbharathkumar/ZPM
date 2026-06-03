using { my_capmSrv } from '../srv/service';

// ============ MAINTENANCE NOTIFICATIONS ============

annotate my_capmSrv.MaintenanceNotifications with @UI.HeaderInfo : {
  TypeName       : 'Maintenance Notification',
  TypeNamePlural : 'Maintenance Notifications',
  Title          : { Value : notificationNumber },
  Description    : { Value : notificationText }
};

annotate my_capmSrv.MaintenanceNotifications with @UI.SelectionFields : [
  notificationNumber,
  notificationType,
  equipment,
  functionalLocation,
  workCenter
];

annotate my_capmSrv.MaintenanceNotifications with @UI.LineItem : [
  { $Type: 'UI.DataField', Value: notificationNumber, Label: 'Notification Number' },
  { $Type: 'UI.DataField', Value: notificationType, Label: 'Notification Type' },
  { $Type: 'UI.DataField', Value: notificationText, Label: 'Notification Text' },
  { $Type: 'UI.DataField', Value: notifPriority, Label: 'Priority' },
  { $Type: 'UI.DataField', Value: notificationStatus, Label: 'Status' },
  { $Type: 'UI.DataFieldWithNavigationPath', Label: 'Equipment', Value: equipment.equipmentNumber, Target: 'equipment' },
  { $Type: 'UI.DataFieldWithNavigationPath', Label: 'Functional Location', Value: functionalLocation.functionalLocation, Target: 'functionalLocation' },
  { $Type: 'UI.DataFieldWithNavigationPath', Label: 'Work Center', Value: workCenter.workCenterCode, Target: 'workCenter' }
];

annotate my_capmSrv.MaintenanceNotifications with @UI.FieldGroup #General : {
  Data : [
    { $Type: 'UI.DataField', Value: notificationNumber, Label: 'Notification Number' },
    { $Type: 'UI.DataField', Value: notificationType, Label: 'Notification Type' },
    { $Type: 'UI.DataField', Value: notificationText, Label: 'Notification Text' },
    { $Type: 'UI.DataField', Value: notifPriority, Label: 'Priority' },
    { $Type: 'UI.DataField', Value: notificationStatus, Label: 'Status' },
    { $Type: 'UI.DataField', Value: breakdownIndicator, Label: 'Breakdown Indicator' },
    { $Type: 'UI.DataField', Value: reportedByUser, Label: 'Reported By' },
    { $Type: 'UI.DataField', Value: reportedOnDate, Label: 'Reported On Date' }
  ]
};

annotate my_capmSrv.MaintenanceNotifications with @UI.FieldGroup #Equipment : {
  Data : [
    { $Type: 'UI.DataFieldWithNavigationPath', Value: equipment.equipmentNumber, Target: 'equipment', Label: 'Equipment Number' },
    { $Type: 'UI.DataField', Value: equipment.equipmentName, Label: 'Equipment Name' }
  ]
};

annotate my_capmSrv.MaintenanceNotifications with @UI.FieldGroup #FunctionalLocation : {
  Data : [
    { $Type: 'UI.DataFieldWithNavigationPath', Value: functionalLocation.functionalLocation, Target: 'functionalLocation', Label: 'Functional Location' },
    { $Type: 'UI.DataField', Value: functionalLocation.functionalLocationName, Label: 'Functional Location Name' }
  ]
};

annotate my_capmSrv.MaintenanceNotifications with @UI.FieldGroup #WorkCenter : {
  Data : [
    { $Type: 'UI.DataFieldWithNavigationPath', Value: workCenter.workCenterCode, Target: 'workCenter', Label: 'Work Center Code' },
    { $Type: 'UI.DataField', Value: workCenter.workCenterDesc, Label: 'Work Center Description' }
  ]
};

annotate my_capmSrv.MaintenanceNotifications with @UI.FieldGroup #MaintenanceOrder : {
  Data : [
    { $Type: 'UI.DataFieldWithNavigationPath', Value: maintenanceOrder.orderNumber, Target: 'maintenanceOrder', Label: 'Order Number' },
    { $Type: 'UI.DataField', Value: maintenanceOrder.orderType, Label: 'Order Type' },
    { $Type: 'UI.DataField', Value: maintenanceOrder.orderDescription, Label: 'Order Description' },
    { $Type: 'UI.DataField', Value: maintenanceOrder.orderStatus, Label: 'Order Status' }
  ]
};

annotate my_capmSrv.MaintenanceNotifications with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'General',
    Label  : 'General Information',
    Target : '@UI.FieldGroup#General'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'Equipment',
    Label  : 'Equipment',
    Target : '@UI.FieldGroup#Equipment'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'FunctionalLocation',
    Label  : 'Functional Location',
    Target : '@UI.FieldGroup#FunctionalLocation'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'WorkCenter',
    Label  : 'Work Center',
    Target : '@UI.FieldGroup#WorkCenter'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'MaintenanceOrder',
    Label  : 'Maintenance Order',
    Target : '@UI.FieldGroup#MaintenanceOrder'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'CostLines',
    Label  : 'Cost Estimation Lines',
    Target : 'costLines/@UI.LineItem'
  }
];

// ============ COST ESTIMATION LINES ============

annotate my_capmSrv.CostEstimationLines with @UI.HeaderInfo : {
  TypeName    : 'Cost Estimation Line',
  Title       : { Value: lineNumber },
  Description : { Value: itemDescription }
};

annotate my_capmSrv.CostEstimationLines with @UI.LineItem : [
  { $Type: 'UI.DataField', Value: lineNumber, Label: 'Line Number' },
  { $Type: 'UI.DataField', Value: costCategory, Label: 'Cost Category' },
  { $Type: 'UI.DataField', Value: itemDescription, Label: 'Item Description' },
  { $Type: 'UI.DataField', Value: quantity, Label: 'Quantity' },
  { $Type: 'UI.DataField', Value: unitRate, Label: 'Unit Rate' },
  { $Type: 'UI.DataField', Value: lineAmount, Label: 'Line Amount' },
  { $Type: 'UI.DataField', Value: currency, Label: 'Currency' },
  { $Type: 'UI.DataField', Value: costCenter, Label: 'Cost Center' }
];

annotate my_capmSrv.CostEstimationLines with @UI.FieldGroup #Main : {
  Data : [
    { $Type: 'UI.DataField', Value: lineNumber, Label: 'Line Number' },
    { $Type: 'UI.DataField', Value: costCategory, Label: 'Cost Category' },
    { $Type: 'UI.DataField', Value: itemDescription, Label: 'Item Description' },
    { $Type: 'UI.DataField', Value: quantity, Label: 'Quantity' },
    { $Type: 'UI.DataField', Value: unitRate, Label: 'Unit Rate' },
    { $Type: 'UI.DataField', Value: lineAmount, Label: 'Line Amount' },
    { $Type: 'UI.DataField', Value: currency, Label: 'Currency' },
    { $Type: 'UI.DataField', Value: costCenter, Label: 'Cost Center' }
  ]
};

annotate my_capmSrv.CostEstimationLines with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'Main',
    Label  : 'Cost Details',
    Target : '@UI.FieldGroup#Main'
  }
];

// ============ EQUIPMENTS ============

annotate my_capmSrv.Equipments with @UI.HeaderInfo : {
  TypeName    : 'Equipment',
  Title       : { Value: equipmentNumber },
  Description : { Value: equipmentName }
};

annotate my_capmSrv.Equipments with @UI.LineItem : [
  { $Type: 'UI.DataField', Value: equipmentNumber, Label: 'Equipment Number' },
  { $Type: 'UI.DataField', Value: equipmentName, Label: 'Equipment Name' },
  { $Type: 'UI.DataField', Value: equipmentType, Label: 'Equipment Type' },
  { $Type: 'UI.DataField', Value: manufacturer, Label: 'Manufacturer' },
  { $Type: 'UI.DataField', Value: modelNumber, Label: 'Model Number' },
  { $Type: 'UI.DataField', Value: serialNumber, Label: 'Serial Number' },
  { $Type: 'UI.DataField', Value: installationDate, Label: 'Installation Date' },
  { $Type: 'UI.DataField', Value: functionalLocation.functionalLocation, Label: 'Functional Location' }
];

annotate my_capmSrv.Equipments with @UI.FieldGroup #EquipmentMain : {
  Data : [
    { $Type: 'UI.DataField', Value: equipmentNumber, Label: 'Equipment Number' },
    { $Type: 'UI.DataField', Value: equipmentName, Label: 'Equipment Name' },
    { $Type: 'UI.DataField', Value: equipmentType, Label: 'Equipment Type' },
    { $Type: 'UI.DataField', Value: manufacturer, Label: 'Manufacturer' },
    { $Type: 'UI.DataField', Value: modelNumber, Label: 'Model Number' },
    { $Type: 'UI.DataField', Value: serialNumber, Label: 'Serial Number' },
    { $Type: 'UI.DataField', Value: installationDate, Label: 'Installation Date' },
    { $Type: 'UI.DataField', Value: functionalLocation.functionalLocation, Label: 'Functional Location' }
  ]
};

annotate my_capmSrv.Equipments with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'EquipmentMain',
    Label  : 'Equipment Details',
    Target : '@UI.FieldGroup#EquipmentMain'
  }
];

// ============ FUNCTIONAL LOCATIONS ============

annotate my_capmSrv.FunctionalLocations with @UI.HeaderInfo : {
  TypeName    : 'Functional Location',
  Title       : { Value: functionalLocation },
  Description : { Value: functionalLocationName }
};

annotate my_capmSrv.FunctionalLocations with @UI.FieldGroup #LocationMain : {
  Data : [
    { $Type: 'UI.DataField', Value: functionalLocation, Label: 'Functional Location' },
    { $Type: 'UI.DataField', Value: functionalLocationName, Label: 'Functional Location Name' }
  ]
};

annotate my_capmSrv.FunctionalLocations with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'LocationMain',
    Label  : 'Location Details',
    Target : '@UI.FieldGroup#LocationMain'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'Equipments',
    Label  : 'Equipments',
    Target : 'equipments/@UI.LineItem'
  }
];

// ============ WORK CENTERS ============

annotate my_capmSrv.WorkCenters with @UI.HeaderInfo : {
  TypeName    : 'Work Center',
  Title       : { Value: workCenterCode },
  Description : { Value: workCenterDesc }
};

annotate my_capmSrv.WorkCenters with @UI.FieldGroup #WorkCenterMain : {
  Data : [
    { $Type: 'UI.DataField', Value: workCenterCode, Label: 'Work Center Code' },
    { $Type: 'UI.DataField', Value: workCenterDesc, Label: 'Work Center Description' }
  ]
};

annotate my_capmSrv.WorkCenters with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'WorkCenterMain',
    Label  : 'Work Center Details',
    Target : '@UI.FieldGroup#WorkCenterMain'
  }
];

// ============ MAINTENANCE ORDERS ============

annotate my_capmSrv.MaintenanceOrders with @UI.HeaderInfo : {
  TypeName    : 'Maintenance Order',
  Title       : { Value: orderNumber },
  Description : { Value: orderDescription }
};

annotate my_capmSrv.MaintenanceOrders with @UI.FieldGroup #OrderMain : {
  Data : [
    { $Type: 'UI.DataField', Value: orderNumber, Label: 'Order Number' },
    { $Type: 'UI.DataField', Value: orderType, Label: 'Order Type' },
    { $Type: 'UI.DataField', Value: orderDescription, Label: 'Order Description' },
    { $Type: 'UI.DataField', Value: orderStatus, Label: 'Order Status' },
    { $Type: 'UI.DataField', Value: basicStartDate, Label: 'Basic Start Date' },
    { $Type: 'UI.DataField', Value: basicEndDate, Label: 'Basic End Date' }
  ]
};

annotate my_capmSrv.MaintenanceOrders with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'OrderMain',
    Label  : 'Order Details',
    Target : '@UI.FieldGroup#OrderMain'
  }
];

// ============ WORK STEPS ============

annotate my_capmSrv.WorkSteps with @UI.HeaderInfo : {
  TypeName    : 'Work Step',
  Title       : { Value: operationNumber },
  Description : { Value: operationText }
};

annotate my_capmSrv.WorkSteps with @UI.FieldGroup #StepMain : {
  Data : [
    { $Type: 'UI.DataField', Value: operationNumber, Label: 'Operation Number' },
    { $Type: 'UI.DataField', Value: operationText, Label: 'Operation Text' },
    { $Type: 'UI.DataField', Value: plannedWork, Label: 'Planned Work' },
    { $Type: 'UI.DataField', Value: actualWork, Label: 'Actual Work' },
    { $Type: 'UI.DataField', Value: isCompleted, Label: 'Completed' },
    { $Type: 'UI.DataField', Value: completionDate, Label: 'Completion Date' }
  ]
};

annotate my_capmSrv.WorkSteps with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'StepMain',
    Label  : 'Step Details',
    Target : '@UI.FieldGroup#StepMain'
  }
];

// ─── Notification Number: read-only, hidden on create ────────────────────────
annotate my_capmSrv.MaintenanceNotifications with {
    notificationNumber @Core.Computed: true
                       @UI.HiddenFilter: false;
};

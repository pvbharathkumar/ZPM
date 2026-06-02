using { my_capm as my } from '../db/schema.cds';

@path: '/service/my_capm'
@requires: 'authenticated-user'

service my_capmSrv {
  @odata.draft.enabled
  entity WorkCenters as projection on my.WorkCenters;
  
  entity FunctionalLocations as projection on my.FunctionalLocations;
  @odata.draft.enabled
  entity Equipments as projection on my.Equipments;
  
  entity MaintenanceNotifications as projection on my.MaintenanceNotifications;
  @odata.draft.enabled
  entity CostEstimationLines as projection on my.CostEstimationLines;
  
  entity MaintenanceOrders as projection on my.MaintenanceOrders;  
  @odata.draft.enabled
  entity WorkSteps as projection on my.WorkSteps;
}
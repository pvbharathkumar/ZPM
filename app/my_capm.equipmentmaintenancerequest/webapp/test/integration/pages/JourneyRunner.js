sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"mycapm/equipmentmaintenancerequest/test/integration/pages/MaintenanceNotificationsList",
	"mycapm/equipmentmaintenancerequest/test/integration/pages/MaintenanceNotificationsObjectPage",
	"mycapm/equipmentmaintenancerequest/test/integration/pages/CostEstimationLinesObjectPage"
], function (JourneyRunner, MaintenanceNotificationsList, MaintenanceNotificationsObjectPage, CostEstimationLinesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('mycapm/equipmentmaintenancerequest') + '/test/flpSandbox.html#mycapmequipmentmaintenancerequ-tile',
        pages: {
			onTheMaintenanceNotificationsList: MaintenanceNotificationsList,
			onTheMaintenanceNotificationsObjectPage: MaintenanceNotificationsObjectPage,
			onTheCostEstimationLinesObjectPage: CostEstimationLinesObjectPage
        },
        async: true
    });

    return runner;
});


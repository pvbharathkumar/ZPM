sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'mycapm.equipmentmaintenancerequest',
            componentId: 'MaintenanceNotificationsList',
            contextPath: '/MaintenanceNotifications'
        },
        CustomPageDefinitions
    );
});
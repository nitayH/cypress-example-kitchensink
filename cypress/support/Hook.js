"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.hookPlugin = void 0;
function hookPlugin(Cypress) {
    before(function () {
        cy.task("Should Stop").then(function (shouldStop) {
            if (shouldStop) {
                Cypress.runner.stop();
                return;
            }
        });
    });
    afterEach(function () {
        if (this.currentTest.isFailed()) {
            cy.task("Report test fail", {
                testName: this.currentTest.titlePath(),
                fileName: Cypress.spec.relative,
                stackTrace: this.currentTest.err.stack,
            });
        }
    });
}
exports.hookPlugin = hookPlugin;

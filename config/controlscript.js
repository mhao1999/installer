function Controller()
{
	
}

Controller.prototype.IntroductionPageCallback = function()
{
    if (installer.isUpdater()) {
		gui.clickButton(buttons.NextButton);
	}
}

Controller.prototype.ComponentSelectionPageCallback = function() 
{
	if (installer.isUpdater()) {
		gui.clickButton(buttons.NextButton);
	}
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    if (installer.isUpdater()) {
        gui.clickButton(buttons.CommitButton);
    }
}

Controller.prototype.FinishedPageCallback = function()
{
    if (installer.isUpdater()) {
        gui.clickButton(buttons.FinishButton);
    }
}

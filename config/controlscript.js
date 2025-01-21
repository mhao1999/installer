function Controller() {
	
	
}

Controller.prototype.IntroductionPageCallback = function() {
    setBackgroundImage();
};

function setBackgroundImage() {
    // Set the background image for the current page
    var widget = gui.currentPageWidget();
    if (widget) {
        widget.setStyleSheet("QWidget { background-image: url('banner.jpg'); background-position: center; background-repeat: no-repeat; }");
    }
}
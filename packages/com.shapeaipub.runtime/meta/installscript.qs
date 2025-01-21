/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the FOO module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
    // call default implementation to actually install README.txt!
    component.createOperations();

    //if (systemInfo.productType === "windows") {
    //    component.addOperation("CreateShortcut", "@TargetDir@/README.txt", "@StartMenuDir@/README.lnk",
    //        "workingDirectory=@TargetDir@", "iconPath=%SystemRoot%/system32/SHELL32.dll",
    //        "iconId=2", "description=Open README file");
    //}
	
	// Create a Start Menu entry
    if (systemInfo.productType === "windows") {
        var programFiles = installer.environmentVariable("ProgramFiles");
        var targetDir = installer.value("TargetDir");
        var startMenuDir = installer.value("StartMenuDir");

		// create directory in AppData/Roaming
		// @HomeDir@ will be resolve to c:/users/{username}
		// @ProductName@ will resolve to "HelloAnim" from config.xml
		component.addOperation("Mkdir", "@HomeDir@/AppData/Roaming/@ProductName@");
		component.addOperation("Mkdir", "@HomeDir@/AppData/Roaming/@ProductName@/assets");
		component.addOperation("Mkdir", "@HomeDir@/AppData/Roaming/@ProductName@/assets/icons");
		
		// if you want to copy the assets folder to this location
		component.addOperation("CopyDirectory", "@TargetDir@/assets", 
				"@HomeDir@/AppData/Roaming/HelloAnim/assets");
				
		// component.addOperation("Rmdir", "@TargetDir@/assets/icons");
	}
}

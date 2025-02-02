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

        // Define the shortcut path
        var shortcutPath = startMenuDir + "\\HelloAnim.lnk";

		// Optional: Create program shortcut as well
        component.addOperation("CreateShortcut",
            "@TargetDir@/HelloAnim.exe",
            "@StartMenuDir@/@ProductName@/@ProductName@.lnk",
            "workingDirectory=@TargetDir@",
            "iconPath=@TargetDir@/HelloAnim.exe",
            "description=运行 @ProductName@");

        // Optionally create a shortcut to uninstall the program
        component.addOperation("CreateShortcut",
			"@TargetDir@/maintenancetool.exe",
			"@StartMenuDir@/@ProductName@/卸载 @ProductName@.lnk",
			"workingDirectory=@TargetDir@",
			"iconPath=@TargetDir@/maintenancetool.exe",
            "description=卸载 @ProductName@");
			
		
    }
}

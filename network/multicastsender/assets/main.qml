/****************************************************************************
 **
 ** Portions Copyright (C) 2012 Research In Motion Limited.
 ** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
 ** All rights reserved.
 ** Contact: Research In Motion Ltd. (http://www.rim.com/company/contact/)
 ** Contact: Nokia Corporation (qt-info@nokia.com)
 **
 ** This file is part of the examples of the BB10 Platform and is derived
 ** from a similar file that is part of the Qt Toolkit.
 **
 ** You may use this file under the terms of the BSD license as follows:
 **
 ** "Redistribution and use in source and binary forms, with or without
 ** modification, are permitted provided that the following conditions are
 ** met:
 **   * Redistributions of source code must retain the above copyright
 **     notice, this list of conditions and the following disclaimer.
 **   * Redistributions in binary form must reproduce the above copyright
 **     notice, this list of conditions and the following disclaimer in
 **     the documentation and/or other materials provided with the
 **     distribution.
 **   * Neither the name of Research In Motion, nor the name of Nokia
 **     Corporation and its Subsidiary(-ies), nor the names of its
 **     contributors may be used to endorse or promote products
 **     derived from this software without specific prior written
 **     permission.
 **
 ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 ** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 ** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 ** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 ** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 ** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 ** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 ** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 ** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
 **
 ****************************************************************************/


import bb.cascades 1.0

// This page shows how to create control buttons with a dynamically changing label
Page {
    
    // The root Container
    content: Container {
        layout: DockLayout {
        }
        
        // A Container is used to gather visual items together.
        Container {
            layoutProperties: DockLayoutProperties {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
            }
            
            preferredWidth: 1000
            
            // A standard Label
            Label {
                layoutProperties: StackLayoutProperties {
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                text: _sender.status
                
                // Defines text style with custom font size
                textStyle {
                    base: SystemDefaults.TextStyles.SmallText
                    size: 35
                }
            }
            
            // A Container for grouping the Label and TextField pair in a different Layout
            Container {
                topMargin: 30
                layoutProperties: StackLayoutProperties {
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                layout: StackLayout {
                    layoutDirection: LayoutDirection.LeftToRight
                }
                
                // A standard Label
                Label {
                    text: qsTr ("TTL for multicast datagrams:")
                    layoutProperties: StackLayoutProperties {
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
                
                // A standard TextField
                TextField {
                    leftMargin: 10
                    preferredWidth: 200
                    text: _sender.ttl
                    
                    // On text input store the text
                    onTextChanging: _sender.ttl = text
                }
            }
            
            // A Container for grouping the control Buttons
            Container {
                topMargin: 30
                layoutProperties: StackLayoutProperties {
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                layout: StackLayout {
                    layoutDirection: LayoutDirection.LeftToRight
                }
                
                // A standard Button
                Button {
                    text: qsTr ("Start")
                    
                    // Start the multicast on click
                    onClicked: {
                        enabled = false;
                        _sender.startSending ()
                    }
                }
                
                // A standard Button
                Button {
                    leftMargin: 100
                    text: qsTr ("Quit")
                    
                    //Quit the application on click
                    onClicked: _app.quit ()
                }
            }
        }
    }
}

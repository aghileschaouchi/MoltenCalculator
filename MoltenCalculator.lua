require "wx"

local MoltenVersion = "0.1"

frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, "Molten calculator v" .. MoltenVersion,
                   wx.wxDefaultPosition, wx.wxSize(450, 450),
                   wx.wxDEFAULT_FRAME_STYLE)

local fileMenu = wx.wxMenu()
fileMenu:Append(wx.wxID_EXIT, "E&xit", "Quit the program")

local helpMenu = wx.wxMenu()
helpMenu:Append(wx.wxID_ABOUT, "&About",
                "About Molten calculator v" .. MoltenVersion)

-- create a menu bar and append the file and help menus
local menuBar = wx.wxMenuBar()
menuBar:Append(fileMenu, "&File")
menuBar:Append(helpMenu, "&Help")
-- attach the menu bar into the frame
frame:SetMenuBar(menuBar)

-- create a simple status bar
frame:CreateStatusBar(1)
frame:SetStatusText("Welcome to wxLua.")

-- connect the selection event of the exit menu item to an
-- event handler that closes the window
frame:Connect(wx.wxID_EXIT, wx.wxEVT_COMMAND_MENU_SELECTED,
              function (event) frame:Close(true) end )
-- connect the selection event of the about menu item
frame:Connect(wx.wxID_ABOUT, wx.wxEVT_COMMAND_MENU_SELECTED,
        function (event)
            wx.wxMessageBox('Computer building and selling calculator version number ' .. MoltenVersion,
                            "About wxLua",
                            wx.wxOK + wx.wxICON_INFORMATION,
                            frame)
        end )

-- finally, show the frame window
frame:Show(true)
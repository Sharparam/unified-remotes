local device = libs.device
local kb = libs.keyboard
local server = libs.server
local utf8 = libs.utf8

--@help Opens a dialog to go to a specific slide.
function actions.open_goto()
    server.update({
        id = "gotodialog",
        type = "input",
        title = "Input a slide number",
        ontap = "goto"
    })
end

--@help Jumps to a specific slide.
--@param slide:number The slide to go to.
function actions.goto(slide)
    slide = utf8.trim(slide)

    if tonumber(slide) == nil then
        device.toast 'Invalid slide number'
        return
    end

    kb.press 'g'
    kb.text(slide)
    kb.press 'enter'
end

local wallpaper = {}


-- Returns random wallpaper in my picture
function wallpaper.getImg()
    math.randomseed(os.time())
    num = math.random(1,48)
    filename = tostring(num) .. ".jpg"
    pathtofile = "/home/adl/Pictures/" .. filename
    return pathtofile
end

return wallpaper
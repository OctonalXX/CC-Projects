term.clear()
textutils.slowPrint("Remote V1.0")
print("Enter password:")
local password = read("*")
if password == "1234" then
print("Password Correct")
else
error("Incorrect Password")
end
textutils.slowPrint("Opening Rednet...")
rednet.open("back")
if rednet.isOpen() == false then
error("There is no modem on the back of the computer.")
end
print("Enter Host ID:")
local host = tonumber(read())
textutils.slowPrint("Checking...")
rednet.send(host,"RemoteCheck")
senderID,message = rednet.receive()
if message == "OK" then
if senderID == host then
print("Check Success")
else
error("Sender Incorrect")
end
else
error("Message Incorrect")
end
term.clear()

while true do

print("Remote\n\n\n")
print("Options:")
print("1. Activate Door")
print("2. Lockdown")
print("3. Exit")
print("Enter Option:")
local option = read()

if option == "1" then
rednet.send(host,"OpenDoor")
textutils.slowPrint("Opening Door...")
end
if option == "2" then
rednet.send(host,"Lockdown")
textutils.slowPrint("Lockdown")
end
if option == "3" then
error("Exited")
end

term.clear()
-- Loop End
end

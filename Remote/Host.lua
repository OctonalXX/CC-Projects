rednet.open("back")
senderID,message = rednet.receive()
if message == "RemoteCheck" then
rednet.send(senderID,"OK")
Client = senderID
Client = tonumber(Client)
print("Registered Remote on ID: ", tostring(Client))
end

while true do
senderID,message = rednet.receive()
opt = message
print("Recieved Option:",opt)
if tonumber(senderID) == Client then
print("Verified")
if opt == "OpenDoor" then
print("Opening Door")
rs.setOutput("left",true)
sleep(20)
rs.setOutput("left",false)
end
if opt == "Lockdown" then
print("Lockdown")
rs.setOutput("right",true)
sleep(5)
rs.setOutput("right",false)
end
end
end

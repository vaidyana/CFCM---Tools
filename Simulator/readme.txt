==============================================================
Simulator application
==============================================================

	This application simulates CDS or Hillrom application that communicates with
	Earlysense application running on the SOM (port 3033)
	
==============================================================
Course of action
==============================================================

	Have SOM with running Earlysense application accessable on the network
	Make sure Hillrom application is not connected to the SOM as only one client allowed to be connected
	Start up Similator on either Windows or Ubuntu machine that have TCP/IP access to SOM
	Setup Simulator to connect to Earlysense application running on the SOM
	Send TrendRequestMessage filled with fromTime, toTime and numPoints fields
	Observe the returned TrendsMessage
	
==============================================================
How to run Simualator
==============================================================

	Simulator may run on either Windows or Ubuntu machine (with UI)
	Make sure java 8 is installed on the machine (java -version)
	Extract Simulator_Hillrom.zip to some folder
	Change to Simulator_Hillrom folder
	Start Simulator application either with start.bat (Windows) or start.sh (Ubuntu, make sure to run chmod +x ./start.sh before)
	See screent shots: send-trends-request.png, get-trends-result.png
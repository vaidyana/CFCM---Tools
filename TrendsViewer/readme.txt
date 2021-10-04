==============================================================
TrendsViewer application
==============================================================

	This application has two parts
		
		EventLogParser	# parse binary event log to csv (text) file
		TrendsViewer	# display content of selected binary event log file as a chart
		
==============================================================
Course of action
==============================================================

	Get binary event log file from SOM that has the relevant data (time and patient)
	Put the above file into some folder
	Run EventLogParser to get cvs file
	Run TrendsViewer to present event log as a chart
	
==============================================================
EventLogParser
==============================================================

	EventLogParser may run on either Windows or Ubuntu machine (with UI)
	Make sure java 8 is installed on the machine (java -version)
	Extract TrendsViewer.zip to some folder
	Change to TrendsViewer folder
	Start EventLogParser either with StartEventLogParser.bat (Windows) or StartEventLogParser.sh (Ubuntu, make sure to run chmod +x ./StartEventLogParser.sh before)
	Select time offset +0 to present timestamps in GMT exactly as the appear in the binray event log file
	The output file out.cvs is located in the same folder with binary event log file
	
	Now observer the content of out.cvs as see if timestamps are correct (valid and no jumps)
	
==============================================================
TrendsViewer
==============================================================	

	TrendsViewer may run on either Windows or Ubuntu machine (with UI)
	Make sure java 8 is installed on the machine (java -version)
	Extract TrendsViewer.zip to some folder
	Change to TrendsViewer folder
	Copy binary event log file to TrendsViewer folder
	Start TrendsViewer either with StartTrendsViewer.bat (Windows) or StartTrendsViewer.sh (Ubuntu, make sure to run chmod +x ./StartTrendsViewer.sh before)
	The chart with all data available in binary event log file will be shown
	
	Note that time that will appear on the chart is local computer time. To show original timestamps as they appears in event log file please set timezone offset
	to GMT on the machine that runs TrendsViewer
	
	
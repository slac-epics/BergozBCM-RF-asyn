#!../../bin/linuxRT_glibc-x86_64/BergozBCMTest

###############################################################################
# Set up environment
epicsEnvSet("P","$(P=BCM:)")
epicsEnvSet "TTY" "$(TTY=/dev/ttyACM0)"

< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/db")
cd "${TOP}"

###############################################################################
# Register all support components
dbLoadDatabase "dbd/BergozBCMTest.dbd"
BergozBCMTest_registerRecordDeviceDriver pdbbase

###############################################################################
# Set up ASYN ports
# drvAsynIPPortConfigure port ipInfo priority noAutoconnect noProcessEos
drvAsynSerialPortConfigure("L0","$(TTY)",0,0,0)
asynSetTraceIOMask("L0",-1,0x2)
asynSetTraceMask("L0",-1,0x9)

###############################################################################
# Load record instances
dbLoadRecords "db/devBergozBCM.db" "P=$(P),R=1:,PORT=L0,A=-1"
dbLoadRecords "db/asynRecord.db" "P=$(P),R=asyn,PORT=L0,ADDR=-1,OMAX=0,IMAX=0"

###############################################################################
# Start IOC
cd "iocBoot/${IOC}"
iocInit

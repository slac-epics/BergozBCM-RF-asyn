#!../../bin/linuxRT-x86_64/BergozBCMTest

###############################################################################
# Set up environment
epicsEnvSet("P","$(P=BCM:)")
epicsEnvSet("R","$(R=0:)")
epicsEnvSet("PORT","$(PORT=L0)")
epicsEnvSet("BERGOZ_TTY","$(BERGOZ_TTY=/dev/ttyACM0)")
epicsEnvSet("SERIALNUM_EXPECT","$(SERIALNUM_EXPECT=40)")

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
drvAsynSerialPortConfigure("$(PORT)","$(BERGOZ_TTY)",0,0,0)
asynSetTraceIOMask("$(PORT)",-1,0x2)
asynSetTraceMask("$(PORT)",-1,0x9)

###############################################################################
# Load record instances
dbLoadRecords "db/devBergozBCM.db" "P=$(P),R=$(R),PORT=$(PORT),A=-1"
dbLoadRecords "db/asynRecord.db" "P=$(P),R=asyn,PORT=$(PORT),ADDR=-1,OMAX=0,IMAX=0"

###############################################################################
# Start IOC
cd "iocBoot/${IOC}"
iocInit

# Save the TTY device name
dbpf $(P)$(R)TTY_RD $(BERGOZ_TTY)

# Save the expected BERGOZ serial number
dbpf $(P)$(R)SERIALNUM_EXPECT $(SERIALNUM_EXPECT)

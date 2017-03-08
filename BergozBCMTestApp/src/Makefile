TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

# =========================================================
# EXTERNAL NON EPICS PACKAGES: USER INCLUDES AND LIBRARIES
# ========================================================

USR_INCLUDES += -I$(PCRE_INCLUDE)

# ===================================
# PATH TO THE EXTERNAL LIBRARIES
# ===================================
pcre_DIR = $(PCRE_LIB)

# =====================================
# LINK EXTERNAL LIBRARIES STATICALLY
# ====================================
USR_LIBS_Linux += pcre

#=============================
# Build the IOC application

PROD_IOC = BergozBCMTest
# BergozBCMTest.dbd will be created and installed
DBD += BergozBCMTest.dbd

# BergozBCMTest.dbd will be made up from these files:
BergozBCMTest_DBD += base.dbd

# Include dbd files from all support applications:
BergozBCMTest_DBD += stream.dbd
BergozBCMTest_DBD += asyn.dbd
#BergozBCMTest_DBD += drvAsynIPPort.dbd
BergozBCMTest_DBD +=  drvAsynSerialPort.dbd

# Add all the support libraries needed by this IOC
BergozBCMTest_LIBS += stream
BergozBCMTest_LIBS += asyn

USR_SYS_LIBS += pcre

# BergozBCMTest_registerRecordDeviceDriver.cpp derives from BergozBCMTest.dbd
BergozBCMTest_SRCS += BergozBCMTest_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
BergozBCMTest_SRCS_DEFAULT += BergozBCMTestMain.cpp
BergozBCMTest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#BergozBCMTest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
BergozBCMTest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


TOP=..
include $(TOP)/configure/CONFIG
#=======================================

# Install .dbd and .db files
DB += devBergozBCM.db
DB += $(TOP)/BergozBCMSup/devBergozBCM.proto

DB_INSTALLS += devBergozBCM.db
DB_INSTALLS += $(TOP)/BergozBCMSup/devBergozBCM.proto

ifdef AUTOSAVE_ASSUPPORT
IOCManager_DBD += asSupport.dbd
else
IOCManager_DBD +=autosaveSupport.db
endif

# Install library
ifdef RESTORE
IOCManager_LIBS += restore
endif
IOCManager_LIBS += autosave
#

#=======================================
include $(TOP)/configure/RULES

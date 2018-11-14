#require recsync,1.3.0
#require iocStats,ae5d083

require stream,2.7.14p
require genesysGEN5kWPS,1.0.0


epicsEnvSet("TOP","$(E3_CMD_TOP)/..")
epicsEnvSet("TS2MOXA01", "10.0.5.173")
epicsEnvSet("PS01", 4001)
epicsEnvSet("IOC", "TS2-010RFC:RFS-SOLPS-001")

epicsEnvSet("STREAM_PROTOCOL_PATH", $(genesysGEN5kWPS_DB))

loadIocsh("gen5kWPS.iocsh", "P=$(IOC):,MOXA_IP=$(TS2MOXA01),MOXA_PORT=$(PS01)")

#loadIocsh("iocStats.iocsh", "IOCNAME=TS2-010RFC")
#loadIocsh("recsync.iocsh", "IOCNAME=TS2-010RFC")

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"



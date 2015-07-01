unit Modbus;

interface

uses
  Forms, SysUtils;

const
  false_bool = 0;
  true_bool  = -1;
{
********** Constants for Modbusserver.exe
}
  mbNOPARITY             = 0;
  mbODDPARITY            = 1;
  mbEVENPARITY           = 2;
  mbMARKPARITY           = 3;
  mbSPACEPARITY          = 4;

  mbONESTOPBIT           = 0;
  mbONE5STOPBITS         = 1;
  mbTWOSTOPBITS          = 2;

  mbFC_NONE              = 0;
  mbFC_DTRDSR            = 1;
  mbFC_RTSCTS            = 2;
  mbFC_XONXOFF           = 4;

  mbLOCAL                = 1;
  mbREMOTE               = 2;

  mbMODE_RTU             = 0;
  mbMODE_ASCII           = 1;

  mbREAL_NORMAL          = 0;
  mbREAL_REVERSE         = 1;

  mbErrOk = 0;
  mbErrTimeOut           = -2147220991;
  mbErrInvResp           = -2147220990;
  mbErrCRC               = -2147220989;
  mbErrWrPort            = -2147220984;
  mbErrRdPort            = -2147220983;
  mbErrNotInit           = -2147220982;
  mbErrExceptionCode     = -2147188224;
  mbErrOffset            =  512;
  mbErrBufferOverflow    = -2147219992;
  mbErrSocketError       = -2147219991;
  mbErrWriteSockError    = -2147219990;
  mbErrReadSockError     = -2147219989;
  mbErrSockNotConnected  = -2147219988;

{
********** Constants included in system unit for variant data type
	varSmallint = $0002;
	varInteger  = $0003;
	varSingle   = $0004;
	varDouble   = $0005;
	varBoolean  = $000B;
}


implementation

begin

end.

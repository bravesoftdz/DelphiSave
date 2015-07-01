const
  FNAME_MAX         = 260 - 1;
  COMMENT_MAX       = 2048;

  // opeartion type
  ARJ_SKIP          = 0;    // skip
  ARJ_TEST          = 1;    // test
  ARJ_EXTRACT       = 2;    // extract

  ERROR_OK          = 0;    // success
  ERROR_FAIL        = 1;    // fatal error
  ERROR_CRC         = 2;    // CRC error
  ERROR_SECURE      = 3;    // ARJ security invalid or not found
  ERROR_WRITE       = 4;    // disk full
  ERROR_OPEN        = 5;    // can't open file
  ERROR_CREATE      = 6;    // can't create file
  ERROR_MEMORY      = 7;    // not enough memory
  ERROR_NOT_ARJ     = 8;    // not ARJ file
  ERROR_END         = 9;    // end of archive
  ERROR_BAD_DATA    = 10;   // bad header data
  ERROR_WRONG_PARAM = 11;   // wrong param in call
  ERROR_WRONG_VER   = 12;   // wrong ARJ file version
  ERROR_UNK_METHOD  = 13;   // unknown packed method
  ERROR_UNK_TYPE    = 14;   // unknown file type

  GARBLE_FLAG       = $01;  // file protected with password
  VOLUME_FLAG       = $04;  // continued in the next volume
  EXTFILE_FLAG      = $08;  // start from prior volume
  PATHSYM_FLAG      = $10;
  BACKUP_FLAG       = $20;

  FA_RDONLY         = $01;  // Read only attribute
  FA_HIDDEN         = $02;  // Hidden file
  FA_SYSTEM         = $04;  // System file
  FA_LABEL          = $08;  // Volume label
  FA_DIREC          = $10;  // Directory
  FA_ARCH           = $20;  // Archive

  // file type
  BINARY_TYPE       = 0;    // binary file
  TEXT_TYPE         = 1;    // text file

  // host OS
  MSDOS             = 0;
  PRIMOS            = 1;
  UNIX              = 2;
  AMIGA             = 3;
  MACDOS            = 4;
  OS2               = 5;
  APPLE_GS          = 6;
  ATARI_ST          = 7;
  NEXT              = 8;
  VAX_VMS           = 9;

type
  TARJHeaderData    = packed record
    FileName    : Array[0..FNAME_MAX-1] of Char;  // file name
    PackSize,                                     // packed size
    UnpSize,                                      // original size
    FileCRC,                                      // crc
    FileTime,                                     // file date and time
    FileAttr,                                     // file attributes
    FileType    : LongWord;                       // file type
    HostOS,                                       // target OS
    Method,                                       // compression method
    EntryPos,                                     // internal field
    Flags       : Byte;                           // file flags
    Comment     : Array[0..COMMENT_MAX-1] of Char;// comment text
  end;

  TChangeVolume   = function(ArcName: PChar): Integer; stdcall;
  TProgressNotify = function(Buffer: PChar; Size: Integer): Integer; stdcall;


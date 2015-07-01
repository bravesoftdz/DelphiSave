unit unArtMessages;

interface

uses
  Messages;

const
  WM_ARTMSG     = WM_USER + 1000;

  WM_FRAMECHANGE   = WM_ARTMSG + 1;
  WM_SETEMPRESA    = WM_ARTMSG + 2;
  WM_SETESTABLECI  = WM_ARTMSG + 3;
  WM_SETTRABAJADOR = WM_ARTMSG + 4;

implementation

end.

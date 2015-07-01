inherited frmSolicitudCarpetaUsuario: TfrmSolicitudCarpetaUsuario
  Left = 121
  Top = 56
  ActiveControl = edMotivo
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Solicitud de Carpetas Pendientes de Entrega a Usuarios'
  ClientHeight = 593
  ClientWidth = 527
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 2
    Top = 446
    Width = 524
    Height = 115
    Caption = 'Ingrese el Motivo de No Entrega de la Carpeta al Usuario'
    TabOrder = 1
    object edMotivo: TMemo
      Left = 7
      Top = 16
      Width = 509
      Height = 89
      MaxLength = 250
      TabOrder = 0
    end
  end
  inline fraDetalleArchivoDetalleCarpeta: TfraDetalleArchivo [1]
    Left = 4
    Top = 0
    Width = 522
    Height = 447
    TabOrder = 0
    DesignSize = (
      522
      447)
    inherited gbDetalleArchivo: TGroupBox
      Width = 522
      DesignSize = (
        522
        275)
      inherited edTipoArchivo: TEdit
        Width = 447
      end
      inherited edUbicacion: TEdit
        Width = 223
      end
      inherited edtRecepctor: TEdit
        Width = 207
      end
      inherited edtDescripcion: TEdit
        Width = 447
      end
      inherited tbDetalleDescripcion: TToolBar
        Left = 484
      end
      inherited edObservaciones: TMemo
        Width = 507
      end
    end
    inherited gbDetalleSolicitudActiva: TGroupBox
      Width = 522
      Height = 168
      DesignSize = (
        522
        168)
      inherited lblFechaSolicitud: TLabel
        Left = 342
      end
      inherited edFechaSolicitud: TDateComboBox
        Left = 423
      end
      inherited mMotivoSolicitud: TMemo
        Width = 507
        Height = 71
      end
    end
  end
  object btnOk: TBitBtn [2]
    Left = 2
    Top = 565
    Width = 117
    Height = 25
    Caption = 'Continuar'
    Default = True
    TabOrder = 2
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  inherited FormStorage: TFormStorage [3]
  end
  inherited XPMenu: TXPMenu [4]
  end
  inherited ilByN: TImageList [5]
  end
  inherited ilColor: TImageList [6]
  end
end

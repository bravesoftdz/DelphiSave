object frmGeneraDBF: TfrmGeneraDBF
  Left = 348
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generar Excel'
  ClientHeight = 108
  ClientWidth = 362
  Color = clBtnFace
  Constraints.MaxHeight = 136
  Constraints.MinHeight = 135
  Constraints.MinWidth = 370
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  DesignSize = (
    362
    108)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 68
    Height = 13
    Caption = 'ID Liquidaci'#243'n'
  end
  object Bevel1: TBevel
    Left = 1
    Top = 67
    Width = 356
    Height = 8
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 45
    Height = 13
    Caption = 'Directorio'
  end
  object btnAceptar: TButton
    Left = 203
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar'
    Default = True
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 282
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object edIDLIQ: TIntEdit
    Left = 88
    Top = 8
    Width = 93
    Height = 21
    TabOrder = 0
  end
  object edDirectorio: TDirectoryEdit
    Left = 88
    Top = 40
    Width = 266
    Height = 21
    DialogKind = dkWin32
    NumGlyphs = 1
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 4
    Top = 76
  end
  object sdqParametro: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 68
    Top = 76
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'edDirectorio.Text')
    StoredValues = <>
    Left = 96
    Top = 76
  end
  object DataToXLS: TDataToXLS
    DataSet = sdqConsulta
    Columns = <
      item
        DataField = 'RAZON'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'CUIT2'
        Title = 'CUIT'
      end
      item
        DataField = 'SUMAINI'
        Title = 'Suma Fija'
        DataType = ctDouble
      end
      item
        DataField = 'PORCINI'
        Title = 'Porc. Variable'
        DataType = ctDouble
      end
      item
        DataField = 'CODORG'
        Title = 'Entidad'
      end
      item
        DataField = 'CODVEND'
        Title = 'Vendedor'
      end
      item
        DataField = 'PAGOS'
        Title = 'Cobrado Neto'
        DataType = ctDouble
      end
      item
        DataField = 'IMPCANT'
        Title = 'Importe'
        DataType = ctDouble
      end
      item
        DataField = 'COMISION'
        Title = 'Comisi'#243'n'
        DataType = ctDouble
      end
      item
        DataField = 'RET_OS'
        Title = 'Retenci'#243'n O.S.'
        DataType = ctDouble
      end
      item
        DataField = 'COM_NETA'
        Title = 'Comisi'#243'n Neta'
        DataType = ctDouble
      end
      item
        DataField = 'VIGENCIADESDE'
        Title = 'Vigencia Desde'
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -13
    Header.Font.Name = 'Arial'
    Header.Font.Style = [fsBold]
    Left = 32
    Top = 76
  end
end

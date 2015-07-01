object frmCargaTablasSin: TfrmCargaTablasSin
  Left = 21
  Top = 68
  Width = 781
  Height = 400
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Carga de Tablas de Siniestros / CUIT / CUIL'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 597
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  DesignSize = (
    773
    373)
  PixelsPerInch = 96
  TextHeight = 13
  object rgTipoDeTabla: TRadioGroup
    Left = 4
    Top = 3
    Width = 149
    Height = 169
    Caption = ' Tipo de Tabla '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Siniestros &Con Recaida'
      'Siniestros S&in Recaida'
      'C&UIT'
      '&Juicios'
      'CUI&L'
      'C&ontrato')
    ParentFont = False
    TabOrder = 0
    OnClick = rgTipoDeTablaClick
  end
  object btnCargar: TButton
    Left = 4
    Top = 176
    Width = 149
    Height = 25
    Caption = 'Cargar &Grilla'
    TabOrder = 1
    OnClick = btnCargarClick
  end
  object ArtDBGrid1: TArtDBGrid
    Left = 160
    Top = 8
    Width = 610
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsSiniestros
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnPaintFooter = ArtDBGrid1PaintFooter
    TitleHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT / CUIL'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 61
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MP_SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 63
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MP_ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 52
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MP_RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Recaida'
        Width = 50
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MP_NROJUICIO'
        Title.Alignment = taCenter
        Title.Caption = 'Id Juicio'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_DESCRIPCIONERROR'
        Title.Caption = 'Descripci'#243'n del Error'
        Width = 260
        Visible = True
      end>
  end
  object btnCargarTabla: TButton
    Left = 4
    Top = 208
    Width = 149
    Height = 25
    Caption = 'Cargar &Tabla'
    Enabled = False
    TabOrder = 2
    OnClick = btnCargarTablaClick
  end
  object btnSalir: TButton
    Left = 4
    Top = 343
    Width = 149
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Salir'
    TabOrder = 3
    OnClick = btnSalirClick
  end
  object FileReader: TFileReader
    Quote = '"'
    DefaultValue = 'NULL'
    OnReadLine = FileReaderReadLine
    OnReadField = FileReaderReadField
    OnEndParse = FileReaderEndParse
    Fields = <>
    Left = 44
    Top = 235
  end
  object OpenDialog: TOpenDialog
    Left = 16
    Top = 235
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'OpenDialog.FileName')
    StoredValues = <>
    Left = 80
    Top = 235
  end
  object sdqSiniestros: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select *'
      'from Gestion.tmp_TablasSiniestros')
    Left = 236
    Top = 68
  end
  object dsSiniestros: TDataSource
    DataSet = sdqSiniestros
    Left = 264
    Top = 68
  end
  object DBFileReader1: TDBFileReader
    Fields = <>
    Left = 104
    Top = 235
  end
end

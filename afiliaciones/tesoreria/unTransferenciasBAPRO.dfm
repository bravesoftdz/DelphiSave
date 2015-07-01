inherited frmTransferenciasBAPRO: TfrmTransferenciasBAPRO
  Left = 81
  Top = 115
  Width = 710
  Height = 450
  Caption = 'Transferencias BAPRO'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 710
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 702
    Height = 49
    object gbFechaAlta: TGroupBox
      Left = 3
      Top = 1
      Width = 212
      Height = 44
      Caption = 'Fecha de Alta'
      TabOrder = 0
      object Label2: TLabel
        Left = 101
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFAltaDesde: TDateComboBox
        Left = 9
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFAltaHasta
        TabOrder = 0
      end
      object edFAltaHasta: TDateComboBox
        Left = 117
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFAltaDesde
        TabOrder = 1
      end
    end
    object rgTipo: TRadioGroup
      Left = 219
      Top = 1
      Width = 342
      Height = 44
      Caption = 'Tipo'
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        'Pago'
        'Rendici'#243'n'
        'Pago Electr.'
        'Todos')
      TabOrder = 1
    end
    object gbNroArchBAPRO: TGroupBox
      Left = 566
      Top = 1
      Width = 135
      Height = 44
      Caption = 'N'#250'mero Archivo BAPRO'
      TabOrder = 2
      object edNroArchBAPRO: TIntEdit
        Left = 10
        Top = 16
        Width = 114
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Width = 702
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 698
      end>
    inherited ToolBar: TToolBar
      Width = 685
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbVerArchivo: TToolButton
        Left = 383
        Top = 0
        Hint = 'Ver Archivo (Ctrl+A)'
        ImageIndex = 9
        OnClick = tbVerArchivoClick
      end
      object tbVerArchivoExcel: TToolButton
        Left = 406
        Top = 0
        Hint = 'Ver Archivo Excel (Ctrl+X)'
        ImageIndex = 16
        OnClick = tbVerArchivoExcelClick
      end
      object tbCrearArchivo: TToolButton
        Left = 429
        Top = 0
        Hint = 'Crear Archivo (Ctrl+R)'
        ImageIndex = 26
        OnClick = tbCrearArchivoClick
      end
      object tbRendicion: TToolButton
        Left = 452
        Top = 0
        Hint = 'Rendici'#243'n (Ctrl+D)'
        Caption = 'tbRendicion'
        ImageIndex = 15
        OnClick = tbRendicionClick
      end
      object ToolButton1: TToolButton
        Left = 475
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 483
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Width = 702
    Height = 345
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Archivo'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 135
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUDESCARGADO'
        Title.Caption = 'Usuario Descarga'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADESCARGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Descarga'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 69
        Visible = True
      end>
  end
  object fpVerArchivo: TFormPanel [3]
    Left = 143
    Top = 132
    Width = 400
    Height = 250
    FormWidth = 0
    FormHeigth = 0
    Constraints.MinHeight = 250
    Constraints.MinWidth = 400
    object edTexto: TMemo
      Left = 0
      Top = 32
      Width = 400
      Height = 218
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 400
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object CoolBar1: TCoolBar
        Left = 1
        Top = 1
        Width = 398
        Height = 29
        Bands = <
          item
            Control = ToolBar1
            ImageIndex = -1
            MinHeight = 27
            Width = 394
          end>
        object ToolBar1: TToolBar
          Left = 9
          Top = 0
          Width = 381
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbExportarVerArchivo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Guardar como...'
            ImageIndex = 3
            OnClick = tbExportarVerArchivoClick
          end
          object ToolButton30: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object tbSalirVerArchivo: TToolButton
            Left = 31
            Top = 0
            Hint = 'Salir'
            ImageIndex = 5
            OnClick = tbSalirVerArchivoClick
          end
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT AB_PATH, AB_NOMBRE, AB_FECHAALTA, AB_USUDESCARGADO, AB_FE' +
        'CHADESCARGADO,'
      '       AB_TIPO CODTIPO, AB_ID ID'
      '  FROM WEB.WAB_ARCHIVOBAPRO'
      ' WHERE 1 = 2 ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16449
        LinkControl = tbVerArchivo
      end
      item
        Key = 16466
        LinkControl = tbCrearArchivo
      end
      item
        Key = 16452
        LinkControl = tbRendicion
      end
      item
        Key = 16472
        LinkControl = tbVerArchivoExcel
      end>
    Left = 108
    Top = 200
  end
  object sdqConsulta2: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 27
    Top = 328
  end
  object ExportDialog2: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta2
    Fields = <
      item
        DataField = 'REGISTRO'
        Title = 'REGISTRO'
        FixedLength = 965
        FillChar = ' '
      end>
    IniStorage = FormStorage
    Options = [doShowErrors, doAskOverWrite, doAllowModifyFileName, doAllowModifyQuotes, doAllowModifySeparator, doAllowModifyRemoveCR, doAllowModifyRemoveLF, doAllowModifySaveHeaders, doAllowModifyComment]
    Quote = '"'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SaveHeaders = False
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 56
    Top = 328
  end
  object SaveDialogVerArchivo: TSaveDialog
    Left = 96
    Top = 328
  end
  object pmnuImprimir: TPopupMenu
    Left = 26
    Top = 356
    object mnuImpTransf: TMenuItem
      Caption = 'Imprimir Transferencias'
      OnClick = mnuImpTransfClick
    end
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
  end
end

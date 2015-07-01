inherited frmRecepcionSRT: TfrmRecepcionSRT
  Left = 207
  Top = 157
  Width = 544
  Height = 344
  Caption = 'Recepci'#243'n de Archivos SRT'
  Constraints.MinHeight = 344
  Constraints.MinWidth = 544
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 29
    Width = 536
    Height = 39
    Align = alTop
    TabOrder = 6
    DesignSize = (
      536
      39)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Proceso'
    end
    object CmbProceso: TComboBox
      Left = 54
      Top = 12
      Width = 480
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
      OnChange = CmbProcesoChange
      Items.Strings = (
        'CO - Endosos'
        'DE - Determinativas'
        'TR - Transferencias'
        'FG - Fondo de Garant'#237'a'
        'SC - Identificaci'#243'n de Siniestros - SRT'
        'SI - Siniestros - SSN'
        'RT - Emisiones para SSN'
        'BR - Movimientos')
    end
  end
  inherited pnlBusqueda: TPanel
    Width = 536
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 536
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 532
      end>
    inherited ToolBar: TToolBar
      Width = 519
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object tbRecepcion: TToolButton
        Left = 174
        Top = 0
        Hint = 'Recepci'#243'n...'
        Caption = 'tbRecepcion'
        ImageIndex = 3
        OnClick = tbRecepcionClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 71
    Width = 535
    Height = 0
  end
  inherited btnAceptar: TButton
    Left = 382
    Top = 291
    Visible = False
  end
  inherited btnCancelar: TButton
    Left = 460
    Top = 291
    Visible = False
  end
  inherited btnAplicar: TButton
    Left = 303
    Top = 291
    Visible = False
  end
  object pcSRT: TPageControl [7]
    Left = 0
    Top = 68
    Width = 536
    Height = 249
    ActivePage = tbEnvios
    Align = alClient
    TabOrder = 7
    OnChange = CargarGrillas
    object tbEnvios: TTabSheet
      Caption = 'Env'#237'os'
      object GridEnvios: TDBGrid
        Left = 0
        Top = 0
        Width = 528
        Height = 221
        Align = alClient
        DataSource = dsConsulta
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CE_FEPROCESO'
            Title.Caption = 'F. Proceso'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_FEPRESENT'
            Title.Caption = 'F. Presentaci'#243'n'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_ARCHIVO'
            Title.Caption = 'Archivo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_CANTREG'
            Title.Caption = 'Registros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_USUARIO'
            Title.Caption = 'Usuario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Visible = True
          end>
      end
    end
    object tbRespuestas: TTabSheet
      Caption = 'Respuestas'
      ImageIndex = 1
      object GridRespuestas: TDBGrid
        Left = 0
        Top = 0
        Width = 528
        Height = 221
        Align = alClient
        DataSource = dsRespuestas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'RE_FEPROCESO'
            Title.Caption = 'F. Proceso'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RE_FERECEP'
            Title.Caption = 'F. Recepci'#243'n'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RE_ARCHIVO'
            Title.Caption = 'Archivo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RE_PROCESADOS'
            Title.Caption = 'Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RE_ACEPTADOS'
            Title.Caption = 'Acep.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RE_RECHAZADOS'
            Title.Caption = 'Rech.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RE_OBSERVADOS'
            Title.Caption = 'Obs.'
            Visible = True
          end>
      end
    end
    object tbErrores: TTabSheet
      Caption = 'Errores'
      ImageIndex = 2
      object GridErrores: TDBGrid
        Left = 0
        Top = 0
        Width = 528
        Height = 221
        Align = alClient
        DataSource = dsErrores
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'er_FPresentacion'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'identificacion'
            Title.Caption = 'Identificaci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descripcion'
            Title.Caption = 'Descripci'#243'n'
            Visible = True
          end>
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16466
        LinkControl = tbRecepcion
      end>
    Left = 356
    Top = 0
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 300
    Top = 0
  end
  inherited FormStorage: TFormStorage
    Left = 328
    Top = 0
  end
  inherited sdqConsulta: TSDQuery
    Top = 30
  end
  inherited dsConsulta: TDataSource
    Top = 30
  end
  object sdqRespuestas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqRespuestasAfterScroll
    Left = 300
    Top = 58
  end
  object dsRespuestas: TDataSource
    DataSet = sdqRespuestas
    Left = 328
    Top = 58
  end
  object sdqErrores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 300
    Top = 86
  end
  object dsErrores: TDataSource
    DataSet = sdqErrores
    Left = 328
    Top = 86
  end
end

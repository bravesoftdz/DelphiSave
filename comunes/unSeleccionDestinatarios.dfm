inherited frmSeleccionDestinatarios: TfrmSeleccionDestinatarios
  Left = 239
  Top = 113
  BorderIcons = [biSystemMenu]
  Caption = 'Selecci'#243'n de destinatarios de correo'
  ClientHeight = 337
  ClientWidth = 554
  Constraints.MinHeight = 344
  Constraints.MinWidth = 562
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnActivate = FSFormActivate
  OnCloseQuery = FSFormCloseQuery
  ExplicitWidth = 562
  ExplicitHeight = 364
  PixelsPerInch = 96
  TextHeight = 13
  object lbOtrasDirecciones: TLabel [0]
    Left = 92
    Top = 313
    Width = 27
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Otros'
    Visible = False
  end
  object lbExplicacion: TLabel [1]
    Left = 5
    Top = 290
    Width = 545
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 
      'Escriba las direcciones de correo que quiera a'#241'adir a los destin' +
      'atarios seleccionados separadas por punto y coma.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  inherited pnlFiltros: TPanel
    Width = 554
    Height = 5
    Visible = False
    ExplicitWidth = 554
    ExplicitHeight = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 554
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 548
      end>
    ExplicitTop = 5
    ExplicitWidth = 554
    inherited ToolBar: TToolBar
      Width = 541
      ExplicitWidth = 541
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Altas, bajas y modificaciones'
        ImageIndex = 19
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object Label1: TLabel
        Left = 370
        Top = 0
        Width = 18
        Height = 22
        Caption = '      '
      end
      object lbEmpresa: TLabel
        Left = 388
        Top = 0
        Width = 91
        Height = 22
        Caption = 'Contrato N'#186' ??????'
        Layout = tlCenter
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 554
    Height = 253
    Align = alTop
    Anchors = [akLeft, akTop, akBottom]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGO'
        Title.Caption = 'Cargo'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRELECTRONICA'
        Title.Caption = 'Direcci'#243'n de correo'
        Width = 193
        Visible = True
      end>
  end
  object btnAceptar: TButton [5]
    Left = 392
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancelar: TButton [6]
    Left = 472
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  object btnActualizar: TButton [7]
    Left = 8
    Top = 307
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Actualizar'
    TabOrder = 5
    OnClick = btnActualizarClick
  end
  object edOtrasDirecciones: TEdit [8]
    Left = 124
    Top = 309
    Width = 251
    Height = 21
    Hint = 
      'Escriba la o las direcciones de correo que quiera a'#241'adir a los c' +
      'ontactos seleccionados separadas por punto y coma.'
    Anchors = [akLeft, akRight, akBottom]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Visible = False
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EM_ID, EM_NOMBRE, CT_CONTACTO NOMBRE, TB_DESCRIPCION CARG' +
        'O, CT_DIRELECTRONICA DIRELECTRONICA'
      '  FROM CTB_TABLAS, ACO_CONTRATO, AEM_EMPRESA, ACT_CONTACTO'
      ' WHERE TB_CODIGO = CT_CARGO'
      '   AND TB_CLAVE = '#39'CARGO'#39
      '   AND CO_IDEMPRESA = EM_ID'
      '   AND EM_ID = CT_IDEMPRESA'
      '   AND CT_FECHABAJA IS NULL'
      '   AND CT_DIRELECTRONICA IS NOT NULL'
      '   AND CO_CONTRATO = :CONTRATO'
      ' ')
    Left = 52
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 80
    Top = 124
  end
  inherited SortDialog: TSortDialog
    Left = 52
    Top = 152
  end
  inherited ExportDialog: TExportDialog
    Left = 80
    Top = 152
  end
  inherited QueryPrint: TQueryPrint
    Left = 80
    Top = 180
  end
  inherited Seguridad: TSeguridad
    Left = 52
    Top = 96
  end
  inherited FormStorage: TFormStorage
    Left = 80
    Top = 96
  end
  inherited PrintDialog: TPrintDialog
    Left = 52
    Top = 180
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
    Left = 108
    Top = 96
  end
  inherited FieldHider: TFieldHider
    Left = 108
    Top = 124
  end
  object TimerConsulta: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerConsultaTimer
    Left = 204
    Top = 192
  end
end

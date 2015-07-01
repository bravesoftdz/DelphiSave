object frmDetalleDevengadosGrupo: TfrmDetalleDevengadosGrupo
  Left = 388
  Top = 253
  BorderStyle = bsDialog
  Caption = 'Detalle Devengados Grupo'
  ClientHeight = 320
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    465
    320)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparador: TBevel
    Left = 7
    Top = 286
    Width = 453
    Height = 2
  end
  object dbgContratoPeriodo: TArtDBGrid
    Left = 0
    Top = 0
    Width = 465
    Height = 282
    Align = alTop
    Color = clWhite
    DataSource = dsProgramacion
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    FooterBand = False
    TitleHeight = 30
    Columns = <
      item
        Expanded = False
        FieldName = 'RD_FECHADEVENGADO'
        Title.Caption = 'Fecha Devengado'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_DEVENGADO'
        Title.Caption = 'Tipo'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISIONINMEDIATO'
        Title.Caption = 'Modo'
        Width = 130
        Visible = True
      end>
  end
  object btnSalirProcesos: TButton
    Left = 384
    Top = 292
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Salir'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnSalirProcesosClick
  end
  object sdqProgramacion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT   r.rd_idtipodevengado,'
      
        '         decode(r.rd_idtipodevengado, '#39'E'#39', '#39'Estimado'#39', '#39'R'#39', '#39'Def' +
        'initivo'#39') Tipo_Devengado, '
      '         GE_EMISIONINMEDIATO,'
      
        '         Decode(GE_EMISIONINMEDIATO, '#39'N'#39', '#39'No Inmediato'#39', '#39'Inmed' +
        'iato'#39') emisioninmediato,'
      '         rd_fechadevengado       '
      '    FROM emi.ige_grupoemision g, emi.ird_resumendevengado r'
      '   WHERE g.ge_id = :Id'
      '     AND r.rd_idgrupoemision = g.ge_id'
      'ORDER BY rd_fechadevengado desc,rd_idtipodevengado asc'
      '')
    Left = 144
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsProgramacion: TDataSource
    DataSet = sdqProgramacion
    Left = 144
    Top = 136
  end
end

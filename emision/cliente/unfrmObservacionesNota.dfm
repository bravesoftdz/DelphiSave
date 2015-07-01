object frmObservacionesNota: TfrmObservacionesNota
  Left = 256
  Top = 158
  Width = 508
  Height = 353
  BorderIcons = [biSystemMenu]
  Caption = 'Observaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    500
    326)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 5
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object Label2: TLabel
    Left = 4
    Top = 120
    Width = 44
    Height = 13
    Caption = 'Acciones'
  end
  object dbgObservaciones: TRxDBGrid
    Left = 0
    Top = 20
    Width = 498
    Height = 96
    DataSource = dsObservaciones
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nro'
        Title.Caption = 'N'#250'mero'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion'
        Title.Caption = 'Descripci'#243'n'
        Width = 435
        Visible = True
      end>
  end
  object btnCerrar: TButton
    Left = 420
    Top = 298
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cerrar'
    ModalResult = 2
    TabOrder = 1
  end
  object dbgAcciones: TRxDBGrid
    Left = 0
    Top = 136
    Width = 498
    Height = 71
    DataSource = dsAcciones
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ac_descripcion'
        Title.Caption = 'Acci'#243'n'
        Width = 480
        Visible = True
      end>
  end
  object edObservacion: TRxRichEdit
    Left = 0
    Top = 217
    Width = 498
    Height = 72
    Color = 16051436
    ReadOnly = True
    TabOrder = 3
  end
  object dsAcciones: TDataSource
    DataSet = sdqAcciones
    Left = 424
    Top = 156
  end
  object sdqAcciones: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterScroll = sdqAccionesAfterScroll
    SQL.Strings = (
      
        'SELECT iac.ac_descripcion, ts_id, oa_idobservacion, ac_id, OS_SU' +
        'BACCION'
      '  FROM emi.ioa_observacionaccion ioa,'
      '       emi.iac_accion iac,'
      '       emi.ios_observacionsubaccion ios,'
      '       emi.its_textoreferencia its'
      ' WHERE ioa.oa_idobservacion = :idobservacion'
      '   AND iac.ac_id = ioa.oa_idaccion'
      '   AND ios.os_idobservacionaccion = ioa.oa_id'
      '   AND ios.os_idtextoreferencia = its.ts_id'
      '')
    Left = 452
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idobservacion'
        ParamType = ptInput
      end>
  end
  object dsObservaciones: TDataSource
    DataSet = sdqObservaciones
    Left = 424
    Top = 33
  end
  object sdqObservaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterScroll = sdqObservacionesAfterScroll
    SQL.Strings = (
      'SELECT ROWNUM nro,'
      '          ob_descripcion'
      
        '       || DECODE (ob_rechazo, '#39'S'#39', '#39' - En Gesti'#243'n'#39', '#39'G'#39', '#39' - En ' +
        'Gesti'#243'n'#39', '#39#39') descripcion,'
      '       ob_id, ob_rechazo, (SELECT np_idestadoformulario'
      '                             FROM emi.inp_notacontratoperiodo'
      
        '                            WHERE np_id = po_idnotacontratoperio' +
        'do) estado, po_id idobservacionota'
      '  FROM emi.iob_observacion, emi.ipo_notaperiodoobservacion'
      
        ' WHERE ob_id = po_idobservacion AND po_idnotacontratoperiodo = :' +
        'aidnotaperiodo1'
      'UNION'
      'SELECT ROWNUM nro,'
      '          ob_descripcion'
      
        '       || DECODE (ob_rechazo, '#39'S'#39', '#39' - A Gesti'#243'n'#39', '#39'G'#39', '#39' - A Ge' +
        'sti'#243'n'#39', '#39#39') descripcion,'
      '       ob_id, ob_rechazo, (SELECT np_idestadoformulariosim'
      '                             FROM emi.inp_notacontratoperiodo'
      
        '                            WHERE np_id = pt_idnotacontratoperio' +
        'do) estado, pt_id idobservacionota'
      '  FROM emi.iob_observacion, emi.ipt_notaperiodoobstmp'
      
        ' WHERE ob_id = pt_idobservacion AND pt_idnotacontratoperiodo = :' +
        'aidnotaperiodo2')
    Left = 452
    Top = 33
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'aidnotaperiodo1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'aidnotaperiodo2'
        ParamType = ptInput
      end>
  end
end

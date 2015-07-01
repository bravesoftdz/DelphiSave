inherited frmManReportesWeb: TfrmManReportesWeb
  Left = 144
  Top = 181
  Caption = 'Reportes Web'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'RW_ID'
        Title.Caption = 'C'#243'digo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RW_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RW_CABECERA'
        Title.Caption = 'Cabecera'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RW_DETALLE'
        Title.Caption = 'Detalle'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RW_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RW_SOLICITABLE'
        Title.Caption = 'Solicitable'
        Width = 54
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 80
    Width = 389
    Height = 304
    inherited BevelAbm: TBevel
      Top = 267
      Width = 381
    end
    object lbCodigo: TLabel [1]
      Left = 36
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbDescripcion: TLabel [2]
      Left = 15
      Top = 40
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lbDetalle: TLabel [3]
      Left = 36
      Top = 123
      Width = 33
      Height = 13
      Anchors = [akLeft]
      Caption = 'Detalle'
    end
    object lbObservacion: TLabel [4]
      Left = 9
      Top = 195
      Width = 60
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Observaci'#243'n'
    end
    object Label1: TLabel [5]
      Left = 152
      Top = 4
      Width = 224
      Height = 26
      Caption = 
        'Descripci'#243'n: Nombre del tabsheet del excel no '#13#10'puede superar lo' +
        's 26'
    end
    object Label2: TLabel [6]
      Left = 17
      Top = 94
      Width = 52
      Height = 13
      Anchors = [akLeft]
      Caption = 'Propietario'
    end
    inherited btnAceptar: TButton
      Left = 233
      Top = 275
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 308
      Top = 275
      TabOrder = 7
    end
    object edCodigo: TEdit
      Left = 76
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 36
      Width = 303
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSelect = False
      MaxLength = 26
      TabOrder = 1
    end
    object cbTenerCabecera: TCheckBox
      Left = 76
      Top = 64
      Width = 105
      Height = 21
      Caption = 'Tener Cabecera'
      TabOrder = 2
    end
    object cbSolicitable: TCheckBox
      Left = 192
      Top = 64
      Width = 106
      Height = 21
      Caption = 'Solicitable'
      TabOrder = 3
    end
    object edDetalle: TRichEdit
      Left = 76
      Top = 117
      Width = 303
      Height = 71
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
    end
    object edObservacion: TRichEdit
      Left = 76
      Top = 191
      Width = 303
      Height = 69
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 5
    end
    inline fraPropietario: TfraCodigoDescripcion
      Left = 75
      Top = 88
      Width = 305
      Height = 23
      TabOrder = 8
      inherited cmbDescripcion: TArtComboBox
        Left = 101
        Width = 203
      end
      inherited edCodigo: TPatternEdit
        Width = 96
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rw_id, rw_descripcion, rw_cabecera, rw_detalle, rw_observ' +
        'acion,'
      '       rw_solicitable, rw_fechabaja, rw_propietario'
      '  FROM hys.hrw_reporteweb'
      '')
  end
end

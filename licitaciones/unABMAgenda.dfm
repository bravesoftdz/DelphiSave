inherited frmABMAgenda: TfrmABMAgenda
  Left = 304
  Top = 178
  Caption = 'ABM Alertas'
  KeyPreview = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = True
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Licitaci'#243'n:'
    end
    inline fraLicitacion: TfraCodigoDescripcion
      Left = 62
      Top = 8
      Width = 552
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 487
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'LA_FECHAHORA'
        Title.Caption = 'Fecha y Hora'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LA_FECHAHORA'
        Title.Caption = 'Hora'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LA_MOTIVO'
        Title.Caption = 'Motivo'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Responsable'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LA_MAIL'
        Title.Caption = 'E-mail'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LA_ENVIADO'
        Title.Caption = 'Enviado'
        Width = 45
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    inherited BevelAbm: TBevel
      Top = 217
    end
    object lbFD: TLabel [1]
      Left = 8
      Top = 21
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha:'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 53
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Hora:'
    end
    object Label2: TLabel [3]
      Left = 8
      Top = 85
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Motivo:'
    end
    object Label14: TLabel [4]
      Left = 8
      Top = 117
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sector:'
    end
    object Label18: TLabel [5]
      Left = 8
      Top = 149
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Responsable:'
    end
    object Label3: TLabel [6]
      Left = 8
      Top = 181
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-mail:'
    end
    inherited btnAceptar: TButton
      Left = 312
      Width = 72
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 384
      Width = 72
      TabOrder = 7
    end
    object dcFecha: TDateComboBox
      Left = 88
      Top = 16
      Width = 87
      Height = 21
      TabOrder = 0
    end
    object edMotivo: TPatternEdit
      Left = 88
      Top = 80
      Width = 360
      Height = 21
      MaxLength = 60
      TabOrder = 2
    end
    inline fraResponsable: TfraCodigoDescripcion
      Left = 88
      Top = 144
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 295
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        OnExit = fraResponsableedCodigoExit
      end
    end
    inline fraSector: TfraCodigoDescripcion
      Left = 88
      Top = 112
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 295
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        OnExit = fraSectoredCodigoExit
      end
    end
    object edEmail: TEdit
      Left = 88
      Top = 176
      Width = 360
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      MaxLength = 120
      TabOrder = 5
    end
    object dtHora: TDateTimePicker
      Left = 88
      Top = 48
      Width = 80
      Height = 21
      Date = 38733.641018333340000000
      Time = 38733.641018333340000000
      Kind = dtkTime
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM ALA_LICITACIONCONAGENDA'
      ' WHERE LA_IDLICITACION = :Licitacion'
      ' ORDER BY LA_FECHA DESC')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Licitacion'
        ParamType = ptInput
        Value = 0
      end>
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Listado de Alertas'
  end
end

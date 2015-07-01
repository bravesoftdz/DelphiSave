inherited frmCapacitacionResponsable: TfrmCapacitacionResponsable
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Capacitaci'#243'n a Responsables'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      object tbInformarFaltanteTraslado: TToolButton
        Left = 370
        Top = 0
        Hint = 'Informar Datos Faltantes'
        Caption = 'tbInformarFaltanteTraslado'
        ImageIndex = 31
        OnClick = tbInformarFaltanteTrasladoClick
      end
      object Label34: TLabel
        Left = 393
        Top = 0
        Width = 33
        Height = 22
        Caption = '     (11)'
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CR_FECHA'
        Title.Caption = 'Fecha Cap.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_INSTITUCION'
        Title.Caption = 'Instituci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_PROFESIONAL'
        Title.Caption = 'Profesional'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_HORASCATEDRA'
        Title.Caption = 'H.C'#225'tedra'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 96
    Width = 507
    Height = 359
    BorderStyle = bsDialog
    DesignSize = (
      507
      359)
    inherited BevelAbm: TBevel
      Top = 323
      Width = 499
    end
    object Label14: TLabel [1]
      Left = 10
      Top = 14
      Width = 95
      Height = 13
      Caption = 'Fecha Capacitaci'#243'n'
    end
    object Label32: TLabel [2]
      Left = 10
      Top = 41
      Width = 99
      Height = 13
      Caption = 'Instituci'#243'n de la Cap.'
    end
    object Label13: TLabel [3]
      Left = 10
      Top = 67
      Width = 103
      Height = 13
      Caption = 'Profesional de la Cap.'
    end
    object Label25: TLabel [4]
      Left = 10
      Top = 93
      Width = 68
      Height = 13
      Caption = 'Horas C'#225'tedra'
    end
    inherited btnAceptar: TButton
      Left = 349
      Top = 329
    end
    inherited btnCancelar: TButton
      Left = 427
      Top = 329
    end
    object edFechaCapacitacion: TDateComboBox
      Left = 115
      Top = 11
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edInstitucion: TEdit
      Left = 115
      Top = 37
      Width = 295
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
    end
    object edProfesionalCap: TEdit
      Left = 115
      Top = 63
      Width = 295
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 4
    end
    object edHorasCatedra: TIntEdit
      Left = 115
      Top = 89
      Width = 57
      Height = 21
      TabOrder = 5
      MaxLength = 3
    end
    object Panel1: TPanel
      Left = 7
      Top = 116
      Width = 492
      Height = 200
      TabOrder = 6
      object HeaderControl2: THeaderControl
        Left = 1
        Top = 1
        Width = 490
        Height = 17
        Sections = <
          item
            AutoSize = True
            ImageIndex = -1
            Text = 'Descripci'#243'n'
            Width = 490
          end>
      end
      object lstItemsCapacitacion: TJvgAskListBox
        Left = 1
        Top = 18
        Width = 490
        Height = 181
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 1
        OnKeyDown = lstItemsCapacitacionKeyDown
        OnKeyUp = lstItemsCapacitacionKeyUp
        GlyphsAlign.Vertical = fvaCenter
        ItemStyle.BtnColor = clBtnFace
        ItemStyle.BtnFont.Charset = DEFAULT_CHARSET
        ItemStyle.BtnFont.Color = clWindowText
        ItemStyle.BtnFont.Height = -11
        ItemStyle.BtnFont.Name = 'MS Sans Serif'
        ItemStyle.BtnFont.Style = []
        ItemStyle.BtnTextStyle = fstPushed
        ItemStyle.Color = clBtnFace
        ItemStyle.DelineateColor = clBlack
        ItemStyle.Font.Charset = DEFAULT_CHARSET
        ItemStyle.Font.Color = clWindowText
        ItemStyle.Font.Height = -11
        ItemStyle.Font.Name = 'MS Sans Serif'
        ItemStyle.Font.Style = []
        ItemStyle.Bevel.Inner = bvSpace
        ItemStyle.Bevel.Outer = bvNone
        ItemStyle.Bevel.Sides = [fsdTop]
        ItemStyle.Bevel.Bold = False
        ItemStyle.TextStyle = fstNone
        ItemSelStyle.BtnColor = clBtnFace
        ItemSelStyle.BtnFont.Charset = DEFAULT_CHARSET
        ItemSelStyle.BtnFont.Color = clWindowText
        ItemSelStyle.BtnFont.Height = -11
        ItemSelStyle.BtnFont.Name = 'MS Sans Serif'
        ItemSelStyle.BtnFont.Style = []
        ItemSelStyle.BtnTextStyle = fstNone
        ItemSelStyle.Color = clWindow
        ItemSelStyle.DelineateColor = clBlack
        ItemSelStyle.Font.Charset = DEFAULT_CHARSET
        ItemSelStyle.Font.Color = clBlack
        ItemSelStyle.Font.Height = -11
        ItemSelStyle.Font.Name = 'MS Sans Serif'
        ItemSelStyle.Font.Style = []
        ItemSelStyle.Bevel.Inner = bvLowered
        ItemSelStyle.Bevel.Outer = bvNone
        ItemSelStyle.Bevel.Bold = False
        ItemSelStyle.TextStyle = fstNone
        TextAlign.Vertical = fvaCenter
        TransparentColor = clOlive
        Buttons.Strings = (
          'No'
          'Si')
        Options = []
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select *'
      'from hys.hcr_capacitacionresp'
      'where cr_idinforme = :idinforme')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idinforme'
        ParamType = ptInput
      end>
  end
  object sdqCapacitacionItems: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ic_id, ic_codigo, ic_descripcion, ip_id, ip_respuesta'
      '    FROM hys.hip_itemcapacitado, hys.hic_itemscapacitacion'
      '   WHERE ip_iditemcapacitado(+) = ic_id'
      '     AND ic_fechabaja IS NULL'
      '     AND ip_fechabaja(+) IS NULL'
      '     AND ip_idcapacitacion(+) = :idcapacitacion'
      'ORDER BY TO_NUMBER(ic_codigo)')
    Left = 320
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcapacitacion'
        ParamType = ptInput
      end>
  end
end

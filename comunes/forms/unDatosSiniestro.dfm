object frmDatosSiniestro: TfrmDatosSiniestro
  Left = 206
  Top = 169
  Width = 600
  Height = 364
  BorderIcons = [biMinimize]
  Caption = 'Datos del Siniestro'
  Color = clBtnFace
  Constraints.MaxHeight = 364
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 364
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  DesignSize = (
    592
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalir: TSpeedButton
    Left = 500
    Top = 304
    Width = 87
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Salir     '
    Flat = True
    Glyph.Data = {
      36080000424D360800000000000036000000280000002A000000100000000100
      18000000000000080000C40E0000C40E0000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF001010
      1010101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0016161616161600FF0000FF0000FF00161616
      16161600FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00101010007F7F10101000FF0000FF001010
      10007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0016161696969616161600FF0000FF00161616
      96969616161600FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00101010009090007F7F10101000FF001010
      10009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600FF00161616
      A1A1A196969616161600FF0000FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F1010101010
      1000CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A1969696161616161616
      AAAAAAA1A1A196969616161600FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F1010
      1000FFFF00CFCF009090007F7F10101000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A1969696161616
      B8B8B8AAAAAAA1A1A196969616161600FF0000FF0000FF000000002F2F101010
      10101010101010101010101010101010101000FFFF00FFFF00CFCF009090007F
      7F10101000FFFF00CFCF009090007F7F10101000FF0000FF0016161616161616
      1616161616161616161616161616161616B8B8B8B8B8B8AAAAAAA1A1A1969696
      161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF000000002F2F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F2FFFFF00FFFF00FFFF00CFCF0090
      90007F7F10101000FFFF00CFCF009090007F7F10101000FF0000333396969696
      9696969696969696969696969696969696C1C1C1B8B8B8B8B8B8AAAAAAA1A1A1
      969696161616B8B8B8AAAAAAA1A1A196969616161600FF000000002F2F60FFFF
      60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF60FFFF2FFFFF00FFFF00FFFF00CF
      CF009090007F7F10101000FFFF00CFCF009090007F7F101010003333CACACACA
      CACACACACACACACACACACACACACACACACACACACAC1C1C1B8B8B8B8B8B8AAAAAA
      A1A1A1969696161616B8B8B8AAAAAAA1A1A19696961616160000002F2F90FFFF
      EFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FFEFF0FF00FF
      FF00CFCF007F7F002F2FEFF0FF00FFFF00CFCF007F7F002F2F003333B8B8B8B8
      B8B8E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B8B8B8
      AAAAAA969696003333E3E3E3B8B8B8AAAAAA9696960033330000002F2FCFFFFF
      CFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFEFF0FF2FFFFF00FF
      FF007F7F002F2FEFF0FF2FFFFF00FFFF007F7F002F2F00FF00003333DADADADA
      DADADADADADADADADADADADADADADADADADADADADADADAE3E3E3C1C1C1B8B8B8
      969696003333E3E3E3C1C1C1B8B8B896969600333300FF000000002F2F002F2F
      002F2F002F2F002F2F002F2F002F2F002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F
      7F002F2FEFF0FFCFFFFF2FFFFF007F7F002F2F00FF0000FF0000333300333300
      3333003333003333003333003333003333DADADAF1F1F1DADADAC1C1C1969696
      003333F1F1F1DADADAC1C1C196969600333300FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F002F
      2FCFFFFFCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF00003333DADADADADADADADADA969696003333
      DADADADADADADADADA96969600333300FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F002F
      2FCFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF00003333DADADADADADA969696003333003333
      DADADADADADA96969600333300FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF00002F
      2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF00003333DADADA96969600333300FF00003333
      DADADA96969600333300FF0000FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00002F2F007F7F002F2F00FF0000FF00002F
      2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000333396969600333300FF0000FF00003333
      96969600333300FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000FF0000FF00002F
      2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000333300333300FF0000FF0000FF00003333
      00333300FF0000FF0000FF0000FF0000FF0000FF0000FF000000}
    Layout = blGlyphRight
    NumGlyphs = 2
    OnClick = btnSalirClick
  end
  object pnlFondo: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 303
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      592
      303)
    object pnlEmpresa: TPanel
      Left = 4
      Top = 4
      Width = 584
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        584
        29)
      object lbEmpresa: TLabel
        Left = 4
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object pnlCUIT: TPanel
        Left = 60
        Top = 4
        Width = 85
        Height = 21
        BevelOuter = bvLowered
        Caption = '88-88888888-8'
        TabOrder = 0
      end
      object pnlContrato: TPanel
        Left = 148
        Top = 4
        Width = 53
        Height = 21
        BevelOuter = bvLowered
        Caption = '88888888'
        TabOrder = 1
      end
      object pnlRSocial: TPanel
        Left = 204
        Top = 4
        Width = 376
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        Caption = 'XXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXO'
        TabOrder = 2
      end
    end
    object pnlTrabajador: TPanel
      Left = 4
      Top = 36
      Width = 584
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        584
        29)
      object lbSinTrabajador: TLabel
        Left = 4
        Top = 8
        Width = 53
        Height = 13
        Caption = 'Trabajador'
      end
      object pnlCUIL: TPanel
        Left = 60
        Top = 4
        Width = 85
        Height = 21
        BevelOuter = bvLowered
        Caption = '88-88888888-8'
        TabOrder = 0
      end
      object pnlNombre: TPanel
        Left = 148
        Top = 4
        Width = 432
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        Caption = 'XXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXO'
        TabOrder = 1
      end
    end
    object pnlDatosSini: TPanel
      Left = 4
      Top = 68
      Width = 584
      Height = 230
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      DesignSize = (
        584
        230)
      object Siniestro: TLabel
        Left = 4
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Siniestro'
      end
      object lbSinDiagnostico: TLabel
        Left = 4
        Top = 183
        Width = 55
        Height = 13
        Caption = 'Diagn'#243'stico'
      end
      object lbSinTipo: TLabel
        Left = 168
        Top = 8
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object lbSinEstado: TLabel
        Left = 420
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object lbSinPrestador: TLabel
        Left = 4
        Top = 207
        Width = 47
        Height = 13
        Caption = 'Prestador'
      end
      object lbSinFechAcci: TLabel
        Left = 4
        Top = 159
        Width = 53
        Height = 13
        Caption = 'Fecha Acc.'
      end
      object lbSinRecaida: TLabel
        Left = 148
        Top = 159
        Width = 38
        Height = 13
        Caption = 'Reca'#237'da'
      end
      object Label1: TLabel
        Left = 4
        Top = 32
        Width = 54
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object Label2: TLabel
        Left = 1
        Top = 98
        Width = 63
        Height = 52
        Caption = 'Mecanismo '#13#10'descripto por'#13#10'auditor en'#13#10'consultorio'
      end
      object Panel1: TPanel
        Left = 64
        Top = 30
        Width = 516
        Height = 66
        BevelOuter = bvLowered
        TabOrder = 10
        object edDescripcion: TMemo
          Left = 1
          Top = 1
          Width = 514
          Height = 64
          TabStop = False
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlSiniestro: TPanel
        Left = 64
        Top = 4
        Width = 53
        Height = 21
        BevelOuter = bvLowered
        Caption = '88888888'
        TabOrder = 0
      end
      object pnlOrden: TPanel
        Left = 120
        Top = 4
        Width = 21
        Height = 21
        BevelOuter = bvLowered
        Caption = '888'
        TabOrder = 1
      end
      object pnlRecaida: TPanel
        Left = 144
        Top = 4
        Width = 17
        Height = 21
        BevelOuter = bvLowered
        Caption = '88'
        TabOrder = 2
      end
      object pnlDiagnostico: TPanel
        Left = 64
        Top = 179
        Width = 516
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        Caption = 
          'XXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXX' +
          'XXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXX' +
          'XOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXX' +
          'XXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXO'
        TabOrder = 3
      end
      object pnlTipo: TPanel
        Left = 196
        Top = 4
        Width = 217
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'XXXXXXXXXOXXXXXXXXXOXXXXXXXXXO'
        TabOrder = 4
      end
      object pnlEstado: TPanel
        Left = 456
        Top = 4
        Width = 124
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        Caption = 'XXXXXXXXXOXXXXXXXXXOXXXXXXXXXO'
        TabOrder = 5
      end
      object pnlNombrePrestador: TPanel
        Left = 152
        Top = 203
        Width = 428
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvLowered
        Caption = 
          'XXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXX' +
          'XXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXX' +
          'XOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXX' +
          'XXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXOXXXXXXXXXO'
        TabOrder = 6
      end
      object pnlCUITPrestador: TPanel
        Left = 64
        Top = 203
        Width = 85
        Height = 21
        BevelOuter = bvLowered
        Caption = '88-88888888-8'
        TabOrder = 7
      end
      object pnlFAccidente: TPanel
        Left = 64
        Top = 155
        Width = 77
        Height = 21
        BevelOuter = bvLowered
        Caption = '88/88/8888'
        TabOrder = 8
      end
      object pnlFRecaida: TPanel
        Left = 196
        Top = 155
        Width = 77
        Height = 21
        BevelOuter = bvLowered
        Caption = '88/88/8888'
        TabOrder = 9
      end
      object pnlMecanismoAccid: TPanel
        Left = 64
        Top = 99
        Width = 516
        Height = 51
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 11
        object memoMecanismoAccid: TMemo
          Left = 1
          Top = 1
          Width = 514
          Height = 49
          TabStop = False
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          MaxLength = 250
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ex_siniestro, ex_orden, ex_recaida, art.SIN.gettipo(ex_ti' +
        'po) tipo, mp_nombre, mp_contrato, ex_cuit, tj_nombre,'
      
        '       ex_cuil, ex_fechaaccidente, ex_fecharecaida, ex_altamedic' +
        'a, ca_clave, ca_descripcion, ex_diagnostico,'
      
        '       tb_descripcion estado, ex_brevedescripcion, ex_mecanismoa' +
        'ccid'
      
        '  FROM sex_expedientes, ctb_tablas, ctj_trabajador, cmp_empresas' +
        ', cpr_prestador'
      ' WHERE ex_cuit = mp_cuit'
      '   AND ex_cuil = tj_cuil(+)'
      
        '   AND cpr_prestador.ROWID(+) = art.SIN.get_prestadorid(ex_sinie' +
        'stro, ex_orden, ex_recaida)'
      '   AND ex_estado = tb_codigo'
      '   AND tb_clave = '#39'SIEST'#39
      '   AND ex_siniestro = :psiniestro'
      '   AND ex_orden = :porden'
      '   AND ex_recaida = :precaida'
      '')
    Left = 14
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
    object sdqDatosEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqDatosEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqDatosEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqDatosMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Size = 60
    end
    object sdqDatosEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqDatosTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqDatosEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqDatosEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqDatosEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object sdqDatosEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqDatosCA_CLAVE: TStringField
      FieldName = 'CA_CLAVE'
      Size = 11
    end
    object sdqDatosCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqDatosEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosMP_CONTRATO: TFloatField
      FieldName = 'MP_CONTRATO'
    end
    object sdqDatosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 4000
    end
    object sdqDatosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqDatosEX_BREVEDESCRIPCION: TStringField
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqDatosEX_MECANISMOACCID: TStringField
      FieldName = 'EX_MECANISMOACCID'
      Size = 250
    end
  end
end
